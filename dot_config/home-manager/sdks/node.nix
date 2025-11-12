{ pkgs, ... }: {
  home.packages = with pkgs; [
    # nodejs
    nodePackages.npm
    corepack_latest
    cypress
  ];
}
