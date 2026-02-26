{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs-slim
    pnpm
    cypress
  ];
}
