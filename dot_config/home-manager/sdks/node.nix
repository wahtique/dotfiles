{ pkgs, ... }: {
  home.packages = with pkgs; [
    # nodejs
    nodePackages.npm
    nodePackages.ts-node
    corepack_latest
    cypress
  ];
}
