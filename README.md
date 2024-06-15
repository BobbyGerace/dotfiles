# Setup Instructions

Note: these instructions assume you're using macOS. They work with other environments too, but you're on your own when it comes to getting all the dependencies installed

## Dependencies

First install homebrew, node, and kitty

## Homebrew dependencies

```bash
brew install \
tmux \
neovim \
ranger \
ripgrep \
prettier \
fsouza/prettierd/prettierd \
jesseduffield/lazygit/lazygit \
bat \
git-delta
```

## npm dependencies

```bash
sudo npm install -g vtop typescript typescript-language-server
```

## ruby dependencies

```bash
sudo gem install solargraph rubocop
```

## Install config files

IMPORTANT: Make sure nothing you care about will be overwritten by this command. Check zshrc, bashrc, config files, etc

cd into this repo and run `./install.sh`

## Install Packer

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then run `:PackerSync` inside neovim to install plugins

## Fonts

- install FiraCode Nerd Font Mono

## Install tmux plugins

Install tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then press `<prefix> + I` to install plugins

## System Settings

Disable Mission Control shortcuts to move left, right (conficts with tmux bindings)
