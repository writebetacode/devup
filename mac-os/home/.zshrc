# setting up brew so that it is loaded for our current environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# setting up fzf completions
[ -f ~/.zsh_local_plugins/fzf.zsh ] && source ~/.zsh_local_plugins/fzf.zsh

# setting up powerlevel10k theme
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# setting up zshrc-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  rm -f ~/.zcompdump; compinit
fi

# setting up direnv so that it loads my configs when I enter and exit directories
# eval "$(direnv hook zsh)"

# adding my ssh key so that it preloads into the terminal
# ssh-add --apple-use-keychain ~/.ssh/id_ed25519
