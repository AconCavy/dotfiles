#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)

# install Xcode
xcode-select --install

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
