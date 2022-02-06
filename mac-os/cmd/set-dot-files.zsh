#! /bin/zsh

HOME_WD="$(dirname "$(pwd)")/home"

if [ ! -d "$HOME/.config" ]; then
  mkdir ~/.config
fi

function set_symlink(){
  echo "creating symlink: $1 -> $2"
  ln -s $1 $2
}

declare -A dot_files

dot_files[kitty]=.config/
dot_files[.gitignore]=.gitignore
dot_files[.zprofile]=.zprofile
dot_files[.zshrc]=.zshrc

for from to in ${(kv)dot_files}; do
  to_path=~/$to

  if [ -d $to_path ]; then
    from_path=$HOME_WD/$to$from
  else
    from_path=$HOME_WD/$from
  fi

  if [ -d $to_path ]; then
    if [ ! -d $to_path$from ]; then
      set_symlink $from_path $to_path
    fi
  else
    if [ ! -f $to_path ]; then
      set_symlink $from_path $to_path
    fi
  fi
done
