fpath+=~/.zsh/completion

autoload -Uz compinit

ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
STALE_COMPDUMP=("$ZSH_COMPDUMP"(N.mh+24))

if [[ ! -s "$ZSH_COMPDUMP" || ${#STALE_COMPDUMP} -gt 0 ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

unset ZSH_COMPDUMP STALE_COMPDUMP
