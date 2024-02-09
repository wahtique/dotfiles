{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    #
    # shell
    #
    pkgs.zi # plugin manager
    pkgs.oh-my-posh # prompt
    pkgs.fd # better find
    pkgs.cod # turn any --help into completion
    pkgs.tree # pretty print directories
    pkgs.zoxide # z on steroids
    pkgs.neofetch # flexx your OS
    pkgs.silver-searcher # ag
    pkgs.eza # maintained fork of exa
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    pkgs.diff-so-fancy # fancy diffs ( for git )
    pkgs.tealdeer # tldr in rust
    pkgs.ripgrep # better grep
    pkgs.meld # gui differ
    #
    # dev
    #
    devbox
    gh
    melody # regex but readable
    sops # secret ops using AGE
    just # make for humans
    helix # modern vim ? 
    direnv
    graphite-cli # stack ! 
    aoc-cli # advent of code cli
    openapi-generator-cli # generate SDKs from open-api specs
    #
    # scala
    #
    # coursier # scala package manager
    scala-cli
    metals
    scalafmt
    mill
    rust-analyzer
    #
    # nix
    #
    rnix-lsp
    cachix
    #
    # runtimes / interpreters
    #
    lua
    nodejs_18
    # python stuff
    # commented out because a bit too messy with Nix
    # python311
    # poetry
    # python311Packages.pip
    # python311Packages.build
    # python311Packages.pynvim

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
}
