#######################################
# ~/.bash_aliases
# Handy aliases for Bash
# Copy this file to your home directory
# Then reload with: source ~/.bashrc
#######################################

# -----------------------
# File Management & Navigation
# -----------------------
alias ..='cd ..'                 # Go up one directory
alias ...='cd ../..'             # Go up two directories
alias ....='cd ../../..'         # Go up three directories
alias ~='cd ~'                   # Go to home

# =========================================================
# LSD (LS Deluxe) Aliases
# Enhanced directory listings with color, icons, and order
# =========================================================

# 🧩 Base alias — replaces plain 'ls'
# Uses color and icons, groups directories first
alias ls='lsd --group-dirs first --icon always --color=auto'

# 📜 Long listing (permissions, size, date)
alias ll='lsd -l --group-dirs first --icon always --color=auto'

# 💾 Long listing + human-readable sizes
alias lh='lsd -lh --group-dirs first --icon always --color=auto'

# 👀 Show all (including hidden files)
alias la='lsd -a --group-dirs first --icon always --color=auto'

# 🔍 All + long + human-readable
alias lla='lsd -lha --group-dirs first --icon always --color=auto'

# 🕓 Sort by modification time (newest first)
alias lt='lsd -lt --group-dirs first --icon always --color=auto'

# 🌳 Tree view (depth 1)
alias lt1='lsd --tree --depth 1 --group-dirs first --icon always --color=auto'

# 🌲 Tree view (depth 2)
alias lt2='lsd --tree --depth 2 --group-dirs first --icon always --color=auto'

# 📁 Directories only (filters for folder entries)
alias lsd-dir='lsd --group-dirs first --icon always --color=auto --classify | grep "/$"'

# 🧠 Tips:
# - Change '--color=auto' to '--color=always' if you prefer color even when piping output
# - Run 'lsd --help' for all available options
# - Config file: ~/.config/lsd/config.yaml
#   → You can customize colors, date format, and icon theme there


# -----------------------
# Search & Inspect
# -----------------------
alias grep='grep --color=auto'   # Highlight grep matches
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias psu='ps auxf'              # Show all processes in a tree
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'  # Usage: psg process_name
alias df='df -h'                 # Disk free space in human readable units
alias du='du -ch'                # Disk usage summary
alias free='free -m'             # Memory usage in MB

# -----------------------
# System Shortcuts
# -----------------------
alias cls='clear'                # Clear terminal
alias h='history'                # Show command history
alias j='jobs -l'                # Show jobs with PID

alias update='sudo apt update && sudo apt upgrade -y'   # Update system
alias install='sudo apt install'                        # Install package
alias remove='sudo apt remove'                          # Remove package
alias search='apt search'                               # Search for package

# -----------------------
# Git Shortcuts
# -----------------------
alias gs='git status'            # Git status
alias ga='git add'               # Git add
alias gaa='git add -A'           # Git add all
alias gc='git commit -m'         # Git commit with message
alias gca='git commit --amend'   # Git amend last commit
alias gp='git push'              # Git push
alias gpl='git pull'             # Git pull
alias gco='git checkout'         # Git checkout
alias gb='git branch'            # Git branch
alias gl='git log --oneline --graph --decorate'  # Pretty git log

# Dotfiles Git (bare repo setup)
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Quick sync for dotfiles (stage updates, commit, and push)
alias dotpush='dotgit add -u && dotgit commit -m "Update dotfiles" && dotgit push'

# Pull latest dotfiles from GitHub and update working tree
alias dotpull='dotgit pull --rebase --autostash'

# -----------------------
# Networking
# -----------------------
alias myip='curl ifconfig.me'    # Show public IP
alias ports='netstat -tulanp'    # Show open ports
alias pingg='ping google.com'    # Quick connectivity test

# -----------------------
# Python / Dev
# -----------------------
alias py='python3'               # Python3 shorthand
alias pip='pip3'                 # Pip3 shorthand
alias venv='python3 -m venv venv && source venv/bin/activate' # Quick venv setup

# -----------------------
# Starship Prompt Toggles (optional)
# -----------------------
alias sp-on='eval "$(starship init bash)"'  # Enable Starship prompt
alias sp-off='unset PROMPT_COMMAND; export PS1="\$ "'  # Disable Starship prompt
alias dotgit='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
