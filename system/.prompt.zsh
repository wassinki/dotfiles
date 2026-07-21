## Prompt

export GIT_PS1_SHOWDIRTYSTATE=1

[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
[ -e "${HOME}/.git-prompt.sh" ] && source "${HOME}/.git-prompt.sh"

function refresh_git_context() {
    GIT_PROMPT="$(__git_ps1)"

    if [[ -n "$GIT_PROMPT" ]]; then
        GIT_PROJECT_ROOT="$(git rev-parse --show-toplevel)"
        GIT_PROJECT="${GIT_PROJECT_ROOT:t}"
    else
        unset GIT_PROJECT_ROOT GIT_PROJECT
    fi
}

function git_prompt_command() {
    if [[ -n "$GIT_PROMPT" ]]; then
        # Inside a Git repository, hide the path
        RELATIVE_PATH="${PWD/${HOME}\/}"
        PROMPT="%F{green}${GIT_PROJECT} %F{grey}${RELATIVE_PATH} %F{yellow}${GIT_PROMPT}%f $ "
    else
        # Not inside a Git repository, show the path
        PROMPT='%n@%m %F{green}%~%f $ '
    fi
}

PROMPT_COMMAND=git_prompt_command

function iterm_title() {
    TITLE="${PWD##*/}"

    if [[ -n "$GIT_PROMPT" ]]; then
        TITLE="${TITLE} - ${GIT_PROJECT} ${GIT_PROMPT}"
    fi
    echo -ne "\033];${TITLE}\007"

    if [ -e .iterm-colors ]; then
        source .iterm-colors
    else
        echo -en "\033]6;1;bg;red;brightness;255\a"$PRELINE
        echo -en "\033]6;1;bg;green;brightness;255\a"$PRELINE
        echo -en "\033]6;1;bg;blue;brightness;255\a"$PRELINE
    fi
}

# put this in your .bash_profile
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND="iterm_title; $PROMPT_COMMAND";
fi

function precmd() {
   refresh_git_context; iterm_title; git_prompt_command
}
