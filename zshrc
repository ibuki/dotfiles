#################### homebrew
eval $(/opt/homebrew/bin/brew shellenv)

#################### zplug
source /opt/homebrew/opt/zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

#################### for neovim
export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config


#################### vi keybind on command line
bindkey -e
bindkey -r "^g"


#################### LANG
export LANG=ja_JP.UTF-8
case ${UID} in
  0)
    LANG=C
    ;;
esac


#################### setopt
setopt auto_pushd
setopt complete_aliases
setopt correct
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt no_beep
setopt share_history
setopt pushd_ignore_dups
setopt print_eight_bit
setopt ignore_eof


#################### prompt
autoload colors
colors


#################### history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups


#################### set history search keys
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#################### direnv
eval "$(/opt/homebrew/bin/direnv hook zsh)"


#################### anyenv
eval "$(anyenv init -)"


#################### gopath
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH


#################### original commands
export PATH=$HOME/dotfiles/bin:$PATH
export PATH=$HOME/bin:$PATH


#################### fzf
[ -f ~/dotfiles/fzf.zsh ] && source ~/dotfiles/fzf.zsh


#################### z
[ -f /opt/homebrew/etc/profile.d/z.sh ] && source /opt/homebrew/etc/profile.d/z.sh
