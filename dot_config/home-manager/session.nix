{ config, pkgs, ... }:

{
  home = {
    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/$USERNAME/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    sessionVariables = {
      EDITOR = "vim";
      SBT_OPTS = "-Xms1g -Xmx4g -Xss8M -XX:ReservedCodeCacheSize=256m -XX:+UseParallelGC";
      # intellij options
      IDE_VM_OPTIONS = "-Xmx2048m";
    };

    sessionPath = [
      # coursier + g8
      "$HOME/.local/share/coursier/bin"      
      # alternative bin
      "$HOME/.local/bin"
      # golang
      "/usr/local/go/bin"
      # go binaries
      "$HOME/go/bin"
      # solidity stuff 
      "$HOME/.bifrost/bin"
      # npm packages
      "$HOME/.npm-packages/bin"
      # tools
      "$HOME/tools"
    ];
  };
}

