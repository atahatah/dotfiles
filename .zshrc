########################################
# variables
########################################

ZDOTDIR=~

########################################
# PATH
########################################
[[ -d $HOME/bin ]] && export PATH="$PATH:$HOME/bin"
[[ -d $HOME/.local/bin ]] && export PATH=$PATH:$HOME/.local/bin

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

# the display bugs out when the last prompt contains emoji on a container on Linux with nvidia

if type starship > /dev/null; then
    # starship
    eval "$(starship init zsh)"
else
    [ -f /.dockerenv ] && DOCKERSTATUS=$'%F{blue} Docker %f' || DOCKERSTATUS=''

    # to load git branch name
    autoload -Uz vcs_info
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats ' on %F{magenta} %b%f %F{red}%c%u%f'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr '[+] '
    zstyle ':vcs_info:git:*' unstagedstr '[!] '
    precmd () { vcs_info }

    PROMPT='%B%F{cyan}%~%f%b''${vcs_info_msg_0_}'"I'm %F{yellow}%n%f at %F{green}%m%f"$'\n''%(?.%F{green}O%f.%F{red}X%f)$DOCKERSTATUS''%# '
fi

########################################
# keybind
########################################

# when i type some chars, terminal moves the lines that start with the same chars
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-backward

########################################
# check updates 
########################################

. $HOME/dotfiles/bin/check.sh

########################################
# end 
########################################
