#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)

setup_mac() {
  "$SCRIPT_PATH/setup_mac.sh"
}

setup_linux() {
  echo "todo"
}

case "$(uname -s)" in
    "Darwin") setup_mac ;;
    "Linux") setup_linux ;;
esac
