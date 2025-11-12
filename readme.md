# dotfiles

A collection of config files

## Installs
- nvm
- sdkman
- nvim
- to.sh
- llvm
- jq
- fzf
- zoxide
- tmux
- tpm

## Setup required
- configuring global gitignore

## Installation

## Setup
Create a set of symbolic links e.g. `ln -s $(pwd)/.zshrc ~/.zshrc`
> run `make`

Brew it up
> run `brew bundle install`

Ignore stuff
> run `git config --global core.excludesfile ~/.gitignore`

## Remove
> run `make clean`