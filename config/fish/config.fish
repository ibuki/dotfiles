# --- Styling
# remove right prompt
function fish_right_prompt; end

# bobthefish settings
set -g theme_newline_cursor yes

# --- Plugins
# direnv
eval (direnv hook fish)

# --- Commands
# aliases
alias where="command -v"
alias tmux='tmux -2'
alias vi='nvim'
alias vim='nvim'
alias be='bundle exec'
alias gs='git status'
alias gdh='git diff HEAD'
alias gbdm='git branch -d `git branch --merged | grep -v \* | grep -v master | grep -v develop`'
alias gcmt='git commit -m'
alias gh="open \`git remote get-url origin | sed -Ee 's#(ssh://)?(git@|git://)#http://#' -e 's@com:@com/@'\`"
alias gcd='cd `git rev-parse --show-toplevel`'
alias od='OVERCOMMIT_DISABLE=1'
alias top='top -ocpu'
alias clip="tr -d '\n' | pbcopy && pbpaste"
alias mv='mv -i'
alias cp='cp -i'
alias ports='lsof -i -P | grep "LISTEN"'

# shortcuts
