#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)

notice() {
  echo "[notice] $1"
}

setup_mac() {
  notice "Begin to setup for mac"
  "$SCRIPT_PATH/setup_mac.sh"
}

setup_linux() {
  notice "Begin to setup for linux"
  echo "todo"
}

case "$(uname -s)" in
    "Darwin") setup_mac ;;
    "Linux") setup_linux ;;
esac
