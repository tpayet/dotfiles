source $HOME/.history.zsh
source ~/.alias

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
PROMPT=" %F{cyan}%~%f "$'$(vcs_info_wrapper)'"> "
RPROMPT="%* [%?]"

# zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Cargo PATH for rust
source $HOME/.cargo/env

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# Init rbenv
eval "$(rbenv init -)"
