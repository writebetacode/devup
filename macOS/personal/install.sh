#! /bin/bash
clear

# display all hidden/visible files in finder
echo -e "setting finder to show all hidden files\n"
defaults write com.apple.finder AppleShowAllFiles Yes

# settings up defaults for better fuzzy text support
echo -e "setting up non-fuzzy text for mojave\n"
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# install brew
echo -e "installing home brew\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# installing programs with brew
echo -e "installing programs with brew\n"
# docker-compose
brew install \
    git \
    go \
    nvm \
    clang-format \
    protobuf \
    golangci-lint \
    cocoapods \
    neovim \
    direnv

brew install --cask kitty
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask beekeeper-studio
brew install --cask postman
brew install --cask signal
brew install --cask flutter
brew install --cask android-studio
brew install --cask spotify
brew install --cask gpg-suite

echo -e "creating the ~/.nvm folder\n"
mkdir ~/.nvm

echo -e "telling flutter to not collect information for the use of the tool...\n"
flutter config --no-analytics

echo -e "grabbing the command line utility that will enable me to upgrade go mod dependencies\n"
go install github.com/oligot/go-mod-upgrade@latest

echo -e "moving all of the pre-configured files to their correct locations"
mv ./root/.zprofile ~/.zprofile
mv ./root/.zshrc ~/.zshrc
