{ pkgs, ... }:
{
  home.packages = with pkgs; [
    scala-cli
    metals
    scalafmt
    mill
    bloop
  ];

  programs = {
    sbt.enable = true;
    zsh.shellAliases = {
      sc = "scala-cli";
      sbtc = "sbt --client";
    };
  };
}
