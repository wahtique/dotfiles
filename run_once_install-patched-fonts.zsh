#!/usr/bin/env zsh

if [[ $(fc-list | grep -i "Nerd Font" | wc -l) -eq 0 ]]; then
    accepted_choices=('y' 'n')
    choice=''
    while [[ $accepted_choices[(I)$choice] -eq 0 ]]; do
      choice=''
      vared -p 'Install patched Nerd Fonts ? [y/n] : ' -c choice
    done
    if [[ $choice = 'y' ]]; then
      echo "Installing Powerline patched fonts..."
      workspace="/tmp/powerline-install-space"
      mkdir -p $workspace
      cd $workspace
      git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git 
      cd nerd-fonts
      ./install.sh
    fi
else 
    echo "Powerline patched fonts already installed"
fi
