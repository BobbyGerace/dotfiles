# local settings
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# shared configuration
if [ -f ~/.commonrc ]; then
    source ~/.commonrc
fi


    source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Check if in an SSH session, and if so, prepend hostname
if [[ -n $SSH_CLIENT ]]; then
    ssh_prefix="\[\033[36m\]\h \[\033[00m\]"
else
    ssh_prefix=""
fi

# Some other nice prompt characters:  ➜ λ
export PS1='\n'$ssh_prefix'\[\033[34m\]\w\[\033[35m\]$(__git_ps1 " %s") \[\033[90m\]\t\n`if [ $? = 0 ]; then echo "\[\033[01;32m\]"; else echo "\[\033[01;31m\]λ"; fi`\[\033[00m\] '
