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
  for dotfile in $(find $dotfiles_path); do
    if [ $dotfile == $dotfiles_path ]; then
      continue
    fi

    TARGET="${dotfile##"$dotfiles_path/"}"
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

done
