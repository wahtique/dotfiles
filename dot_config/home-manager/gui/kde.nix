{ pkgs, ... }:
{
  home.packages = [
    (pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "pink" ];
      winDecStyles = [ "modern" ];
    })
  ];
  stylix = {
    targets = {
      kde = {
        enable = true;
        decorations = "CatppuccinMocha-Modern";
      };
    };
  };
}
