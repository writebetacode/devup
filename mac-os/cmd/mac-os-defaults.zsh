#!/bin/zsh

echo -e "accepting xcodebuild license\n"
sudo xcodebuild -license accept

echo -e "setting finder to show all hidden files\n"
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder

echo -e "setting up non-fuzzy text for mojave\n"
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
