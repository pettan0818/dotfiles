" Must set in System Vimrc of Macvim
" When you feel something wrong with vim, check system vimrc and add this Line.
let g:no_vimrc_example = 1
" No Vi互換モード
if !&compatible
    set nocompatible
endif

" Reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

let g:python_host_prog = "/Users/noname/.pyenv/shims/python2"
let g:python3_host_prog = "/Users/noname/.pyenv/shims/python3"

" Moduled Plugin setting.
source $XDG_CONFIG_HOME/nvim/plugin.vim

" Commands Settings.
source $XDG_CONFIG_HOME/nvim/general.vim

" Commands Settings.
source $XDG_CONFIG_HOME/nvim/commands.vim

" keymap Settings.
source $XDG_CONFIG_HOME/nvim/keymaps.vim

" VimDiff Settings.
source $XDG_CONFIG_HOME/nvim/diff.vim

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 最終処理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ColorScheme must be setted up below processing Plugins.
set termguicolors
colorscheme hybrid

" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard+=unnamed,unnamedplus
else
    set clipboard+=unnamed
endif

" 注意: この内容は:filetype onよりも後に記述すること。
"autocmd FileType *
"\   if &l:omnifunc == ''
"\ |   setlocal omnifunc=syntaxcomplete#Complete
"\ | endif

" ウガンダ対策
set shortmess+=I

" lightlineの有効化措置
set laststatus=2

" ファイルタイププラグインおよびインデントを有効化
" シンタックス・ハイライトを有効にする
syntax on
filetype on
filetype detect
filetype indent on
filetype plugin on
