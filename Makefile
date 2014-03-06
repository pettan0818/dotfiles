# dotfile 展開用MakeFile
# dotfileを定義
DOT_FILES = .gitconfig .vimrc .zshrc .zshrc.local .vim .ssh

all: $(foreach f, $(DOT_FILES), link-dot-file-$(f))

.PHONY: clean
clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))


link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
