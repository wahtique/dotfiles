#!/usr/bin/env zsh

if command -v nix-channel >/dev/null 2>&1; then
  nix-channel --update
fi

if command -v home-manager >/dev/null 2>&1; then
  home-manager switch
fi
