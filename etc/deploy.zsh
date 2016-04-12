# linking dotfiles from dotfiles repos.
cd ..
echo "Linking dotfiles."
for file in .??*
do
    [ "$file" = ".git" ] && continue
    [ "$file" = ".DS_Store" ] && continue

    ln -snfv "$f" "$HOME"/"$f"
done

# Install vim templates.
echo "Installing vim templates."
cd ~
[ ! -d .vim] && mkdir .vim
cd ~/.vim
[ ! -d template] && mkdir template

cd ~/dotfiles/vim_template
for file in template.*
do
    ln -snfv "$file" "$HOME"/.vim/template/"$file"
done
