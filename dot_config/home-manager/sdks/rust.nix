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
      # (fenix.stable.withComponents [
      #   "cargo"
      #   "clippy"
      #   "rust-src"
      #   "rustc"
      #   "rustfmt"
      # ])
      # cargo-deny # generate list of licenses 
      # cargo-nextest # next gen test runner
      # cargo-tarpaulin # code coverage
      # cargo-release # release management
      # sqlx-cli # sqlx cli
      mold-wrapped # faster linker
      rust-analyzer
    ];
    sessionPath = [ "$HOME/.cargo/bin" ];
  };
}
