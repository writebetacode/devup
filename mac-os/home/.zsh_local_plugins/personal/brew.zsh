# setting up brew so that it is loaded for our current environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# setting up powerlevel10k theme
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# setting up fzf completions
[ -f ~/.zsh_local_plugins/fzf.zsh ] && source ~/.zsh_local_plugins/fzf.zsh

# setting up zshrc-completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  rm -f ~/.zcompdump; compinit
fi

# setting up zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# add in go bin into path
export GOBIN=$HOME/go/bin
if [ -d $GOBIN ]; then
  export PATH=$PATH:$GOBIN
fi
