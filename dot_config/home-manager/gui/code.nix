{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode.overrideAttrs (oldAttrs: rec {
        hash = "sha256-fTpXK5cbhyZqG4cW28K8XRd/QU9zerydWnLzFuhA9NE=";
        plat = "linux-x64";
        archive_fmt = "tar.gz";
        version = "1.109.3";
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
