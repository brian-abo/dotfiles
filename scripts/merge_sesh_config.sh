#!/usr/bin/env bash
set -euo pipefail

CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CORE="$HOME/dotfiles/sesh/config.core.toml"
LOCAL="$HOME/dotfiles/sesh/config.local.toml"
MERGED="$CONFIG_HOME/sesh/sesh.toml"

mkdir -p "$(dirname "$MERGED")"

# Delete sesh.toml so it can be regenerated
rm -f "$MERGED"

# Merge config.core.toml and config.local.toml
if [[ -f "$LOCAL" ]]; then
  {
    cat "$CORE"
    echo ""
    cat "$LOCAL"
  } > "$MERGED"
else
  cp "$CORE" "$MERGED"
fi

echo "✅ sesh.toml generated at $MERGED"

