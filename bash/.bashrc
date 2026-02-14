# bash completion
[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] &&
    source /usr/local/share/bash-completion/bash_completion.sh

# bash/zsh git prompt support
. ~/.git-prompt.sh

# PROMPT_COMMAND='__git_ps1 "\u@\h \w" "\\\$ "'
# PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
PS1='\w $(__git_ps1 "(\[\e[31m\]%s\[\e[0m\])")\$ '

EDITOR=nvim
export EDITOR

PAGER=less
export PAGER

# some useful aliases
alias h='fc -l'
alias j=jobs
alias m="$PAGER"
alias ll='ls -laFoG'
alias l='ls -lG'
alias g='egrep --color=auto -i'
alias vim='nvim'

# bash completion after doas
complete -cf doas

# fzf integration on bash
eval "$(fzf --bash)"
