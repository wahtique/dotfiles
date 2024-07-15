# fixes ( among others ) for forward/backward word movements
zinit ice lucid atload'bindkey -v' src'editor/editor.plugin.zsh'
zinit load belak/zsh-utils

# autopair delimiters for zsh
zinit ice wait lucid pick'autopair.zsh'
zinit load hlissner/zsh-autopair
# direnv
zinit load ptavares/zsh-direnv
# git aliases
# some aliases are overriden by forgit
zinit snippet OMZP::git

# add colors to `man`
zinit light ael-code/zsh-colored-man-pages
# ssh agent
# zinit ice use"ssh-agent.zsh" from"github"
# zinit load bobsoppe/zsh-ssh-agent

# generate autocompletes from `--help` for most cli tools
zinit ice wait'1' lucid
zinit load dim-an/cod

# FZF dependent plugins

#fzf for tab completion
zinit ice has"fzf"
zinit light Aloxaf/fzf-tab
# A zsh plugin to search in the local tree of subdirectories for files
# ALT+R to search hand Read
# ALT+E to search and Edit
zinit ice wait lucid has'fzf' pick'fzf-finder.plugin.zsh'
zinit light leophys/zsh-plugin-fzf-finder

# alias finder
zinit ice wait lucid has"fzf"
zinit light akash329d/zsh-alias-finder
# git fzf
zinit ice wait lucid has"fzf"
zinit load wfxr/forgit

# better cd
# `cd` => interactive search
# `cd -` => search last 10 visited
# `cd .` => search in current dir
# export ENHANCD_FILTER='fzf --ansi --height=~60% --info=inline --color=dark'
# zinit ice wait lucid has"fzf"
# zinit load "b4b4r07/enhancd"

# ssh completion using $HOME/.ssh/config
zinit light sunlei/zsh-ssh

# fix for broken history 
# leave it before syntax highlighting plugin to not break 
# syntax highlighting in history search 
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

zinit ice pick'cli.zsh'
zinit light sudosubin/zsh-github-cli

zinit light zdharma-continuum/fast-syntax-highlighting

# auto expand aliases
export ZPWR_EXPAND_BLACKLIST=(x cz ls cd)
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-expand

# aliases tips
zinit ice from'gh-r' as'program'
zinit light decayofmind/zsh-fast-alias-tips

# zoxide 
# ALT + \ for interactive zoxide query
zle -N __zoxide_zi
bindkey '^[\\' __zoxide_zi

zinit ice atclone"./zplug.zsh" atpull"%atclone"
zinit light g-plane/pnpm-shell-completion