alias rake="bundle exec rake"
alias be="bundle exec"
alias db_migrate="bin/rails db:migrate RAILS_ENV=development"
alias sql='mysql -u root -P "$MYSQL_PORT"'

# Periodically Spin loses its session for bundler to install private gems. Running these fixes the problem.
alias bundler_fix='bundle config --global PKGS__SHOPIFY__IO "token:$(gsutil cat gs://dev-tokens/cloudsmith/shopify/gems/latest)"'
alias bundler_fix2='systemctl restart gcs-secrets.service && systemctl restart template-config.service'

alias rubocop_check='dev style --include-branch-commits'
alias sorbet_check='bin/srb typecheck'
alias sorbet_all='dev rbi dsl'

sorbet_one() {
  dev rbi dsl $1
}

alias packwerk_check='dev packages check'
alias graphql_dump='dev dump-graphql admin'

alias copme='rubocop_check'
alias typeme='sorbet_check'
alias packme='packwerk_check'
alias graphme='graphql_dump'

port_process() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

kill_process() {
  port_process $1 | awk '{print $2}' | xargs kill -9
}

# Spin default setup
source /etc/zsh/zshrc.default.inc.zsh
