#!/usr/bin/env zsh

banner NIX

# update nix packages
if command -v nix-channel >/dev/null 2>&1; then
  nix-channel --update
fi

# build new derivation
if command -v home-manager >/dev/null 2>&1; then
  home-manager switch
fi

# cleanup old generations
if command -v nix-collect-garbage >/dev/null 2>&1; then
  nix-collect-garbage --delete-older-than 30d
fi

# init shell

source ~/.zshrc

# update zi then update zsh plugins
if command -v zi >/dev/null 2>&1; then
  banner ZI
  zi self-update -n
  zi update --all --reset -q -n
fi

banner DONE

