# dotfile 展開用MakeFile
# dotfileを定義
DOT_FILES = .gitconfig .gitignore_global .gvimrc .lesshst .vimrc .zshrc .zshrc.mac .zsh_history

all: $(foreach f, $(DOT_FILES), link-dot-file-$(f))

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))


link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<
	@mkdir ~/.vim
	@mkdir ~/.vim/template
	@ln -snf $(CURDIR)/vim_template/* $(HOME)/.vim/template

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
	@$(RM) $(HOME)/.vim/template/*
