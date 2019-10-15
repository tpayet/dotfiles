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
if [ $(whoami) = "totolapaille" ]; then #if mba perso
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ $(whoami) = "tpayet" ]; then # if school config
    # Load Homebrew config script
    source $HOME/.brewconfig.zsh
    source ~/.brew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ $(whoami) = "payetth" ]; then #if mbpro lv
    source /Users/payetth/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
export PATH="/Users/payetth/homebrew/bin:/usr/local/sbin:$PATH"
export CDPATH="/Users/payetth/Documents/"

# Cargo PATH for rust
source $HOME/.cargo/env


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/payetth/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/payetth/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/payetth/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/payetth/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/payetth/homebrew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
