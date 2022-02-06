#!/bin/zsh

echo -e "installing Homebrew\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

source ~/.zprofile
source ~/.zshrc

echo -e "installing programs with brew\n"
# direnv \ rbenv \ nodenv \ asdf
# echo -e "creating the ~/.nvm folder\n"
# mkdir ~/.nvm
brew install \
  git \
  go \
  protobuf \
  protoc-gen-go \
  golangci-lint \
  cocoapods \
  neovim \
  fzf

brew install --cask kitty \
  brave-browser \
  google-chrome \
  microsoft-edge \
  docker \
  visual-studio-code \
  tableplus \
  postman \
  spotify \
  gpg-suite \
  logseq \
  loom

# adding in any configuration required after installing one of the brew pkgs

# install useful key bindings and fuzzy completion for fzf
$(brew --prefix)/opt/fzf/install
