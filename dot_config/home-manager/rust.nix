{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    # fenix for rust toolchain
    (import "${fetchTarball "https://github.com/nix-community/fenix/archive/main.tar.gz"}/overlay.nix")
  ];
  home = {
    packages = [
      (pkgs.fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
    ];
    sessionPath = [ "$HOME/.cargo/bin" ];
  };
}
