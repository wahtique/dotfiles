{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
        hash = "sha256-zoe2E9xlpAME4QD8IagicbAj71g3cA9XlymQQQMFJLo=";
        plat = "linux-x64";
        archive_fmt = "tar.gz";
        version = "1.116.0";
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
