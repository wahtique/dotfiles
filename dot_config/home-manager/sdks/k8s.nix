{ pkgs, ... }: {
  home.packages = with pkgs; [
    docker
    kubernetes
    k9s
    kubernetes-helm
  ];
}
