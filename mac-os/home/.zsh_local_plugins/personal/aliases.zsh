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

# node globals
function install-node-globals {
  echo "installing node globals"
  corepack enable

  # TODO: figure out how to utilize pnpm correctly or just scrap this idea
  # if [ ! -d "$HOME/.asdf/shims/pnpm" ]; then
  #   npx pnpm add -g pnpm
  # else
  #   # updating pnpm
  #   pnpm add -g pnpm
  # fi
}

alias install-node-globals="install-node-globals"

# zsh globals
alias ls='gls --color=auto'
alias ll='ls -alh'
alias vim='nvim'
alias vi='nvim'
