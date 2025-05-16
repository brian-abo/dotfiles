# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

export XDG_CONFIG_HOME="~/.config"
export STARSHIP_CONFIG="/.config/starship/starship.toml"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
