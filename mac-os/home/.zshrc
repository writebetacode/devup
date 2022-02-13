# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# loading in my poserlevel 10k configuration
[ -f ~/.zsh_local_plugins/p10k.zsh ] && source ~/.zsh_local_plugins/p10k.zsh

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

# setting up asdf to be usable in my terminal sessions
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Hook direnv into your shell.
eval "$(asdf exec direnv hook zsh)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }

# add in go bin into path
export GOBIN=$HOME/go/bin
if [ -d $GOBIN ]; then
  export PATH=$PATH:$GOBIN
fi

# adding in all of my aliases
source ~/.zsh_local_plugins/aliases.zsh
