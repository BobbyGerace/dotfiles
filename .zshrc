alias confurl="curl -K"

alias vim="nvim"
alias gvim="nvim-qt&!"

alias tabname="kitty @ set-tab-title"

alias config-edit="nvim ~/dotfiles"

theme() {
  cp ~/.config/kitty/themes/"$1".conf ~/.config/kitty/current-theme.conf
  kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf
}

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
