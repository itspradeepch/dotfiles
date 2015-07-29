#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles


dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim vrapperrc dir_colors zshrc tmux.conf linuxaliases osxaliases"    # list of files/folders to symlink in homedir


function backup() {

  # create dotfiles_old in homedir
  echo "Creating $olddir for backup of any existing dotfiles in ~"
  mkdir -p $olddir
  echo "...done"

  # move any existing dotfiles in homedir to dotfiles_old directory
  echo "Moving any existing dotfiles from ~ to $olddir"
  for file in $files; do
    mv ~/.$file ${olddir}
  done
  echo "...done"
  echo "Finished back-up"
}

function cdToDotfiles() {

  # change to the dotfiles directory
  echo "Changing to the $dir directory"
  cd $dir
  echo "...done"
}

function symlink() {
  # create symlinks
  for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
  done
  echo "Finished setting up symlinks"
}

function setUpEclim() {

# symlink
  ln -sf ${dir}/eclim/eclimrc ~/.eclimrc
  ln -sf ${dir}/eclim/user.properties ~/.vim/bundle/eclim/
  echo "Finished setting up eclim"
}

# Bail out on failure
set -e

platform="unknown"
if [ "$OSTYPE" == "linux-gnu" ]; then
  platform="linux"
elif [ "$OSTYPE" == "darwin"* ]; then
  platform="mac"
fi

echo "Platform: "$platform

backup
symlink
setUpEclim

echo "Done SetUp!"
