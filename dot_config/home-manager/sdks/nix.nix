{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil # nix lsp
    nixfmt # opinionated formatter
    cachix # derivation caching
    nh # nix helper
    nix-output-monitor # nom
    nix-init # generate nix pkg from url
    nix-tree # browse dep graph of derivation
    nix-sweep # cleanup old generations and gc roots
    nix-update # update version / hash of nix package
    nurl # generate nix fetcher from url
  ];
  programs = {
    nix-your-shell = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
