#!/bin/zsh

GIT_CONFIG_PATH=$HOME/.gitconfig
EPOCHSECONDS=$(date +"%s")

vared -p 'Type in your git username: ' -c name
vared -p 'Type in your git email: ' -c email

if [[ -f $GIT_CONFIG_PATH ]]; then
  new_file_path=$HOME/.gitconfig_$EPOCHSECONDS.bak

  echo "Moving old $GIT_CONFIG_PATH to be $new_file_path"
  mv $GIT_CONFIG_PATH $new_file_path
fi

echo "Creating $GIT_CONFIG_PATH"
cat << CONFIG_FILE_TEXT >> $GIT_CONFIG_PATH
[user]
        name = $name
        email = $email
        #signingkey =
[commit]
        #gpgsign = true
[pull]
        rebase = true
[init]
        defaultBranch = main
[url "git@gitlab.com:"]
        insteadOf = https://gitlab.com/
[url "git@github.com:"]
        insteadOf = https://github.com/
[core]
        excludesfile = ~/.gitignore
[alias]
        co = checkout
        cm = commit -m
        st = status
        br = branch
        brl = branch --list
        wta = worktree add
        wtab = worktree add -b
        wtl = worktree list
        wtp = worktree prune
        wtr = worktree remove

CONFIG_FILE_TEXT
