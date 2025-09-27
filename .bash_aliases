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

alias ll='ls -alF'               # Long list format with file types
alias la='ls -A'                 # List all except . and ..
alias l='ls -CF'                 # Column view
alias lt='ls -lhS'               # List, human readable, sorted by size
alias lh='ls -d .* --color=auto' # Show hidden files only

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
