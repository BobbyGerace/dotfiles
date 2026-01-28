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

# Check if in an SSH session, and if so, prepend hostname
if [[ -n $SSH_CLIENT ]]; then
    ssh_prefix="\[\033[36m\]\h \[\033[00m\]"
else
    ssh_prefix=""
fi

if [ -f ~/.bash_git ]; then
  source ~/.bash_git
fi

# Some other nice prompt characters:  ➜ λ
export PS1='\n'$ssh_prefix'\[\033[34m\]\w\[\033[35m\]$(__git_ps1 " %s") \[\033[90m\]\t\n`if [ $? = 0 ]; then echo "\[\033[01;32m\]λ"; else echo "\[\033[01;31m\]λ"; fi`\[\033[00m\] '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

. "$HOME/.local/bin/env"
