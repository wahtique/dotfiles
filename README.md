# wahtique's custom ZSH

Dotfiles repo managed using [chezmoi](https://www.chezmoi.io/#considering-using-chezmoi)

## What's included

- plugin list managed with [ZI](https://z.digitalclouds.dev/) adding
  - `ALT+E` to **E**dit or `ALT+R` to **R**ead files chosen with fzf
  - `ALT+\` to jump to previously visitd directory with zoxide interactive mode
  - `CTRL+R` to search command history
  - `fish` like inline auto-complete
  - `fzf` tab completion
  - auto-completion generation from `--help`
- custom `oh-my-posh` theme
- [home-manager](https://github.com/nix-community/home-manager) config to setup dependencies
- [SpaceVim](https://github.com/SpaceVim/SpaceVim) config
- and much more ( well just a little for now but much more soon ! )

## Installation

- CHECK zsh is your default shell, or set it with `chsh`
- CHECK dependencies are installed, with `unstable` channel
  - [nix](https://nixos.org/download.html)

    ```bash
      sh <(curl -L https://nixos.org/nix/install) --no-daemon
    ```

  - [home-manager](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)

    ```bash
      nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
      nix-channel --update
      nix-shell '<home-manager>' -A install
    ```

- CHECK optional dependencies
  - [cod](https://github.com/dim-an/cod) : not manage by `home-manager` as Nix package and git install are broken
  - SpaceVim is not necessary but custom config WILL be deployed all the same
- Ensure github is properly setup
  - check [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) to setup ssh with your a rsa key
- Fork this repo !
- Install chezmoi (with your github username ofc)

```shell
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply $GITHUB_USERNAME
```

- Run `chezmoi apply` and (hopefully) rock'n roll baby !
