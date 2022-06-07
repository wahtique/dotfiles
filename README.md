# wahtique's custom ZSH

Dotfiles repo managed using [chezmoi](https://www.chezmoi.io/#considering-using-chezmoi)

## What's included

- plugin list managed with zplug adding
  - `ALT+E` to **E**dit or `ALT+R` to **R**ead files chosen with fzf
  - `CTRL+R` to search command history
  - `fish` like inlin auto-complete
  - `fzf` tab completion
  - auto-completion generation from `--help`
- powerlevel10k prompt theme
- script to auto install dependencies on first run (TODO)
- and much more ( well just a little for now but much more soon ! )

## Installation

- CHECK zsh is your default shell, or set it with `chsh`
- CHECK dependencies are installed 
  - [fzf](https://github.com/junegunn/fzf) for fuzzy search goodness
  - [bat](https://github.com/sharkdp/bat) better pager than `less` 
  - [fd](https://github.com/sharkdp/fd) better `find`
  - [cod](https://github.com/dim-an/cod) which is not necessarily needed but a nice tool all the same
  - [exa](https://the.exa.website/) as a more colorful replacement to ls
  - and also most likely stuff you already have like python and lua
- Ensure github is properly setup 
  - check here to setup ssh with your a rsa key     
- Fork this repo ! 
- Install chezmoi (with your github username ofc)
```shell
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply $GITHUB_USERNAME
```
- Run `chezmoi apply` and (hopefully) rock'n roll baby ! 
