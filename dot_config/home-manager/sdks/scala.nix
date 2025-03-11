{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    scala-cli
    metals # lsp
    bloop # build server
    scalafmt
    mill # alternative build tool
  ];

  programs = {
    sbt.enable = true;
    zsh = {
      shellAliases = {
        sc = "scala-cli";
        sbtc = "sbt --client";
        scala = "scala-cli";
      };
      initExtraBeforeCompInit = ''
        fpath+=(
          "$HOME/.local/share/scalacli/completions/zsh"
        )
      '';
    };
  };
}
