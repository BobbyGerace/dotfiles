# local settings
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# shared configuration
if [ -f ~/.commonrc ]; then
    source ~/.commonrc
fi

