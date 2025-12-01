{ pkgs, ... }: {
  home.packages = with pkgs; [
    corepack
    cypress
  ];
}
