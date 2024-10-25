{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    scala-next # aka dotty aka scala 3
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
      };
      initExtraBeforeCompInit = ''
        fpath+=(
          "$HOME/.local/share/scalacli/completions/zsh"
        )
      '';
    };
  };
}
