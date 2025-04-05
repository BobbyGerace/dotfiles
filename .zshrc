# local settings
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# shared configuration
if [ -f ~/.commonrc ]; then
    source ~/.commonrc
fi

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

setopt PROMPT_SUBST  # Allows for command substitution in the prompt
# Check if in an SSH session, and if so, prepend hostname
local ssh_prefix=""
if [[ -n $SSH_CLIENT ]]; then
    ssh_prefix="%F{cyan}%m %f"
fi

PROMPT='
'$ssh_prefix'%F{blue}%~%F{magenta}$(__git_ps1 " %s") %F{8}%*
%(?.%F{green}.%F{red})λ%f '

# Some other nice prompt characters:  ➜ λ
