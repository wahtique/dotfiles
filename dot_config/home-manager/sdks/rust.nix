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
      # tmp use rustup manually until "cannot use rustfmt: rustup not found" in intellij is fixed
      # see https://youtrack.jetbrains.com/issue/RUST-14013/Cant-use-rustfmt-without-rustup
      #  
      (fenix.latest.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
        "rust-analyzer"
      ])
      cargo-deny # generate list of licenses 
      cargo-nextest # next gen test runner
      cargo-tarpaulin # code coverage
      cargo-release # release management
      cargo-mutants # mutation testing
      sqlx-cli # sqlx cli
      mold # faster linker
      # rust-analyzer
      rust-script
    ];
    sessionPath = [ "$HOME/.cargo/bin" ];
  };
}
