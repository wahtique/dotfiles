#!/usr/bin/env zsh

LOG_LEVEL=${LOG_LEVEL:-info}
GUM_LOG_LEVEL=$LOG_LEVEL
GUM_LOG_TIME_FORMAT="15:04:05.000"

GUM_AVAILABLE=false
if command -v gum >/dev/null 2>&1; then
  GUM_AVAILABLE=true
fi

# Convert space-separated key-value pairs to key=value format
# Input: "hello world name john"
# Output: "hello=world name=john"
function _format_pairs() {
  local args=("$@")
  local result=""
  for ((i=1; i<${#args[@]}; i+=2)); do
    if ((i < ${#args[@]})); then
      result+="${args[$i]}=${args[$((i+1))]} "
    fi
  done
  echo "${result% }"
}

function _debug() {
  if $GUM_AVAILABLE; then
    gum log --time $GUM_LOG_TIME_FORMAT --level debug --min-level $GUM_LOG_LEVEL --structured $@ 
  else
    if [[ "$LOG_LEVEL" == "debug" ]]; then
      echo "DEBUG: $1 $(_format_pairs "$@")"
    fi
  fi
}

# Log depending on whether gum is available or not
# if available, log first arg and use the otthers as structured data, 
# otherwise just print the first arg
function _info() {
  if $GUM_AVAILABLE; then
    gum log --time $GUM_LOG_TIME_FORMAT --level info --min-level $GUM_LOG_LEVEL --structured $@
  else
    echo "INFO: $1 $(_format_pairs "$@")"
  fi
}

function _error() {
  if $GUM_AVAILABLE; then
    gum log --time $GUM_LOG_TIME_FORMAT --level error --min-level $GUM_LOG_LEVEL --structured $@
  else
    echo "ERROR: $1 $(_format_pairs "$@")" >&2
  fi
}

# Run a taskl with reporting
# first arg is the task name, the rest is the command to run
function _task() {
  if $GUM_AVAILABLE; then
    _info "$1 : start"
    gum spin --show-output --show-error --show-stderr --title "$1..." -- ${@:2}
    _info "$1 : done"
  else
    echo "$1 : start"
    ${@:2}
    echo "$1 : done"
  fi
}

# Ask for confirmation, return true if confirmed, false otherwise
# Default to false, with a timeout of 5 seconds
# First arg is the question
function _confirm() {
  if $GUM_AVAILABLE; then
    return $(gum confirm "$1" --default=no --timeout=5s)
  else
    read -q -t 5 "CONFIRMATION?$1 [y/N] " 
    if [[ $CONFIRMATION =~ ^[Yy]$ ]]; then 
      return 0
    else
      return 1
    fi
  fi
}