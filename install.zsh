# Only Zsh can parse this file pattern matching.
target_dotfiles=.??*

cd ./vim_template
target_templates=template.*

# Cofirm process.
echo "target: $target_dotfiles\nvim_template: $target_templates\nFolloing files are linked OK? (y/n)"
read answer
case $answer in
    y)
        echo "OK. Linking..."
        ;;
    *)
        echo "Exited."
        exit
        ;;
esac

# linking dotfiles from dotfiles repos.
cd ~
for target in $target_dotfiles
do
    ln -snf ./dotfiles/$target ./
done
# ln -snf ./dotfiles/.zshrc ./
# ln -snf ./dotfiles/.vimrc ./
# ln -snf ./dotfiles/.dircolor ./
# ln -snf ./dotfiles/.gitconfig ./
# ln -snf ./dotfiles/.gitignore_global ./
# ln -snf ./dotfiles/.tmux.conf ./
# ln -snf ./dotfiles/.vimrc.initializer ./
# ln -snf ./dotfiles/.zshrc.zplug ./

# NeoBundle installer
echo "NeoBundle will be installed."
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ./neo_bundle.sh
sh ./neo_bundle.sh
rm ./neo_bundle.sh

# Install vim templates.
cd ~/.vim
mkdir template
cd ~/.vim/template
for tatget in $target_templates
do
    ln -snf ~/dotfiles/vim_template/$target ./
done
cd ~

# Tmux Plugin Manager
echo "Tmux Plugin Mangager will be installed."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
