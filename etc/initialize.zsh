# NeoBundle installer
cd ~
echo "NeoBundle will be installed."
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ./neo_bundle.sh
sh ./neo_bundle.sh
rm ./neo_bundle.sh

# Tmux Plugin Manager
echo "Tmux Plugin Mangager will be installed."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
