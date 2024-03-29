#!/usr/bin/env zsh

if command -v toilet >/dev/null 2>&1; then
  toilet -F border UPDATING
fi

if command -v nix >/dev/null 2>&1; then
  # possibly not avaialable on first run
  if command -v banner >/dev/null 2>&1; then
    toilet NIX
  else
    echo "############ NIX ############"  
  fi
  # update nix packages
  nix-channel --update
  # cleanup old generations
  nix-collect-garbage --delete-older-than 30d

fi

# build new derivation
if command -v home-manager >/dev/null 2>&1; then
  toilet HOME
  home-manager switch
fi

# init shell
#
source ~/.zshrc

# update zi then update zsh plugins
if command -v zi >/dev/null 2>&1; then
  toilet ZI
  zi self-update -n
  zi update --all --reset -q -n
  echo "\n"
fi

toilet -F border DONE

