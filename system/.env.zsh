# Case-insensitive globbing (used in pathname expansion)

setopt NO_CASE_GLOB

# Recursive globbing with "**"

setopt extended_glob

# Append to the Bash history file, rather than overwriting it

setopt append_history

# Autocorrect typos in path names when using `cd`

setopt autocd

setopt correct

# Do not autocomplete when accidentally pressing Tab on an empty line.

zstyle ':completion:*' completer _complete

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

autoload -Uz zsh/terminfo
