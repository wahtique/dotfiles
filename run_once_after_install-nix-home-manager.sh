#!/usr/bin/env zsh

if ! command -v nix >/dev/null 2>&1; then
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
fi

if ! command -v home-manager >/dev/null 2>&1; then
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi