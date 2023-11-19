#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)
ROOT_PATH=$(dirname $SCRIPT_PATH)
DOTFILES_PATH="$ROOT_PATH/dotfiles"
DOTBACKUP_PATH="$HOME/.dotbackup"

# create the backup directory if it doesn't exist
test -d $DOTBACKUP_PATH || mkdir $DOTBACKUP_PATH

for dotfile in $(find $DOTFILES_PATH); do
  if [ $dotfile == $DOTFILES_PATH ]; then
    continue
  fi

  TARGET="${dotfile##"$DOTFILES_PATH/"}"
  HOME_TARGET="$HOME/$TARGET"

  # move the dotfile to the backup directory if it is not symlink
  if [ ! -h $HOME_TARGET ]; then
    mv $HOME_TARGET "$DOTBACKUP_PATH/$TARGET"
  fi

  # create the symlink to the home directory
  ln -snf $dotfile $HOME_TARGET
done
