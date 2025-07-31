## Prompt

export GIT_PS1_SHOWDIRTYSTATE=1

[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
[ -e "${HOME}/.git-prompt.sh" ] && source "${HOME}/.git-prompt.sh"

# Function to check if we are inside a Git repository
function git_prompt_command() {
    if [[ ! -z "$(__git_ps1)" ]]; then
        # Inside a Git repository, hide the path
        CURRENT_DIRECTORY=$(pwd)
        RELATIVE_PATH="${CURRENT_DIRECTORY/${HOME}\/}"
        PROJECT=$(basename $(git rev-parse --show-toplevel))
        PROMPT="%F{green}${PROJECT} %F{grey}${RELATIVE_PATH} %F{yellow}$(__git_ps1)%f $ "
    else
        # Not inside a Git repository, show the path
        PROMPT='%n@%m %F{green}%~%f $ '
    fi
}

PROMPT_COMMAND=git_prompt_command

function iterm_title() {
    TITLE="${PWD##*/}"

    if [[ ! -z "$(__git_ps1)" ]]; then
        PROJECT=$(basename $(git rev-parse --show-toplevel))
        TITLE="${TITLE} - ${PROJECT} $(__git_ps1)"
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
   iterm_title; git_prompt_command
}
