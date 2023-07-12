#!/usr/bin/env zsh

# install home manager if not found
if ! command -v home-manager >/dev/null 2>&1; then
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi