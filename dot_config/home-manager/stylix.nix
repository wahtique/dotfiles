{ pkgs, ... }:
let
  stylix = builtins.fetchTarball "https://github.com/nix-community/stylix/archive/master.tar.gz";
in
{
  home.packages = [
    (pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
      winDecStyles = [ "modern" ];
    })
  ];
  imports = [ (import stylix).homeModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      vim.enable = false;
      neovim.enable = false;
      gtk.enable = false;
      gnome.enable = false;
      kde = {
        enable = true;
        decorations = "CatppuccinMocha-Modern";
      };
    };
  };
}
