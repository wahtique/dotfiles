{
  home = {
    sessionVariables = {
      EDITOR = "vim";
      SBT_OPTS =
        "-Xms1g -Xmx4g -Xss8M -XX:ReservedCodeCacheSize=256m -XX:+UseParallelGC";
      # intellij options
      IDE_VM_OPTIONS = "-Xmx2048m";
      MANPATH = ":$HOME/.local/share/zinit";
      COREPACK_ENABLE_AUTO_PIN = "0";
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

