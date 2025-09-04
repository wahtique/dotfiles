{ ... }:
{
  programs = {
    kitty = {
      # package broken due to opengl incompatibility
      # switching to system packaged one temporarilly 
      enable = false;
      shellIntegration.enableZshIntegration = true;
      keybindings = {
        "ctrl+shift+n" = "launch --cwd=current";
      };
      settings = {
        # set font family
        # kitty.font.name break config
        font_family = "'JetBrainsMono NF'";
        enable_audio_bell = false;
        enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      };
      # import theme file with cz
      # packaged does not seem to be maintained
      extraConfig = ''
        include catppuccin_mocha.conf
      '';
    };
  };
}
