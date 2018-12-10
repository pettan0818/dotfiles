if [ ! -f ~/.tmux/plugins/tpm/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -f ~/.pyenv/bin/pyenv ]; then
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
fi

if [ ! -f ~/.zplug/init.zsh ]; then
    # export ZPLUG_HOME = ~/.zplug
    # git clone https://github.com/zplug/zplug $ZPLUG_HOME
    curl -sL --proto-redir -all,https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

echo Initialize Done.
