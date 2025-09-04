{ ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        forwardAgent = true;
      };
    };
    includes = [
      "$HOME/.ssh/config.*"
    ];
  };
}
