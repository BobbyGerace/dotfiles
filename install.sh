#!/usr/bin/env bash

# IMPORTANT — This only works if it's run from the dotfiles dir

set -e

dotfiles=(
  scripts
  .config/nvim
  .config/wezterm
  .config/ranger
  .config/lazygit
  .config/hunk
  .gitconfig
  .zshrc
  .aider.conf.yml
  .zsh_theme.sh
  .tmux.conf
  .commonrc
  .bashrc
  .wezterm.lua
)

# Symlink all dotfiles listed above to the right spot
for dotfile in ${dotfiles[@]}; do
  rm -rf $HOME/$dotfile
  mkdir -p $(dirname $HOME/$dotfile)
  ln -sf $PWD/$dotfile $HOME/$dotfile
done

