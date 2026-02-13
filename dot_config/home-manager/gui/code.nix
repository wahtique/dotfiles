{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      # override package until unstable catches up
      package = pkgs.vscode.overrideDerivation (oldAttrs: {
        name = "VSCode_1.109.2_x86_64-linux.tar.gz";
        url = "https://update.code.visualstudio.com/1.109.2/x86_64-linux/stable";
        hash = "sha256-ST5i8gvNtAaBbmcpcg9GJipr8e5d0A0qbdG1P9QViek=";
      });
    };
  };
  stylix.targets.vscode.enable = false;
}
