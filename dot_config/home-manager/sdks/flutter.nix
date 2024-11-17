{ pkgs, ... }: {
  home.packages = with pkgs; [
    flutter327
    android-tools
  ];
}
