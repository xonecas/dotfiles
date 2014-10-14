# This theme depends on unicode and 256 colors.
# user@hostname ~/my/dir [git √|✗][venv]

autoload -U add-zsh-hook

xonecas_prompt () {
    USERNAME="%n"
    AT="%{$FG[009]%}@%{$FG[007]%}"
    HOSTNAME="%m"
    WORKING_DIR="%{$FG[008]%}%~"

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[004]%}[%{$FG[007]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[004]%}]%{$FG[007]%} "
    ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[009]%}✗%{$FG[007]%}"
    ZSH_THEME_GIT_PROMPT_CLEAN=" %{$FG[010]%}√%{$FG[007]%}"
    GIT="$(git_prompt_info)"

    function virtualenv_info {
        [ ! -z "$VIRTUAL_ENV" ] && \
            echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(basename $VIRTUAL_ENV)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    }

    PROMPT="$USERNAME$AT$HOSTNAME $WORKING_DIR $GIT$(virtualenv_info)$ %{$reset_color%}"
}

add-zsh-hook precmd xonecas_prompt
