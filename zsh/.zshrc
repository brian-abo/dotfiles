# History settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000
unsetopt beep

# Necessary for Zsh's `compinstall` system if you ever use it
zstyle :compinstall filename "$XDG_CONFIG_HOME/zsh/.zshrc"

# Core environment vars
export EDITOR=/opt/homebrew/bin/nvim
export XDG_CONFIG_HOME="$HOME/.config"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# Local bin directory
export PATH="$PATH:$HOME/.local/bin"

# Only set XDG_CACHE_HOME if not already defined
: "${XDG_CACHE_HOME:=$HOME/.cache}"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Sourcing aliases and functions
[[ -f "$XDG_CONFIG_HOME/zsh/.zsh_aliases" ]] && source "$XDG_CONFIG_HOME/zsh/.zsh_aliases"
[[ -f "$XDG_CONFIG_HOME/zsh/.zsh_functions" ]] && source "$XDG_CONFIG_HOME/zsh/.zsh_functions"

# Homebrew 
eval "$(/opt/homebrew/bin/brew shellenv)"

# Antidote plugin manager
fpath+=("$HOME/.antidote")
[[ -f "$HOME/.antidote/antidote.zsh" ]] || \
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
source "$HOME/.antidote/antidote.zsh"

# Completions from tools
fpath+=("${XDG_CONFIG_HOME}/zsh/completions" "/opt/homebrew/share/zsh/site-functions")

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
mkdir -p "$XDG_CACHE_HOME/zsh/zcompcache"

# Plugin loading
antidote load < "$XDG_CONFIG_HOME/zsh/.zsh_plugins.txt"

# Initialize completion system after fpath is finalized
autoload -Uz compinit
compinit

# Starship prompt
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

