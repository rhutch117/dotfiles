# Dotfiles

Dotfiles are managed using stow.
Note that the path within each package's name, will be the same path used when moving the config - starting from the home dir.

For example:
`tmux/.config/tmux/tmux.conf` -> `~/.config/tmux/tmux.conf`


## Operations
Move a config file from `~/dotfiles` to home directory
```bash
stow package_name
```

Remove a config from home directory
```bash
stow -D package_name
```
