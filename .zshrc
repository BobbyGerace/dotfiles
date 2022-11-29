# local settings
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# zsh theme
if [ -f ~/.zsh_theme.sh ]; then
    source ~/.zsh_theme.sh
fi

# shared configuration
if [ -f ~/.commonrc ]; then
    source ~/.commonrc
fi

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
