{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    scala-cli
    metals
    scalafmt
    mill
  ];

  programs = {
    sbt.enable = true;

  };
}
