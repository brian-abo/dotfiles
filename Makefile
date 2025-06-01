.PHONY: init update merge-config stow install-brew sesh nvim-setup help

# Ensure installation of Homebrew, links configuration, and sources .zshrc
init: install-brew
	@brew bundle --file $(HOME)/dotfiles/homebrew/Brewfile
	@echo "To apply shell changes, run:"
	@echo "source $(XDG_CONFIG_HOME)/zsh/.zshrc"

# Generate configs and restow
update: merge-config stow
	@echo "Restowing dotfiles..."

# Merge all session configs before stowing
merge-config: sesh

# Runs the 
stow:
	@echo "Stowing dotfiles..."
	@stow .

# Installs Homebrew if it's not already installed
install-brew:
	@if ! command -v brew >/dev/null 2>&1; then \
		echo "🍺 Homebrew not found. Installing..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "✅ Homebrew already installed."; \
	fi

# Install via Homebrew configuration
brew-install:
	@brew bundle

# Generate merged sesh config
sesh:
	@echo "Regenerating sesh config..."
	@$(HOME)/dotfiles/scripts/merge_sesh_config.sh

# Run the python setup script for Neovim
nvim-setup:
	@echo "Configure Python for Neovim"
	@$(HOME)/dotfiles/scripts/bootstrap_neovim_python.sh

help:
	@echo "Available commands:"
	@echo "  make init         # Install Homebrew, stow dotfiles, and prompt for zsh reload"
	@echo "  make update       # Merge configs and restow"
	@echo "  make sesh         # Regenerate sesh config"
	@echo "  make nvim-setup   # Configure Python support for Neovim"
	@echo "  make brew-install # Run Homebrew bundle install"

