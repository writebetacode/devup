#!/bin/zsh

echo -e "accepting xcodebuild license\n"
sudo xcodebuild -license accept

echo -e "installing rosetta so that docker can use it\n"
softwareupdate --install-rosetta

# TODO: come back and see if this matters anymore with my upgraded monitors
echo -e "setting up non-fuzzy text for mojave\n"
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

echo -e "setting Finder to show all hidden files\n"
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder

echo -e "setting Finder to show all File extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo -e "setting Finder to show the path bar\n"
defaults write com.apple.finder ShowPathbar -bool true

echo -e "setting Finder to show a status bar\n"
defaults write com.apple.finder ShowStatusBar -bool true

echo -e "disabling the creation of pesky .DS_Store files\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
