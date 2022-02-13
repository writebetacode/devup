# setting up asdf to be usable in my terminal sessions
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Hook direnv into your shell.
eval "$(asdf exec direnv hook zsh)"

# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }
