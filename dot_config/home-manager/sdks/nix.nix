{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil # nix lsp
    nixfmt-rfc-style # opinionated formatter
    cachix # derivation caching
    nh # nix helper
    nix-output-monitor # nom
  ];
}
