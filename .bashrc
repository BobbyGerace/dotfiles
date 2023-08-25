# local settings
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# shared configuration
if [ -f ~/.commonrc ]; then
    source ~/.commonrc
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PS1='\n\[\033[34m\]\w\[\033[35m\]$(__git_ps1 " %s") \[\033[90m\]\t\n`if [ $? = 0 ]; then echo "\[\033[01;32m\]"; else echo "\[\033[01;31m\]"; fi`\[\033[00m\] '
