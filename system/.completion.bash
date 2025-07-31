if is-executable brew; then
  BREW_PREFIX=$(brew --prefix)
fi

# tmux
if is-executable brew; then
  . "$BREW_PREFIX/etc/bash_completion.d/tmux"
fi

# Git
if is-executable git; then
  [ -e "$BREW_PREFIX/etc/bash_completion.d/git-completion.bash" ] &&  . "$BREW_PREFIX/etc/bash_completion.d/git-completion.bash"
  [ -e ~/.git-completion.bash ] && . ~/.git-completion.bash
fi
