{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pyright # static type checker
    ruff # keep it here because I have no settings to set
  ];

  programs = {
    # astral-sh tools
    ty.enable = true; # static type checker
    # ruff.enable = true; # formatter / linter 
    uv.enable = true; # package / project manager
  };
}
