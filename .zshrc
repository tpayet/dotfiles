# Load Homebrew config script
source $HOME/.brewconfig.zsh

precmd() {

}

PROMPT="%F{green}%n%f@%F{blue}%m%f: %F{cyan}%~%f > "
RPROMPT="%* [$?]"



