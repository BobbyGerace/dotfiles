alias confurl="curl -K"

alias vim="nvim"
alias gvim="nvim-qt&!"

alias tabname="kitty @ set-tab-title"

alias confedit="nvim ~/dotfiles"

alias :q="exit"

alias lazygit="lazygit --use-config-file=$HOME/.config/lazygit/config.yml"

theme() {
  cp ~/.config/kitty/themes/"$1".conf ~/.config/kitty/current-theme.conf
  kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf
}

# local settings
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# zsh theme
if [ -f ~/.zsh_theme.sh ]; then
    source ~/.zsh_theme.sh
fi

# export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

alias luamake=/Users/bobby.gerace/tools/lua-language-server/3rd/luamake/luamake

export PATH="$HOME/tools/lua-language-server/bin:$PATH"
