{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pyright # static type checker
    # astral-sh tools
    ruff # formatter / linter 
    ty # static type checker
    uv # package / project manager
  ];
}
