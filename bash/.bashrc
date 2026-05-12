# bash completion (need bash-completion package)
[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] &&
    source /usr/local/share/bash-completion/bash_completion.sh

# bash completion after doas
complete -cf doas

# bash/zsh git prompt support (need .git-prompt.sh in $HOME directory)
. ~/.git-prompt.sh
PS1='\w $(__git_ps1 "(\[\e[31m\]%s\[\e[0m\])")\$ '

TERM=xterm-256color
export TERM

EDITOR=vim
export EDITOR

PAGER=less
export PAGER

# Some useful aliases
alias h='fc -l'
alias j=jobs
alias m="$PAGER"
alias ls='ls -G'
alias ll='ls -laFoG'
alias l='ls -lG'
alias g='egrep --color=auto -i --exclude tags'
alias grep='grep --color=auto --exclude tags'
alias vi=vim

# start new alacritty instance on current working directory
alacritty-cwd() { alacritty msg create-window --working-directory $(pwd); }
bind -x '"\en":"alacritty-cwd"'
