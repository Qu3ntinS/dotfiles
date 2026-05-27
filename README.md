# Dotfiles

This repository contains my personal configuration files (dotfiles) managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow is a symlink farm manager that makes it easy to organize and deploy configuration files across different systems.

## Prerequisites

Make sure you have GNU Stow installed on your system:

```bash
# Arch Linux
sudo pacman -S stow

# Debian/Ubuntu
sudo apt install stow

# macOS
brew install stow
```

## Installation

Clone this repository to your home directory:

```bash
git clone <repository-url> ~/dotfiles
cd ~/dotfiles
```

## Available Packages

This repository contains the following stow packages:

- **hyprland** - Hyprland window manager configuration
- **waybar** - Waybar status bar configuration
- **ssh** - SSH configuration
- **opendeck** - OpenDeck configuration
- **omarchy** - Omarchy configuration
- **scripts** - User scripts in `~/.local/bin/` (e.g. fingerprint toggle)

### System Files (require root — not stow-managed)

Files in `system/` must be installed manually once:

```bash
bash ~/dotfiles/system/install.sh
```

This installs:
- `/usr/local/bin/omarchy-fingerprint-pam-toggle` — PAM helper for fingerprint toggle
- `/etc/sudoers.d/fingerprint-toggle` — NOPASSWD rule for the helper

## Stow Commands

### Installing Individual Packages

To symlink a specific package, run the following command from the `~/dotfiles` directory:

```bash
# Hyprland configuration
stow hyprland

# Waybar configuration
stow waybar

# SSH configuration
stow ssh

# OpenDeck configuration
stow opendeck

# Omarchy configuration
stow omarchy
```

### Installing All Packages

To install all packages at once:

```bash
stow */
```

### Uninstalling Packages

To remove symlinks for a specific package:

```bash
# Example: uninstall hyprland
stow -D hyprland

# Example: uninstall waybar
stow -D waybar

# Example: uninstall ssh
stow -D ssh

# Example: uninstall opendeck
stow -D opendeck

# Example: uninstall omarchy
stow -D omarchy
```

To uninstall all packages:

```bash
stow -D */
```

### Restowing Packages

If you've made changes and want to refresh the symlinks:

```bash
# Example: restow hyprland
stow -R hyprland

# Restow all packages
stow -R */
```

### Dry Run

To see what stow would do without actually making changes:

```bash
# Example: dry run for hyprland
stow -n hyprland

# Dry run for all packages
stow -n */
```

## Directory Structure

```
dotfiles/
├── hyprland/
│   └── .config/
│       └── hypr/
├── waybar/
│   └── .config/
│       └── waybar/
├── ssh/
│   └── .ssh/
│       └── config
├── opendeck/
│   └── .config/
│       └── opendeck/
├── omarchy/
│   └── .config/
│       └── omarchy/
├── scripts/
│   └── .local/
│       └── bin/          # stow → ~/.local/bin/
└── system/               # NOT stow-managed — install with system/install.sh
    ├── install.sh
    ├── usr/local/bin/
    └── etc/sudoers.d/
```

## Notes

- Stow creates symlinks in the parent directory by default (i.e., `~/` when run from `~/dotfiles`)
- If a file already exists at the target location, stow will report a conflict
- Always backup your existing configuration files before stowing new ones
- Use `stow -n` (dry run) to preview changes before applying them

## Troubleshooting

If you encounter conflicts during stowing:

1. Backup existing configuration files
2. Remove or rename conflicting files
3. Run the stow command again

Example:

```bash
# Backup existing config
mv ~/.config/hypr ~/.config/hypr.backup

# Then stow
stow hyprland
```

## License

These are personal configuration files. Feel free to use and modify them as needed.
