#!/bin/bash
if [[ "$1" == "" ]]; then
  echo "Usage: ${0##*/} <script-name>"; exit 2
fi

set -euo pipefail

if [[ -e $1 ]]; then
  echo "This file already exists. Edit it or create file with other name."
  exit 1
fi

cat > $1 << EOM
# Your python script
# use <C-C><C-P> to test it
EOM
chmod +x $1
# source ~/.zshrc
~/programs/nvim/bin/nvim $1
