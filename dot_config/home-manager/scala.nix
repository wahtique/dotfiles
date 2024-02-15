{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    coursier
    scala-cli
    metals
    scalafmt
    mill
  ];

  programs = {
    sbt.enable = true;

  };
}
