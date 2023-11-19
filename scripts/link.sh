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
  BACKUP_TARGET="$DOTBACKUP_PATH/$TARGET"

  if [ -d $dotfile ]; then
    # create the directory to home
    test -d $HOME_TARGET || mkdir $HOME_TARGET
    test -d $BACKUP_TARGET || mkdir $BACKUP_TARGET
  fi

  if [ -f $dotfile ]; then
    # move the dotfile to the backup directory if it is not symlink
    if [ ! -h $HOME_TARGET ]; then
      mv $HOME_TARGET $BACKUP_TARGET
    fi

    # create the symlink to the home directory
    ln -snf $dotfile $HOME_TARGET
  fi

done
