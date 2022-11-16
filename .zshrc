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


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
