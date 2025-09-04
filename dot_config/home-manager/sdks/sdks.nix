{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua
    ansible
    terraform
    terraform-ls
    lldb # debugger for native code

  ];

  programs = {
    go.enable = true;
  };
}
