#################### Env
export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config

#################### LANG
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
case ${UID} in
  0)
    LANG=C
    ;;
esac

#################### homebrew
eval $(/opt/homebrew/bin/brew shellenv)
# export CPPFLAGS=-I/opt/homebrew/include
# export LDFLAGS=-L/opt/homebrew/lib


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


#################### keybind
bindkey -e
bindkey -r "^g"



#################### history
HISTFILE=~/.my_zsh_history
HISTSIZE=500000
SAVEHIST=500000


#################### setopt
setopt auto_pushd
setopt complete_aliases
setopt correct
setopt extended_glob
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt ignore_eof
setopt list_packed
setopt no_beep
setopt noautoremoveslash
setopt nolistbeep
setopt print_eight_bit
setopt pushd_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history


#################### stty
if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi



#################### direnv
eval "$(direnv hook zsh)"


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


#################### java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
