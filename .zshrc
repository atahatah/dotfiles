########################################
# PATH
#######################################
# export PATH="$PATH":"$HOME/fvm/default/bin"
export PATH="$PATH:/Users/ishiyamakazuki/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Users/ishiyamakazuki/bin"
export PATH="$PATH:/Library/TeX/texbin/latexmk"
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"


#######################################
# alias
#######################################

alias atom="/Applications/Atom.app/Contents/MacOS/Atom"

#######################################
# some applecation
#######################################

# for pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/shims:$PATH"
# eval "$(pyenv init -)"

# for brew
eval $(/opt/homebrew/bin/brew shellenv)

# for asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# for gcp
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

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

# for tab-completion for git
autoload -Uz compinit && compinit



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
# end 
########################################
