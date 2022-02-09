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
  fzf \
  romkatv/powerlevel10k/powerlevel10k \
  zsh-completions \
  zsh-autosuggestions \
  asdf

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

# changing ownership of the /opt/brew/share directory and files therein so that
# zsh-compaudit does not complain that the directories are insecure, most likely
# because it was using a non-standard group name.
sudo chmod -R 755 /opt/homebrew/share
sudo chown -R "$USER":staff /opt/homebrew/share

# setting up the plugins I use for asdf
asdf plugin add direnv
asdf install direnv latest
asdf global direnv latest

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
