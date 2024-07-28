########################################
# read environment dependant
########################################
[[ -f $ZDOTDIR/.zshenv_`uname`.zsh ]] && . $ZDOTDIR/.zshenv_`uname`.zsh
[[ -f $ZDOTDIR/.zshenv_local.zsh ]] && . $ZDOTDIR/.zshenv_local.zsh
