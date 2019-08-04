# Prompt
# autoload -U colors && colors
export PS1="%n%{%F{red}%}@%{%f%}%m%{%F{red}%}:%{%f%}%? %~
%{%F{red}%}%#%{%f%} "

# Basic options
setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE  # dont write cmd to hist if it start with space
setopt INTERACTIVE_COMMENTS
setopt GLOB_STAR_SHORT  # change **/*.py to **.py
setopt GLOB_DOTS
setopt EXTENDED_GLOB  # use ~ to ignore, ex: **.py*~*.pyc will ignore .pyc
setopt NO_NOMATCH
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS  # use pushd when cd
# additional stuff
# setopt CORRECT  # auto correct command, not arguments

# Vi mode
# bindkey -v
# export KEYTIMEOUT=1
# autoload edit-command-line
# zle -N edit-command-line

# EMACS mode
bindkey -e
setopt EMACS
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line  # open editor with C-x C-e
# may not work in zsh 5.7:
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'  # non-word symbols are threated like words
# https://unix.stackexchange.com/questions/250690/how-to-configure-ctrlw-as-delete-word-in-zsh

# History search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
# bindkey "^[[A" history-beginning-search-backward-end
# bindkey "^[[B" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward

# alert when ready to promt:
precmd() {
    print -n "\a"
    # echo -ne "\a"
}

# # Tmux pane name
# clear_tmux_pane()
# {
#     printf "\033]2;\033\\"
# }
# clear_tmux_pane

#######################################################################
# Aliases
#######################################################################
#
alias l="ls -AF "
alias ll="ls -AFl "
alias -g M="| less"
alias tmuxs=". ~/.tmux.sh"
alias pkit="source $VENV_PATH/pkit/bin/activate; cd $CODE_PATH/pkit"
alias pypki="source $VENV_PATH/pypki/bin/activate; cd $CODE_PATH/pypki"
alias pypki2="source $VENV_PATH/pypki2/bin/activate; cd $CODE_PATH/pypki"
alias selen="source $VENV_PATH/selenium-tests/bin/activate; cd $CODE_PATH/selenium-tests"
alias code="cd $CODE_PATH"
alias venv="cd $VENV_PATH"

# Supervisor from port require alias and enviroment variables
alias supervisord="/opt/local/bin/supervisord-2.7"
alias supervisorctl="/opt/local/bin/supervisorctl-2.7"
export SUPERVISORD="/opt/local/bin/supervisord-2.7"
export SUPERVISORCTL="/opt/local/bin/supervisorctl-2.7"
#
# Python 3.7
alias python37="/opt/local/Library/Frameworks/Python.framework/Versions/3.7/bin/python3.7"
alias pip37="/opt/local/bin/pip-3.7"

# smart alias for find command:
f() {
    # find . -name "*$1*" -print
    print -C 1 **$1*
}

# ssh and attach tmux with compression:
ssht() {
    ssh -C -t "$1" tmux attach -t0
}
# dont use ssh sockets:
# alias sshnm='ssh -o "ControlMaster no"'

# More complex grep
GREP=/usr/bin/grep
g() {
    $GREP --color=always --with-filename --recursive $@ | less --RAW-CONTROL-CHARS
}
alias -g G="| $GREP --color"
# alias grep="$GREP"
alias grep=g


# Completion
zstyle ":completion:*:functions" ignored-patterns "_*"
zstyle ":completion:*" matcher-list "" 'm:{a-z\-}={A-Z\_}' 'r:|?=** m:{a-z\-}={A-Z\_}'

_mycomp () {
    [ $CURRENT -eq 1 ] && _command_names || _files
}
zstyle ":completion:*" completer _mycomp _parameters

autoload -U compinit ; compinit -d /tmp/.zcompdump

zstyle ":completion:*:default" list-colors ""
autoload -U complist

# Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
. $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[globbing]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[history-expansion]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=red"
ZSH_HIGHLIGHT_STYLES[redirection]="fg=red"
ZSH_HIGHLIGHT_STYLES[assign]="fg=cyan"

# Additional cleaning
~/.zsh/cleanup.sh
# Launch ssh-agent or reuse it
~/agent.sh $HOME/.ssh/agent.sock

# Murder process
murder()
{
    ps | grep "$1" | cut -d " " -f 1 | xargs kill -9
}

# Colorized man pages: http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}
