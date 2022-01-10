# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"

plugins=(
  git
  rails
  yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER=$USER

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias rake="bundle exec rake"
alias be="bundle exec"
alias db-migrate="bin/rails db:migrate RAILS_ENV=development"
alias run="DISABLE_PEEK=1 dev server"
alias git-clean-br="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"

# Core stuff
alias spinme='systemctl restart gcs-secrets.service && systemctl restart template-config.service'
alias copme='dev style --include-branch-commits'
alias typeme='bin/srb typecheck'
alias dumpme='dev dump-graphql admin'
alias packme='dev packages check'
alias recast_all='dev rbi dsl'
alias sql='mysql -u root -P "$MYSQL_PORT"'
alias fix_bundler='bundle config --global PKGS__SHOPIFY__IO "token:$(gsutil cat gs://dev-tokens/cloudsmith/shopify/gems/latest)"'

recast() {
  dev rbi dsl $1
}

port_process() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

kill_process() {
  port_process $1 | awk '{print $2}' | xargs kill -9
}

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
