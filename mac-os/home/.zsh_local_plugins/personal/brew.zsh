# setting up brew so that it is loaded for our current environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# add in go bin into path
export GOBIN=$HOME/go/bin
if [ -d $GOBIN ]; then
  export PATH=$PATH:$GOBIN
fi
