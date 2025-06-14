# dotfiles

## Setting up the first time
Run the following commands

```
make init
make update
git update-index --assume-unchanged sesh/sesh.toml
```
Before opening Neovim run this command:

`nvm install --lts`

Open Neovim once to let everything install then run the following command

```
make nvim-setup
```

### Making changes
When making configuration changes or installing with Homebrew. Run the following command to ensure things are backed up and linked properly

```
make update
```

### Stow
Stow needs to be run before anything to hydrate the .config directory

`cd ~/dotfiles/`
`stow .`

### Homebrew
The default Brewfile can be overriden by setting `$HOMEBREW_BUNDLE_FILE`.

The Brewfile can be generated by running the following command

```
make brew-backup
```
