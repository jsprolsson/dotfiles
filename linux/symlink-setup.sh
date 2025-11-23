#!/usr/bin/bash
set -euo pipefail

DOTFILES_DIR="$HOME/Work/dotfiles"

LINKS=(
  "linux/hypr/bindings.conf:.config/hypr/bindings.conf"
  "linux/hypr/input.conf:.config/hypr/input.conf"
  "nvim/init.lua:.config/nvim/init.lua"
  "linux/overrides/omarchy-overrides.conf:.config/overrides/omarchy-overrides.conf"
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
