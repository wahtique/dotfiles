#!/usr/bin/env zsh

if [[ $+ZPLUG_BIN -eq 0 ]]; then 
    echo "Installing Zplug..."
    $ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
else 
    echo "Zplug already installed"
fi