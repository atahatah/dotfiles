########################################
# variables
########################################

ZDOTDIR=~

########################################
# PATH
########################################
[[ -d $HOME/bin ]] && export PATH="$PATH:$HOME/bin"
[[ -d $HOME/.local/bin ]] && export PATH=$PATH:$HOME/.local/bin
export PATH=$HOME/.gem/bin:$PATH

########################################
# alias
########################################

[[ -f $HOME/.aliases.sh ]] && . $HOME/.aliases.sh

########################################
# sheldon
########################################

# loading plugins with sheldon
eval "$(sheldon source)"

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
# read environment dependant
########################################
[[ -f $ZDOTDIR/.zshrc_`uname`.zsh ]] && . $ZDOTDIR/.zshrc_`uname`.zsh
[[ -f $ZDOTDIR/.zshrc_local.zsh ]] && . $ZDOTDIR/.zshrc_local.zsh

########################################
# tab completion
########################################

# for completion
# remove this line because we use zsh-autocomplete
# autoload -Uz compinit && compinit

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

# with zsh-autocomplete

# This makes Enter always submit the command line, even when you are in the menu:
bindkey -M menuselect '^M' .accept-line

# This makes ← and → always move the cursor on the command line, even when you are in the menu:
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char

# Autocomplete overrides the behavior of some of Zsh's built-in keyboard widgets.
bindkey '^R' .history-incremental-search-backward
bindkey '^S' .history-incremental-search-forward

# First insert the common substring
# all Tab widgets
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
# all history widgets
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
# ^S
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
# Insert prefix instead of substring
zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

# zstyle ':autocomplete:*' default-context history-incremental-search-backward

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
