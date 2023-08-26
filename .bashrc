[ -f /bin/zsh ] && exec zsh

########################################
# prompt
########################################

[ -r $HOME/.local/bin ] && PATH="$PATH:$HOME/.local/bin"

########################################
# sheldon
########################################

# loading plugins with sheldon
# eval "$(sheldon source)"

########################################
# prompt
########################################

if type starship > /dev/null; then
    # starship
    eval "$(starship init bash)"
else
    export PS1="\[\e[46m\]\u|\h\[\e[m\] \[\e[36m\]\w\[\e[m\] \n \$ "

    function __show_status() {
        local status=$(echo ${PIPESTATUS[@]})
        local SETCOLOR_SUCCESS="echo -en \\033[1;32m"
        local SETCOLOR_FAILURE="echo -en \\033[1;31m"
        local SETCOLOR_WARNING="echo -en \\033[1;33m"
        local SETCOLOR_NORMAL="echo -en \\033[0;39m"

        local SETCOLOR s
        for s in ${status}
        do
            if [ ${s} -gt 100 ]; then
                SETCOLOR=${SETCOLOR_FAILURE}
            elif [ ${s} -gt 0 ]; then
                SETCOLOR=${SETCOLOR_WARNING}
            else
                SETCOLOR=${SETCOLOR_SUCCESS}
            fi
        done
        ${SETCOLOR}
        echo "(rc->${status// /|})"
        ${SETCOLOR_NORMAL}
    }
    PROMPT_COMMAND='__show_status;'${PROMPT_COMMAND//__show_status;/}
fi