########################################
# variables
########################################
[[ $(uname -m) == "arm64" ]] && BREWPATH="/opt/homebrew" || BREWPATH="/usr/local"

########################################
# PATH
#######################################
# export PATH="$PATH":"$HOME/fvm/default/bin"
export PATH="$PATH:~/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Library/TeX/texbin/latexmk"
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

#######################################
# some applecation
#######################################

# for brew
eval $($BREWPATH/bin/brew shellenv)

# for asdf
type asdf > /dev/null && . $BREWPATH/opt/asdf/libexec/asdf.sh

# for gcp
if [[ -f $BREWPATH/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]]; then
  source $BREWPATH/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
  source $BREWPATH/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

########################################
# tab completion
########################################

# for github completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# for docker compose
mkdir -p ~/.zsh/completions
[[ ! -L ~/.zsh/completions/_docker-compose ]] &&
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion ~/.zsh/completions/_docker-compose
fpath=(~/.zsh/completions $fpath)

# これは`.zshrc`に存在する。
# autoload -Uz compinit && compinit

########################################
# unset
########################################

unset BREWPATH