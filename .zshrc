########################################
# variables
########################################

ZDOTDIR=~

########################################
# read environment dependant
########################################
[ -f $ZDOTDIR/.zshrc_`uname`.zsh ] && . $ZDOTDIR/.zshrc_`uname`.zsh
[ -f $ZDOTDIR/.zshrc_local.zsh ] && . $ZDOTDIR/.zshrc_local.zsh

########################################
# sheldon
########################################

# loading plugins with sheldon
eval "$(sheldon source)"

########################################
# tab completion
########################################

# for completion
autoload -Uz compinit && compinit

# match larger chars if you type smaller chars
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# show completion in smaller space
# setopt list_packed

# correct command's spell
setopt correct

########################################
# prompt
########################################
[[ -f /.dockerenv ]] && DOCKERSTATUS=$'%K{blue} Docker %k ' || DOCKERSTATUS=''

# to load git branch name
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' %K{red} %b %k %F{red}%r%c%u%f' '(%b)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' %Bstaged%b'
zstyle ':vcs_info:git:*' unstagedstr ' %Bunstaged%b'
precmd () { vcs_info }

PROMPT='%(?.%F{green}O%f.%F{red}X%f) '$'${DOCKERSTATUS}%K{cyan} %n|%m %k''${vcs_info_msg_0_}'$' %F{cyan}%~%f\n''%B%U%F{yellow}%4>>%m%>> %6>.>%.%>>${vcs_info_msg_1_} %#%f%u%b '

########################################
# keybind
########################################

# when i type some chars, terminal moves the lines that start with the same chars
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-backward

########################################
# end 
########################################
