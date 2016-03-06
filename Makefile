# dotfile 展開用MakeFile
# dotfileを定義
DOT_FILES = .gitconfig .gitignore_global .gvimrc .lesshst .vimrc .zshrc .zshrc.mac .zsh_history .zshrc.zplug tmux.conf

all:
	$(foreach f, $(DOT_FILES), link-dot-file-$(f))
	mkdir ~/.vim
	mkdir ~/.vim/template
	ln -snf ./vim_template/template.py ~/.vim/template/template.py
	ln -snf ./vim_template/template.sh ~/.vim/template/template.sh

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))


link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
