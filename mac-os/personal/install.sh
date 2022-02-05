#! /bin/bash
clear

sudo xcodebuild -license accept

# display all hidden/visible files in finder
echo -e "setting finder to show all hidden files\n"
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder

# settings up defaults for better fuzzy text support
echo -e "setting up non-fuzzy text for mojave\n"
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# install brew
echo -e "installing home brew\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo -e "removing the backup .zshrc file\n"
rm -f ~/.zshrc.pre-oh-my-zsh

echo -e "moving all of the pre-configured files to their correct locations"
cp -r root/. ~/

source ~/.zprofile
source ~/.zshrc

# installing programs with brew
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
    neovim 

brew install --cask kitty
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask tableplus
brew install --cask postman
brew install --cask spotify
brew install --cask gpg-suite
brew install --cask logseq
brew install --cask loom
brew install --cask microsoft-edge

echo -e "telling flutter to not collect information for the use of the tool...\n"
flutter config --no-analytics

echo -e "grabbing the command line utility that will enable me to upgrade go mod dependencies\n"
# TODO: add in an alias to do this command
# TODO: add in an alias for running `go get -u all` for a different type of updating modules
# TODO: add in a way to update this and all of the packages I install via go vs brew
go install github.com/oligot/go-mod-upgrade@latest
