# wahtique's custom ZSH

Dotfiles repo managed using [chezmoi](https://www.chezmoi.io/#considering-using-chezmoi)

## What's included

- plugin list managed with [ZINIT](https://github.com/zdharma-continuum/zinit) adding
  - `ALT+E` to **E**dit or `ALT+R` to **R**ead files chosen with fzf
  - `ALT+\` to jump to previously visitd directory with zoxide interactive mode
  - `CTRL+R` or `ARROW-UP` to search command history with atuin
  - `CTRL+G`for cheatsheets powered by `navi`
  - `fish` like inline auto-complete
  - `fzf` tab completion
  - auto-completion generation from `--help`
- `Catppuccin` theme for `oh-my-posh`
- [home-manager](https://github.com/nix-community/home-manager) config to setup dependencies
- ~~[LunarVim](https://www.lunarvim.org/) config~~
- [NvChad](https://nvchad.com/) config
- and much more ( well just a little for now but much more soon ! )

Programs are managed using [nix](https://nixos.org/) and [home-manager](https://github.com/nix-community/home-manager).
They can be installed before applying chezmoi's dotfiles for the first time but included install script will try to do if they are not found on your system.

## Installation

- CHECK zsh is your default shell, or set it with `chsh`
- Install [nix](https://nixos.org/download.html) and [home-manager](https://nix-community.github.io/home-manager/)
- Ensure github is properly setup
  - check [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) to setup ssh with your a rsa key
- Fork this repo !
- Install chezmoi (with your github username ofc)
- Run
  
```shell
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply $GITHUB_USERNAME
```

- Run `chezmoi apply` and (hopefully) rock'n roll baby !

## Troubleshooting

### Permission denied on `/nix/var/nix/builds`

Depending on Nix install method, permissions on the nix store can be reset to `root` after an update.

```shell
error: creating directory '/nix/var/nix/builds/nix-build-home-manager.drv-32870-1704007560': Permission denied
error: program '/usr/bin/nix-build' failed with exit code 1
```

To fix, you can try changing the ownership of the nix store to the `nix-users` group:

```shell
sudo chown -R :nix-users /nix/var/nix
```

Make sure your user is part of the `nix-users` group :

```shell
groups $USER
```

If not, add yourself to `nix-users` group:

```shell
sudo gpasswd -a $USER nix-users
```
