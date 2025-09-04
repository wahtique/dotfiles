{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode;
    };
  };
  stylix.targets.vscode.enable = false;
}
