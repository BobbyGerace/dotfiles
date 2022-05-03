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

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
