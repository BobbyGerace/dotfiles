#!/usr/bin/env bash

# IMPORTANT — This only works if it's run from the dotfiles dir

set -e

dotfiles=(
  scripts
  .config/nvim
  .config/kitty
  .config/ranger
  .config/lazygit
  .gitconfig
  .zshrc
  .zsh_theme.sh
  .tmux.conf
  .tmux_colors.conf
)

# Symlink all dotfiles listed above to the right spot
for dotfile in ${dotfiles[@]}; do
  rm -rf $HOME/$dotfile
  mkdir -p $(dirname $HOME/$dotfile)
  ln -sf $PWD/$dotfile $HOME/$dotfile
done

