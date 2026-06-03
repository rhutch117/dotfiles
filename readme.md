# Dotfiles

Dotfiles are managed using stow.
The target is `~/.config` (set in `.stowrc`). The path within each package mirrors the structure under that target.

For example:
`tmux/tmux/tmux.conf` -> `~/.config/tmux/tmux.conf`
`starship/starship.toml` -> `~/.config/starship.toml`


## Operations
Stow all packages
```bash
stow */
```

Restow all packages (remove and recreate all symlinks)
```bash
stow -R */
```

Stow a single package
```bash
stow package_name
```

Remove a single package
```bash
stow -D package_name
```
