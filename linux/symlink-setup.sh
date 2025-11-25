#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/Work/dotfiles"

LINKS=(
  "linux/hypr:.config/hypr"
  "linux/hypr:.config/hypr"
  "linux/overrides:.config/overrides"
)

for entry in "${LINKS[@]}"; do
  IFS=":" read -r src_rel tgt_rel <<<"$entry"

  src="$DOTFILES_DIR/$src_rel"
  tgt="$HOME/$tgt_rel"

  # Remove old file/symlink if present
  rm -rf "$tgt"

  ln -s "$src" "$tgt"
  echo "Linked $tgt → $src"
done
