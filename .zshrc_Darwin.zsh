########################################
# variables
########################################
[[ $(uname -m) == "arm64" ]] && BREWPATH="/opt/homebrew" || BREWPATH="/usr/local"

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
