{ pkgs, ... }: {
  home.packages = with pkgs; [
    ruff
    uv
  ];
}
