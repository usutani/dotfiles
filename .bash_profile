export PATH=/usr/local/bin:$PATH:/usr/local/mysql/bin
export LANG=ja_JP.UTF-8
export EDITOR="mate -w"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

. ~/.nvm/nvm.sh

alias gs='git status'
alias gl='git log --graph --pretty=oneline --decorate --date=short --abbrev-commit --branches'
alias rakea='rake assets:precompile RAILS_ENV=production'

rvm use ruby-1.9.3-p0@rails3.2
