# Setup Instructions

## Dependencies

First install homebrew, node, and kitty

## Homebrew dependencies

- tmux
- neovim
- ranger
- ripgrep
- prettier
- fsouza/prettierd/prettierd
- jesseduffield/lazygit/lazygit

## npm dependencies

- vtop
- typescript-language-server

## ruby dependencies

- solargraph
- rubocop

## Install config files

IMPORTANT: Make sure nothing you care about will be overwritten by this command. Check zshrc, bashrc, config files, etc

Run `./install.sh` inside this repo

## Install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then run `:PackerSync` inside neovim to install plugins

## Fonts

Install Operator Mono Lig and a Nerd Font. Since Operator Mono is proprietary, you'll have to generate the ligatures yourself

## Install tmux plugins

Install tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then press `<prefix> + I` to install plugins

## System Settings

Disable Mission Control shortcuts to move left, right (conficts with tmux bindings)
