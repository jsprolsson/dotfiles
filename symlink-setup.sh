#!/usr/bin/bash
set -euo pipefail

DOTFILES_DIR="$HOME/Work/dotfiles"

LINKS=(
  "hypr/bindings.conf:.config/hypr/bindings.conf"
  "hypr/input.conf:.config/hypr/input.conf"
  "nvim/init.lua:.config/nvim/init.lua"
)

for entry in "${LINKS[@]}"; do
  IFS=":" read -r src_rel tgt_rel <<<"$entry"

  src="$DOTFILES_DIR/$src_rel"
  tgt="$HOME/$tgt_rel"

  # Remove old file/symlink if present
  rm -f "$tgt"

  ln -s "$src" "$tgt"
  echo "Linked $tgt → $src"
done
