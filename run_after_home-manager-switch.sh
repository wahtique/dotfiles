#!/usr/bin/env zsh

if command -v nix-channel >/dev/null 2>&1; then
  nix-channel --update
fi

if command -v home-manager >/dev/null 2>&1; then
  home-manager switch
fi

if command -v nix-collect-garbage >/dev/null 2>&1; then
  nix-collect-garbage --delete-older-than 30d
fi
