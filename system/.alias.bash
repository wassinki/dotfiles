# Shortcuts

if  ps $$ | grep -q zsh; then
  alias reload="source ~/.zprofile"
else
  alias reload="source ~/.bash_profile"
fi
