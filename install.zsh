cd ~
ln -snf ./dotfiles/.zshrc ./
ln -snf ./dotfiles/.vimrc ./
ln -snf ./dotfiles/.dircolor ./
ln -snf ./dotfiles/.gitconfig ./
ln -snf ./dotfiles/.gitignore_global ./
ln -snf ./dotfiles/.tmux.conf ./
ln -snf ./dotfiles/.vimrc.initializer ./
ln -snf ./dotfiles/.zshrc.zplug ./

# NeoBundle installer
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > neo_bundle.sh
sh ./neo_bundle.sh

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
