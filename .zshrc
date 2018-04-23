# Completion settings
autoload -U compinit
compinit

precmd() {
}

# vcs_info (git branch)
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
	    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
	'%F{5}(%F{2}%b%F{5})%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}


# Prompt config
PROMPT="%F{green}%n%f@%F{blue}%m%f: %F{cyan}%~%f "$'$(vcs_info_wrapper)'"> "
RPROMPT="%* [$?]"

# history config
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.history

source ~/.alias

# Load Homebrew config script
source $HOME/.brewconfig.zsh

source ~/.brew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

