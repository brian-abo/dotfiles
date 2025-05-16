# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/brian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(/opt/homebrew/bin/brew shellenv)"
