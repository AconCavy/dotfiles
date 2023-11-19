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

  if [ -f $dotfile ]; then
    # delete the symlink from the home directory
    unlink $HOME_TARGET

    # move the dotfile from the backup
    if [ -e $BACKUP_TARGET ]; then
      mv $BACKUP_TARGET $HOME_TARGET
    fi
  fi

done
