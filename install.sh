#!/usr/bin/env bash

set -e

dotfiles=(
  bin
  .config/nvim
  .config/kitty
  .config/ranger
  .config/lazygit
  .gitconfig
  .zshrc
  .zsh_theme.sh
  .tmux.conf
)

# Symlink all dotfiles listed above to the right spot
for dotfile in ${dotfiles[@]}; do
  rm -rf $HOME/$dotfile
  mkdir -p $(dirname $HOME/$dotfile)
  ln -sf $PWD/$dotfile $HOME/$dotfile
done

