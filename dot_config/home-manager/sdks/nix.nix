{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil # nix lsp
    nixfmt # opinionated formatter
    cachix # derivation caching
  ];
}
