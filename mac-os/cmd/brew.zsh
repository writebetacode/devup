#!/bin/zsh

echo -e "installing Homebrew\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

source ~/.zshrc

echo -e "installing programs with brew\n"
brew install \
  git \
  go \
  protobuf \
  protoc-gen-go \
  golangci-lint \
  cocoapods \
  neovim \
  asdf

brew install --cask brave-browser \
  google-chrome \
  microsoft-edge \
  docker \
  visual-studio-code \
  tableplus \
  postman \
  spotify \
  gpg-suite \
  logseq \
  signal \
  warp

# adding in any configuration required after installing one of the brew pkgs

source ~/.zshrc

# changing ownership of the /opt/brew/share directory and files therein so that
# zsh-compaudit does not complain that the directories are insecure, most likely
# because it was using a non-standard group name.
sudo chmod -R 755 /opt/homebrew/share
sudo chown -R "$USER":staff /opt/homebrew/share

# running commands that will install packages after we brew install the language
install-go-bins
install-asdf-plugins
install-node-globals
