#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)
ROOT_PATH=$(dirname $SCRIPT_PATH)

notice() {
  echo "[notice] $1"
}

setup_mac() {
  notice "Begin to setup for mac"

  notice "Setup the default values"
  /bin/bash "$SCRIPT_PATH/defaults_mac.sh"

  notice "Install Xcode Commandline Tools"
  xcode-select --install

  notice "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  notice "Install the softwares via Homebrew"
  brew bundle --file "$ROOT_PATH/dotfiles_mac/.Brewfile"
}

setup_linux() {
  notice "Begin to setup for linux"
  echo "todo"
}

case "$(uname -s)" in
    "Darwin") setup_mac ;;
    "Linux") setup_linux ;;
esac
