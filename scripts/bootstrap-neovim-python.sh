#!/usr/bin/env bash
set -e

echo "🔧 Bootstrapping Neovim Python provider..."

VENV="$HOME/.local/share/nvim-venv"

# Create venv if not exists
if [ ! -d "$VENV" ]; then
  echo "📁 Creating venv at $VENV..."
  python3 -m venv "$VENV"
fi

# Install pynvim if missing
source "$VENV/bin/activate"
pip install --upgrade pip
pip install --upgrade pynvim

echo ""
echo "✅ Neovim Python provider installed."
echo "Neovim will use:"
echo "  $VENV/bin/python"
echo ""
echo "You do NOT need to set vim.g.python3_host_prog unless you want to override this."

