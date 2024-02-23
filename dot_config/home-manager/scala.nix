{ config, pkgs, ... }:
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

  };
}
