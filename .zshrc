########################################
# znap
########################################

# Download Znap, if it's not there yet.
[[ -f ~/dotfiles/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/dotfiles/zsh-snap

# for zap
source ~/dotfiles/zsh-snap/znap.zsh

# show completable commands without tab
znap source marlonrichert/zsh-autocomplete

# show the most recent command stating with the same command that now you have typed
znap source zsh-users/zsh-autosuggestions

znap source zsh-users/zsh-syntax-highlighting

########################################
# tab completion
########################################

# for github completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

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

# to load git branch name
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b) ' '%r%F{red}%c%u%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' staged'
zstyle ':vcs_info:git:*' unstagedstr ' unstaged'
precmd () { vcs_info }

PROMPT='%F{yellow}${vcs_info_msg_0_}%c %# %f'
RPROMPT='%F{yello}${vcs_info_msg_1_}%f'

########################################
# keybind
########################################

# when i type some chars, terminal moves the lines that start with the same chars
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-backward

########################################
# read environment dependant
########################################
[ -f $ZDOTDIR/.zshrc_`uname`.zsh ] && . $ZDOTDIR/.zshrc_`uname`.zsh
[ -f $ZDOTDIR/.zshrc_local.zsh ] && . $ZDOTDIR/.zshrc_local.zsh

########################################
# end 
########################################
