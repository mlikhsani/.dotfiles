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
alias g='egrep --color=auto -i'
alias grep='grep --color=auto'
alias vi=vim

# osc7 capability for foot terminal
osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd
