#!/bin/zsh

HOME_WD="$(dirname "$(pwd)")/home"

if [ ! -d "$HOME/.config" ]; then
  mkdir ~/.config
fi

declare -A dot_files

dot_files[.zsh_local_plugins]=.zsh_local_plugins
dot_files[.config/kitty]=.config/kitty
dot_files[.gitignore]=.gitignore
dot_files[.zshrc]=.zshrc

for from to in ${(kv)dot_files}; do
  to_path=~/$to
  from_path=$HOME_WD/$from

  # if symlink does not exist, then we will create it.
  if [ ! -L $to_path ]; then
    echo "creating symlink: $from_path -> $to_path"
    ln -s $from_path $to_path
  fi
done

source ~/.zshrc
