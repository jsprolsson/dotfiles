#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/Work/dotfiles"

LINKS=(
  "base/nvim/init.lua:.config/nvim/init.lua"
  "base/tmux/tmux.conf:.config/tmux/tmux.conf"
)

if [ "$#" -eq 0 ]; then
for entry in "${LINKS[@]}"; do
  IFS=":" read -r src_rel tgt_rel <<<"$entry"

  src="$DOTFILES_DIR/$src_rel"
  tgt="$HOME/$tgt_rel"

  # Remove old file/symlink if present
  rm -f "$tgt"

  ln -s "$src" "$tgt"
  echo "Linked $tgt → $src"
done
exit 0
elif [ "$1" = "link" ]; then
    for link in "${LINKS[@]}"; do
      echo "$link"
    done
  exit 0
else
  echo "Unclear flag/variable passed in"
  exit 1
fi
