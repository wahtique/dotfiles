{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua
    ansible
    terraform
    terraform-ls
    lldb # debugger for native code
    gopls
  ];

  programs = {
    go.enable = true;
  };
}
