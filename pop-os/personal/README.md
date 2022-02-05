# Personal PopOS Install Guide

## Table of Contents

- [Install software](#install-software)
- [Run the install script](#run-the-install-script)

### Install software

1. Install the following apps from the Pop_Shop
    - Bitwarden
    - VS Code
    - Spotify
    - Signal
    - Android Studio
    - Keyboard Configurator

### Run the install script

1. open a terminal and run the following commands
    - ```./install.sh```
    - ```ssh-keygen -t ed25519 -C "scholle.mv@protonmail.com"```
        - ```cat ~/.ssh/id_ed25519.pub```
    - ```gpg --full-generate-key```
        - ```gpg --list-secret-keys --keyid-format=long```
        - ```gpg --armor --export #KEY```
1. Uninstall Firefox from the Pop_Shop
1. Open and log into Firefox Developer Edition
    - Turn on [sound-output-device-chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
    - Turn on [freon](https://extensions.gnome.org/extension/841/freon/)
1. ```sudo sensors-detect```
1. ```sh -c "$(curl -sL https://nextdns.io/install)"```
