# --- Env
set -x EDITOR nvim

# --- Path
set -x PATH /usr/local/sbin $PATH
set -x PATH $HOME/Library/Python/2.7/bin $PATH
set -x PATH $HOME/Library/Python/3.9/bin $PATH
set -x PATH /usr/local/opt/mysql@5.7/bin $PATH
set -x GOPATH $HOME/.go
set -x PATH $GOPATH/bin $PATH
set -x PATH $HOME/.nodenv/bin $PATH
set -x PATH $HOME/dev/flutter/bin $PATH

# google-cloud-sdk
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

# --- Styling
# remove right prompt
function fish_right_prompt; end

# bobthefish settings
set -g theme_newline_cursor yes

# --- Plugins
# direnv
eval (direnv hook fish)

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# nodenv
eval (nodenv init - | source)

# --- Commands
# aliases
alias where="command -v"
alias tmux='tmux -2'
alias vi='nvim'
alias vim='nvim'
alias be='bundle exec'
alias gs='git status'
alias gdh='git diff HEAD'
alias gds='git diff --staged'
alias gbdm="git branch -d (git branch --merged | grep -v \* | grep -v master | grep -v develop | sed 's/ //g')"
alias gcmt='git commit -m'
alias gh="open (git remote get-url origin | sed -Ee 's#(ssh://)?(git@|git://)#http://#' -e 's@com:@com/@')"
alias gcd='cd (git rev-parse --show-toplevel)'
alias od='OVERCOMMIT_DISABLE=1'
alias top='top -ocpu'
alias clip="tr -d '\n' | pbcopy && pbpaste"
alias mv='mv -i'
alias cp='cp -i'
alias ports='lsof -i -P | grep "LISTEN"'
alias slackpost="curl -X POST -d \"{'text': '<@U011Y7LFYV8> done'}\" https://hooks.slack.com/services/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"

# key bindings
# prevent Ctrl-D to exit
bind \cd delete-char
