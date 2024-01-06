#!/bin/bash

SCRIPT_PATH=$(
  cd $(dirname $0)
  pwd
)
ROOT_PATH=$(dirname $SCRIPT_PATH)

notice() {
  echo "[notice] $1"
}

defaults_mac() {
  notice "Setup keyboard settings"
  notice "Disable auto capitalization"
  defaults wirte NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

  notice "Setup finder settings"
  notice "Ignore .DS_Store in the Network storage"
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

  notice "Ignore .DS_Store in the USB storage"
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  notice "Show files with all extensions"
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  notice "Show hidden files"
  defaults write com.apple.finder AppleShowAllFiles -bool true

  notice "Reset caches"
  killall Finder
  killall Dock
}

setup_mac() {
  notice "Begin to setup for mac"

  notice "Setup the default values"
  defaults_mac

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
