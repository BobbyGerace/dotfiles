# Setup Instructions

Note: these instructions assume you're using macOS. They work with other environments too, but you're on your own when it comes to getting all the dependencies installed

## Dependencies

First install homebrew, node, wezterm, and neovim. (You may need to install the latest Neovim from source for all the plugins to work)

## Homebrew dependencies

```bash
brew install \
tmux \
ranger \
ripgrep \
jesseduffield/lazygit/lazygit \
bat \
git-delta
```

## npm dependencies

```bash
sudo npm install -g vtop typescript typescript-language-server prettier @fsouza/prettierd
```

## ruby dependencies

```bash
sudo gem install solargraph rubocop
```

## Install config files

IMPORTANT: Make sure nothing you care about will be overwritten by this command. Check zshrc, bashrc, config files, etc

cd into this repo and run `./install.sh`

## Fonts

- install FiraCode Nerd Font Mono

## Install tmux plugins

Install tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux and press `<prefix> + I` to install plugins

## System Settings

Disable Mission Control shortcuts to move left, right (conficts with tmux bindings)
