########################################
# PATH
#######################################
[[ -d /usr/local/cuda ]] && export PATH=$PATH:/usr/local/cuda/bin

#######################################
# some applecation
#######################################

# for asdf
if [[ -f $HOME/.asdf/asdf.sh ]]; then
    . "$HOME/.asdf/asdf.sh"
    fpath=(${ASDF_DIR}/completions $fpath)
    autoload -Uz compinit && compinit
fi

########################################
# Key Mappings
#######################################
type xmodmap > /dev/null && xmodmap ~/.Xmodmap