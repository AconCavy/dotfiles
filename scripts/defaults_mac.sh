#!/bin/bash

### basics

# disable auto capitalization
defaults wirte NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

### finder

# ignore .DS_Store in the Network storage
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# ignore .DS_Store in the USB storage
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

### reset cache

killall Finder
killall Dock
