# dotfiles

## Usage

### Stow
Stow needs to be run before anything to hydrate the .config directory

`cd ~/dotfiles/`
`stow .`

### Homebrew
To install software from the brew file we have to use Homebrew's bundle command. 
It's going to use the file path stored in `$HOMEBREW_BUNDLE_FILE` . 
If you're planning to use a file other than `homebrew/Brewfile` in this repo then you can 
override that environment variable in `zsh/.env.zsh`

`brew bundle`

To sync installed software with this file you can run the dump command.

`brew bundle dump --force`
