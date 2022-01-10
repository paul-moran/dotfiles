alias spinme='systemctl restart gcs-secrets.service && systemctl restart template-config.service'
alias copme='dev style --include-branch-commits'
alias typeme='bin/srb typecheck'
alias dumpme='dev dump-graphql admin'
alias packme='dev packages check'
alias recast_all='dev rbi dsl'

recast() {
  dev rbi dsl $1
}
