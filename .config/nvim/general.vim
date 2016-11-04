" 普通は入れなくても動くと思うが、挙動不審なとき用の設定
" -----
" 文字コード関係で困ったとき用
set fileencodings=utf-8,iso-2022-jp,eucjp,cp932,ucs-bom,latin1
set fileformats=unix,dos,mac
" vim内部のエンコーディング
set encoding=utf-8

" 表示関係
" -----
" 256色許可
set t_Co=256
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの行数
set cmdheight=1
" Title掃除
set notitle
" 行番号の色
highlight LineNr ctermfg=darkyellow

" コマンドをステータスラインに表示
set showcmd
" 左端に行番号を表示する
set number
" カーソル行の背景色を変える
set cursorline
" 長い文字の折り返し
set wrap
" 自動改行無効化
set textwidth=0
" その代わり80文字目にラインを入れる
set colorcolumn=80

" 前時代的スクリーンベルの無効化
set t_vb=
set novisualbell

" 不可視文字も表示する
set list
" デフォルトの不可視文字は美しくないのでUniCodeできれいに
set listchars=eol:¬,tab:▸\
"set listchars=eol:~
"set listchars=tab:»\ ,trail:-,extends:»,precedes:«,nbsp:%

" モードの表示
" lightlineとの併用のため無効化しました。(2014/03/24)
set noshowmode
" ファイルマネージャで上キーで上のディレクトリに
set wildmenu

" 背景を真っ黒にする。
set background=dark
"日本語の行の連結時には空白を入力しない。
set formatoptions+=mM
"□や○の文字があってもカーソル位置がずれないようにする。
set ambiwidth=double
"画面最後の行をできる限り表示する。
set display+=lastline

" インデント関係
" -----
" オートインデント
set autoindent
set smartindent
set cindent

" ハードタブ教 & タブは4文字教 の人に最適化
" -----
" ファイルを開いた時のTab文字(<Tab>, \t)を空白何文字分で表示するか
set tabstop=4
" 自動インデントや << or >> で入力されるインデントの幅
set shiftwidth=4
" 入力中にTabキーを押した時、何文字分の空白で表示するか
set softtabstop=4
" Tabを空白に変換する
set expandtab

" 検索関係
" -----
" 検索文字列をハイライトする
set hlsearch
" 検索する時、大文字と小文字を無視する
set ignorecase
" 検索文字に大文字が入ったらやっぱり考慮する
set smartcase
" インクリメンタルサーチ
set incsearch

" バックスラッシュやクエスチョンを状況に合わせてエスケープする
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" 編集関係
" -----
" 全モードでのマウス有効化
set mouse=a
" '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set shiftround
" 補完時に大文字小文字を区別しない
set infercase
" cursorを文字がない部分でも動くようにする。
set virtualedit=all
" 左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,h,l,<,>,[,]
" バッファ切り替え時にHidden(プロセスを殺さない)
set hidden
" 新しく開く代わりにすでに開いているバッファを開く
set switchbuf=useopen
" 対応する括弧などのハイライト表示
set showmatch
" 対応括弧のハイライト表示を三秒間にする
set matchtime=3
" 対応括弧に<>を入れる
set matchpairs& matchpairs+=<:>
" BackSpaceでなんでも消す
set backspace=indent,eol,start

" Swapファイル?Backupファイル?前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile
set noundofile

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

