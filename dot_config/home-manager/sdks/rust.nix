{ pkgs, ... }:

{
  nixpkgs.overlays = [
    # fenix for rust toolchain
    (import "${
        fetchTarball
        "https://github.com/nix-community/fenix/archive/main.tar.gz"
      }/overlay.nix")
  ];
  home = {
    packages = with pkgs; [
      (fenix.stable.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
      cargo-deny # generate list of licenses 
      cargo-nextest # next gen test runner
      cargo-tarpaulin # code coverage
      cargo-release # release management
      sqlx-cli # sqlx cli
      mold # faster linker
      rust-analyzer
    ];
    sessionPath = [ "$HOME/.cargo/bin" ];
  };
}
