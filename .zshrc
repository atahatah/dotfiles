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
[[ -f $ZDOTDIR/.zshrc_`uname`.zsh ]] && . $ZDOTDIR/.zshrc_`uname`.zsh
[[ -f $ZDOTDIR/.zshrc_local.zsh ]] && . $ZDOTDIR/.zshrc_local.zsh

########################################
# alias
########################################

[[ -f $HOME/.aliases.sh ]] && . $HOME/.aliases.sh

########################################
# sheldon
########################################

# loading plugins with sheldon
eval "$(sheldon source)"

# Autocomplete for Zsh

# Reset history key bindings to Zsh default
() {
   local -a prefix=( '\e'{\[,O} )
   local -a up=( ${^prefix}A ) down=( ${^prefix}B )
   local key=
   for key in $up[@]; do
      bindkey "$key" up-line-or-history
   done
   for key in $down[@]; do
      bindkey "$key" down-line-or-history
   done
}

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
    [[ -f /.dockerenv ]] && DOCKERSTATUS=$'%F{blue} Docker %f' || DOCKERSTATUS=''

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
# bindkey '^p' history-beginning-search-backward
# bindkey '^n' history-beginning-search-backward

########################################
# Settings
########################################

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

########################################
# check updates 
########################################

. $HOME/dotfiles/bin/check.sh

# Fetch updates of this repository on backgound
(cd $HOME/dotfiles && git fetch > /dev/null 2>&1 &) 

########################################
# end 
########################################
