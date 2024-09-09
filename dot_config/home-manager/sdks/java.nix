{ pkgs, ... }: {
  home = {
    # multiple jdks because latest is not always compatible with everything
    # eg. sbt-buildinfo
    file."jdks/zulu17".source = pkgs.zulu17;
  };
  # use the latest jdk as default
  programs.java = {
    enable = true;
    package = pkgs.temurin-bin;
  };
}
