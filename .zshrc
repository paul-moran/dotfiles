source /etc/zsh/zshrc.default.inc.zsh

alias rake="bundle exec rake"
alias be="bundle exec"
alias db_migrate="bin/rails db:migrate RAILS_ENV=development"
alias sql='mysql -u root -P "$MYSQL_PORT"'

alias fix_bundler='bundle config --global PKGS__SHOPIFY__IO "token:$(gsutil cat gs://dev-tokens/cloudsmith/shopify/gems/latest)"'
alias spinme='systemctl restart gcs-secrets.service && systemctl restart template-config.service'
alias copme='dev style --include-branch-commits'
alias typeme='bin/srb typecheck'
alias dumpme='dev dump-graphql admin'
alias packme='dev packages check'
alias recast_all='dev rbi dsl'

recast() {
  dev rbi dsl $1
}

port_process() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

kill_process() {
  port_process $1 | awk '{print $2}' | xargs kill -9
}
