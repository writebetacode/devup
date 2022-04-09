# MacOS configuration

## Table of Contents

- [Install software](#install-software)
- [Run the install script](#run-the-install-script)

### Install software

1. Install [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)
1. Login to Apple iCloud account
1. Install the following apps from the Apple App Store
    - Bitwarden
    - NextDNS
    - BetterSnapTool
    - Xcode

### Run the install script

1. open a terminal and run the following commands
    - ```xcode-select --install```
    - ```ssh-keygen -t ed25519 -C "scholle.mv@protonmail.com"```
      - ```cat ~/.ssh/id_ed25519.pub | pbcopy```
      - ```ssh-add --apple-use-keychain ~/.ssh/id_ed25519```
    - ```mkdir -p ~/code/writebetacode && cd ~/code/writebetacode && git clone --bare git@github.com:writebetacode/devup.git devup```
    - run the installer script
    - ```gpg --full-generate-key```
      - ```gpg --list-secret-keys --keyid-format=long```
      - ```gpg --armor --export #KEY | pbcopy```

1. open the fonts folder within this repo and double click the fonts to add them
   to the system, making them available to all applications.
