{ pkgs, ... }:
let
  stylix = builtins.fetchTarball "https://github.com/nix-community/stylix/archive/master.tar.gz";
in
{
  imports = [ (import stylix).homeModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      # todo : configure this with nixvim
      vim.enable = false;
      neovim.enable = false;
      # todo : mk this work 
      # currently config is always overridden by kde
      gtk.enable = false;
      gnome.enable = false;
    };
  };
}
