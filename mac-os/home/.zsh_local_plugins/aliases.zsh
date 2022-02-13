# golang aliases
function upgrade-go-bins {
  if [ -d $GOBIN ]; then
    echo "installing go-mod-upgrade@latest"
    go install github.com/oligot/go-mod-upgrade@latest
  fi
}

alias ugb="upgrade-go-bins"
alias gmu="go-mod-upgrade"
alias ggua="go get -u all"
alias gmt="go mod tidy"
