{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      # override package until unstable catches up
      package = pkgs.vscode.overrideDerivation (oldAttrs: {
        hash ="sha256-ST5i8gvNtAaBbmcpcg9GJipr8e5d0A0qbdG1P9QViek=";
        version = "1.109.2";
        rev = "591199df409fbf59b4b52d5ad4ee0470152a9b31";
      });
    };
  };
  stylix.targets.vscode.enable = false;
}
