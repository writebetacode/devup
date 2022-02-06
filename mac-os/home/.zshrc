# setting up brew so that it is loaded for our current environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# setting up direnv so that it loads my configs when I enter and exit directories
# eval "$(direnv hook zsh)"

# adding my ssh key so that it preloads into the terminal
# ssh-add --apple-use-keychain ~/.ssh/id_ed25519
