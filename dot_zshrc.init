#############################################
################# ZSH #######################
#############################################

# Lines configured by zsh-newuser-install
setopt autocd extendedglob nomatch notify
# remove terminal beeps
unsetopt beep
bindkey -v
# trick found on SO to prevent ctrl+ left or right arrow
# from actually printing something 
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# End of lines configured by zsh-newuser-install

############################################
######### ZINIT ############################
############################################

# init zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
fpath+=(
  $HOME/.local/share/zinit/completions  
)
