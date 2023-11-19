#!/bin/bash

SCRIPT_PATH=$(cd $(dirname $0); pwd)

case "$(uname -s)" in
    "Darwin") "$SCRIPT_PATH/init_mac.sh" ;;
    "Linux") echo "todo" ;;
esac
