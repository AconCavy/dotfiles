#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)
ROOT_PATH=$(dirname $SCRIPT_PATH)

/bin/bash "$SCRIPT_PATH/defaults_mac.sh"

# install Xcode
xcode-select --install

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file "$ROOT_PATH/dotfiles_mac/.Brewfile"
