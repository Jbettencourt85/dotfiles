# Dotfiles

Personal configuration files managed using a Git bare repository.

## Overview

This setup uses a Git bare repository to track dotfiles directly in `$HOME` without requiring symlinks or a separate dotfiles directory. The repository is stored in `~/.dotfiles/` and manages configuration files across the home directory.

## Files Tracked

- `.bash_aliases` - Custom Bash aliases and functions
- `.bashrc` - Bash configuration for interactive shells
- `.profile` - Login shell configuration
- `.config/starship.toml` - Starship prompt configuration
- `.config/tmux/tmux.conf` - Tmux configuration
- `.gitconfig` - Git global configuration
- `.gitignore_global` - Global Git ignore patterns
- `.tmux.conf` - Tmux configuration symlink

## Dependencies

The following tools are used by these dotfiles:

- **lsd** - Modern replacement for `ls` with colors and icons
- **starship** - Cross-shell prompt customization
- **tmux** - Terminal multiplexer
- **git** - Version control

### Installing Dependencies

```bash
# On Debian/Ubuntu
sudo apt update
sudo apt install tmux git

# Install lsd (LSDeluxe)
# Download from: https://github.com/lsd-rs/lsd/releases
# Or use cargo: cargo install lsd

# Install starship
curl -sS https://starship.rs/install.sh | sh
```

## Setup on a New System

### Initial Clone

```bash
# Clone the bare repository
git clone --bare <your-repo-url> $HOME/.dotfiles

# Define the dotgit alias temporarily
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the files
dotgit checkout

# If checkout fails due to existing files, back them up:
mkdir -p ~/.dotfiles-backup
dotgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} ~/.dotfiles-backup/{}

# Try checkout again
dotgit checkout

# Don't show untracked files
dotgit config --local status.showUntrackedFiles no
```

### Load Configuration

```bash
# Reload bash configuration
source ~/.bashrc
```

## Usage

### Dotfiles Management

The `dotgit` alias is defined in `.bash_aliases` and works like regular git:

```bash
# Check status of tracked files
dotgit status

# Add a file to tracking
dotgit add ~/.vimrc

# Commit changes
dotgit commit -m "Update vimrc"

# Push changes
dotgit push

# Pull latest changes
dotgit pull
```

### Quick Sync Aliases

```bash
# Quick commit and push all updates
dotpush

# Pull latest changes with rebase
dotpull
```

## Custom Aliases

This configuration includes numerous custom aliases organized by category:

### File Management
- `ls`, `ll`, `lh`, `la`, `lla` - Enhanced directory listings using lsd
- `lt1`, `lt2` - Tree views at different depths
- `..`, `...`, `....` - Navigate up directories

### Git Shortcuts
- `gs` - git status
- `ga` - git add
- `gc` - git commit -m
- `gp` - git push
- `gl` - pretty git log

### System
- `update` - Update and upgrade system packages
- `install` - Install packages
- `cls` - Clear terminal

### Python/Dev
- `py` - python3
- `venv` - Create and activate virtual environment (with error handling)

### Networking
- `myip` - Show public IP address
- `ports` - Show open ports
- `pingg` - Test connectivity

See `.bash_aliases` for the complete list with detailed comments.

## Starship Prompt

The prompt is customized using Starship. Toggle it with:

```bash
sp-off  # Disable Starship prompt
sp-on   # Enable Starship prompt
```

Configuration is stored in `.config/starship.toml`.

## Repository Structure

```
$HOME/
├── .dotfiles/           # Git bare repository (hidden)
├── .bash_aliases        # Tracked: Alias definitions
├── .bashrc              # Tracked: Bash configuration
├── .profile             # Tracked: Login shell config
├── .gitconfig           # Tracked: Git configuration
├── .gitignore_global    # Tracked: Global gitignore
└── .config/
    ├── starship.toml    # Tracked: Prompt config
    └── tmux/
        └── tmux.conf    # Tracked: Tmux config
```

## Notes

- The bare repository approach keeps your home directory clean
- Only explicitly added files are tracked
- Untracked files are hidden from `dotgit status` output
- You can use standard Git workflows for version control
- Changes can be synced across multiple machines

## Troubleshooting

### Alias not working after changes

```bash
source ~/.bashrc
```

### Dotgit command not found

The alias is defined in `.bash_aliases`. Make sure it's loaded:

```bash
source ~/.bash_aliases
```

Or add it manually:

```bash
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### Emojis not displaying

Some of the aliases include emoji icons. If they don't display correctly:
- Ensure your terminal supports Unicode/UTF-8
- Install a font with emoji support (e.g., Noto Color Emoji)
- The functionality works fine even if emojis don't render

## License

Personal configuration files - use freely.
