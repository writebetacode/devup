# golang aliases
function install-go-bins {
  if [ -d $GOBIN ]; then
    echo "installing go-mod-upgrade@latest"
    go install github.com/oligot/go-mod-upgrade@latest
  fi
}

alias install-go-bins="install-go-bins"
alias gmu="go-mod-upgrade"
alias ggua="go get -u all"

# asdf
function install-asdf-plugins {
  if [ -d "/opt/homebrew/opt/asdf" ]; then
    echo "installing asdf plugins"

    asdf plugin add direnv
    asdf install direnv latest
    asdf global direnv latest

    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf install nodejs latest
    asdf global nodejs latest
  fi
}

alias install-asdf-plugins="install-asdf-plugins"