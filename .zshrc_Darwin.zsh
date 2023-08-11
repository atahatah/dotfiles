########################################
# variables
########################################
BREWPATH=$(brew --prefix)

########################################
# PATH
#######################################
# export PATH="$PATH":"$HOME/fvm/default/bin"
export PATH="$PATH:~/Library/Android/sdk/platform-tools"
export PATH="$PATH:~/bin"
export PATH="$PATH:/Library/TeX/texbin/latexmk"
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH:$BREWPATH/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

#######################################
# some applecation
#######################################

# for brew
eval $($BREWPATH/bin/brew shellenv)

# for asdf
. $BREWPATH/opt/asdf/libexec/asdf.sh

# for gcp
source $BREWPATH/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source $BREWPATH/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

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

# for docker compose
mkdir -p ~/.zsh/completions
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion ~/.zsh/completions/_docker-compose
fpath=(~/.zsh/completions $fpath)
