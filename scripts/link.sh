#!/bin/bash

SCRIPT_PATH=$(
  cd $(dirname $0)
  pwd
)
ROOT_PATH=$(dirname $SCRIPT_PATH)
DOTFILES_SHARED_PATH="$ROOT_PATH/dotfiles-shared"
DOTBACKUP_PATH="$HOME/.dotbackup"

DOTFILES_OS_PATH=""
case "$(uname -s)" in
"Darwin") DOTFILES_OS_PATH="$ROOT_PATH/dotfiles-mac" ;;
"Linux") echo "todo" ;;
esac

# create the backup directory if it doesn't exist
test -d $DOTBACKUP_PATH || mkdir $DOTBACKUP_PATH

for dotfiles_path in $DOTFILES_SHARED_PATH $DOTFILES_OS_PATH; do
  if [ -z $dotfiles_path ]; then
    continue
  fi

  for dotfile in $(find $dotfiles_path); do
    if [ $dotfile == $dotfiles_path ]; then
      continue
    fi

    TARGET="${dotfile##"$dotfiles_path/"}"
    HOME_TARGET="$HOME/$TARGET"
    BACKUP_TARGET="$DOTBACKUP_PATH/$TARGET"

    if [ -d $dotfile ]; then
      # create the directory to home
      test -d $HOME_TARGET || mkdir $HOME_TARGET
      test -d $BACKUP_TARGET || mkdir $BACKUP_TARGET
    fi

    if [ -f $dotfile ]; then
      # move the dotfile to the backup directory if it is not symlink
      if [ -e $HOME_TARGET ] && [ ! -h $HOME_TARGET ]; then
        mv $HOME_TARGET $BACKUP_TARGET
      fi

      # create the symlink to the home directory
      ln -snf $dotfile $HOME_TARGET
    fi

  done

done
