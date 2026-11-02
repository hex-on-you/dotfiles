if [ -t 1 ] && [ -x /usr/bin/tput ] && tput setaf 1 >/dev/null 2>&1; then
    color_prompt=yes
else
    color_prompt=
fi

if [[ "$(tty)" == /dev/tty[0-9]* ]]; then

    PS1='[\u@\h \W]\$ '

else

    if [ "$color_prompt" = yes ]; then
	PS1='┌(\[\e[32;1m\]\$\[\e[0m\])-(  \[\e[34;1m\]\w\[\e[0m\]) \n\[\e[1m\]└\[\e[0m\]'
    else
        PS1='\u@\h:\w\$ '
    fi

    case "$TERM" in
        xterm*|alacritty*|foot*|kitty*|wezterm*)
            PS1="\[\e]0;\u@\h: \w\a\]$PS1"
            ;;
    esac
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors \
        && eval "$(dircolors -b ~/.dircolors)" \
        || eval "$(dircolors -b)"
fi
