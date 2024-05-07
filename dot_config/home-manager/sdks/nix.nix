{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil # nix lsp
    nixfmt-classic # opinionated formatter
    cachix # derivation caching
  ];
}
