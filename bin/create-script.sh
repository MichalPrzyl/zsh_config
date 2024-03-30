#!/bin/bash
if [[ "$1" == "" ]]; then
  echo "Usage: ${0##*/} <script-name>"; exit 2
fi

set -euo pipefail

cat > $1 << EOM
#!/bin/bash
set -euo pipefail

EOM
chmod +x $1
# source ~/.zshrc
~/programs/nvim/bin/nvim $1
