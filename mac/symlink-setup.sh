#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/Work/dotfiles"

base_links=()
while IFS= read -r line; do
  base_links+=("$line")
done < <("$HOME/Work/dotfiles/base/base-symlink-setup.sh" link)


if [ ${#base_links[@]} -eq 0 ]; then
  echo "base links not found"
fi

LINKS=(
  "mac/ghostty/config:.config/ghostty/config"
  "${base_links[@]}"
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
