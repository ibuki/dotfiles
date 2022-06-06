# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOMEBREW_PREFIX/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOMEBREW_PREFIX/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"


function ghq-fzf() {
  local selected_dir=$(ghq list | fzf --query="$LBUFFER")

  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-fzf
bindkey "^g" ghq-fzf
