{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      # override package until unstable catches up
      # package = pkgs.vscode.overrideDerivation (
      #   oldAttrs:
      #   let
      #     # hash = "sha256-ST5i8gvNtAaBbmcpcg9GJipr8e5d0A0qbdG1P9QViek=";
      #     version = "1.109.2";
      #     plat = "linux-x64";
      #     archive_fmt = "tar.gz";
      #   in
      #   {
      #     src = builtins.fetchurl {
      #       name = "VSCode_${version}_${plat}.${archive_fmt}";
      #       url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
      #       # inherit hash;
      #     };

      #   }
      # );
      package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
        hash = "sha256-ST5i8gvNtAaBbmcpcg9GJipr8e5d0A0qbdG1P9QViek=";
        plat = "linux-x64";
        archive_fmt = "tar.gz";
        version = "1.109.2";
        src = pkgs.fetchurl {
          name = "VSCode_${version}_${plat}.${archive_fmt}";
          url = "https://update.code.visualstudio.com/${version}/${plat}/stable";
          inherit hash;
        };
      });
    };
  };
  stylix.targets.vscode.enable = false;
}
