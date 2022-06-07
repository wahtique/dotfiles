#!/usr/bin/env zsh

if [[ $(fc-list | grep -i "Powerline" | wc -l) -eq 0 ]]; then
    echo "Installing Powerline patched fonts..."
    workspace="/tmp/powerline-install-space"
    mkdir -p $workspace
    cd $workspace
    git clone git@github.com:powerline/fonts.git
    cd fonts
    ./install.sh
else 
    echo "Powerline patched fonts already installed"
fi