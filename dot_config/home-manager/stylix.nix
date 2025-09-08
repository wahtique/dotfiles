{ pkgs, lib, config, ... }:
let
  stylix = builtins.fetchTarball "https://github.com/nix-community/stylix/archive/master.tar.gz";
in
{
  home.activation = {
    # gtk backup files fomr previous generations can randomly be left behind
    # which makes the build fail
    # clean those up before writing the new config
    cleanGtkBackups = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
      rm -f $HOME/.gtkrc-2.0.backup
      rm -f $HOME/.config/gtk-4.0/*.backup
      rm -f $HOME/.config/gtk-3.0/*.backup
    '';
  };
  imports = [ (import stylix).homeModules.stylix ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF";
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };
    targets = {
      # todo : configure this with nixvim
      vim.enable = false;
      neovim.enable = false;
    };
  };
}
