{ pkgs, ... }:
{
  programs = {
    kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      enableGitIntegration = true;
      font = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NF";
      };
      keybindings = {
        "ctrl+shift+n" = "launch --cwd=current";
      };
      settings = {
        enable_audio_bell = false;
        enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      };
      themeFile = "catppuccin_mocha.conf";
    };
  };
}
