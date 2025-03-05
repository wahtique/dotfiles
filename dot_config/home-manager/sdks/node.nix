{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      nodejs
      nodePackages.npm
      nodePackages.ts-node
      corepack_latest
    ];
    sessionVariables = {
      COREPACK_ENABLE_AUTO_PIN = "0";
    };
  };
}
