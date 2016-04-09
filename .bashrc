# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
 . /etc/bashrc
fi

# User specific aliases and functions
## Alias
alias ls='ls -p --color=auto'
alias l='ls'
alias ll='ls -lFh'
alias la='ls -A'
alias lla='ll -A'
alias mv='mv -i'
alias cp='cp -i'
alias rmdir='rm -rf'
alias grep='grep --color=auto'
alias egrep='grep -E'
alias fgrep='grep -F'

## カスタマイズ設定
# プロンプトの設定
case ${UID} in
0)
    PS1='\[\033[31m\]${PWD}\$\[\033[0m\] '
    PS2='\[\033[31m\]>\[\033[0m\] '
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PS1='\[\033[30m\]\h'" ${PS1}"
    ;;
*)
    PS1='\[\033[37m\]\w:\$\[\033[0m\] '
    PS2='\[\033[37m\]$\[\033[0m\] '
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PS1='\[\033[36m\]\D{%F} \t \u@\h'" ${PS1}"
    ;;
esac

# ターミナルの表示設定
case "${TERM}" in
kterm*|xterm)
    PROMPT_COMMAND='echo -e "\033]0;'"${USER}@${HOSTNAME%%.*}:"'${PWD}\007\c"'
    ;;
esac

#  ヒストリ系の環境変数の設定
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
export HISTIGNORE=?:??:exit
export HISTFILE=~/.bash_history/.bash_history-$OSTYPE-`date +%Y%m%d`

# 標準エディタ環境変数の設定
EDITOR=vim

# ロケール環境変数の設定
LANG=ja_JP.UTF-8

# パスの設定
PATH=$PATH:~/bin

export PATH LANG EDITOR

# .inputrcの読み込み
[ -f ~/.inputrc ] && bind -f ~/.inputrc
