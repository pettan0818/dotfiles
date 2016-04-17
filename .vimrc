" グループ設定
augroup MyAutoCmd
    autocmd!
augroup END

" 普通は入れなくても動くと思うが、挙動不審なとき用の設定
" -----
" 文字コード関係で困ったとき用
set fileencodings=utf-8,iso-2022-jp,eucjp,cp932,ucs-bom,latin1
set fileformats=unix,dos,mac
" vim内部のエンコーディング
set encoding=utf-8
" Vi互換モードを使わず、Vimとして使う
set nocompatible

" 表示関係
" -----
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの行数
set cmdheight=1
" Title掃除
set notitle
" 編集中のファイル名の表示
"set title
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 256色許可
set t_Co=256

" シンタックス・ハイライトを有効にする
syntax on

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
" 自動インデント等を有効にする
" filetype plugin indent on
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

" マクロ設定とキー設定
" ESCを素早く効くようにする。
set notimeout
set ttimeout
set timeoutlen=100

" 入力モード中に素早くjjと入力したときはESCと見なす。
inoremap jj <ESC>
inoremap kk <ESC>

" ESCを二回押すとハイライト消去
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" Shift + h, lで文末・文頭へ。
nnoremap <S-h> ^
nnoremap <S-l> $

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" E-macs的な移動を実現
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

" 挿入モードでC-で動けるようにする。
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" T + ? で各種設定をトグル
nnoremap [toggle] <Nop>
nmap T [toggle]
nnoremap <silent> [toggle]s :setl spell!<CR>:setl spell?<CR>
nnoremap <silent> [toggle]l :setl list!<CR>:setl list?<CR>
nnoremap <silent> [toggle]t :setl expandtab!<CR>:setl expandtab?<CR>
nnoremap <silent> [toggle]w :setl wrap!<CR>:setl wrap?<CR>

"タブ関連ショートカットキー
nnoremap [TABCMD]  <nop>
nmap     <leader>^ [TABCMD]

nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>
nnoremap <silent> [TABCMD]t :<c-u>tabnew<cr>

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" w!! でスーパーユーザーとして保存(sudoが使える環境限定)
cmap w!! w !sudo tee > /dev/null %

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

let s:mac_vimrc = expand('~/.vimrc.mac')
if filereadable(s:mac_vimrc)
    execute 'source ' . s:mac_vimrc
endif

let s:neobundle_initializer = expand('~/.vimrc.initializer')
if filereadable(s:neobundle_initializer)
    execute 'source ' . s:neobundle_initializer
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle関連
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    " NeoBundleが存在しない, Vimのバージョンが古い場合はプラグインを一切読み込まない
    let s:noplugin = 1
else
    " NeoBundleを'runtimepath'に追加し初期化を行う
    if has('vim_starting')
        " bundleで管理するディレクトリを指定
        execute "set runtimepath+=" . s:neobundle_root
    endif
    " [141022] NeoBundle#rc() is now deprecated...
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    " NeoBundle自身をNeoBundleで管理させる
    NeoBundleFetch 'Shougo/neobundle.vim'

    " 非同期通信を可能にする
    " 'build'が指定されているのでインストール時に自動的に
    " 指定されたコマンドが実行され vimproc がコンパイルされる
    NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }
    NeoBundle 'Shougo/vimshell.vim'
" 導入プラグインリスト
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 日本語ヘルプ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'vim-jp/vimdoc-ja'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [BugFix] Djangoを正しくVimで読み込めるようにする
" [BugFix] Vimで正しくvirtualenvを処理できるようにする
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " " Djangoを正しくVimで読み込めるようにする
    " [ERROR] vim-django-support will suppress vim performnce
    " NeoBundleLazy "lambdalisue/vim-django-support", {
    "     \ "autoload": {
    "     \   "filetypes": ["python", "python3", "djangohtml"]
    "     \ }}
    "
     " Vimで正しくvirtualenvを処理できるようにする
    NeoBundleLazy "jmcantrell/vim-virtualenv", {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"]
        \ }}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LightLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'itchyny/lightline.vim'
    let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [
            \     ['mode', 'paste'],
            \     ['fugitive', 'gitgutter', 'filename'],
            \   ],
            \   'right': [
            \     ['lineinfo', 'syntastic'],
            \     ['percent'],
            \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
            \   ]
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode',
            \   'syntastic': 'SyntasticStatuslineFlag',
            \   'charcode': 'MyCharCode',
            \   'gitgutter': 'MyGitGutter',
            \ },
            \ 'separator': {'left': '>', 'right': '<'},
            \ 'subseparator': {'left': '>', 'right': '<'}
            \ }

    function! MyModified()
        return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! MyReadonly()
        return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '>' : ''
    endfunction

    function! MyFilename()
        return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
            \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
            \  &ft == 'unite' ? unite#get_status_string() :
            \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
            \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
            \ ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction

    function! MyFugitive()
        try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        let _ = fugitive#head()
        return strlen(_) ? '> '._ : ''
        endif
    catch
    endtry
    return ''
    endfunction

    function! MyFileformat()
        return winwidth('.') > 70 ? &fileformat : ''
    endfunction

    function! MyFiletype()
        return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
    endfunction

    function! MyFileencoding()
        return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
    endfunction

    function! MyMode()
        return winwidth('.') > 60 ? lightline#mode() : ''
    endfunction

    function! MyGitGutter()
        if ! exists('*GitGutterGetHunkSummary')
            \ || ! get(g:, 'gitgutter_enabled', 0)
            \ || winwidth('.') <= 90
            return ''
        endif
        let symbols = [
            \ g:gitgutter_sign_added . ' ',
            \ g:gitgutter_sign_modified . ' ',
            \ g:gitgutter_sign_removed . ' '
            \ ]
        let hunks = GitGutterGetHunkSummary()
        let ret = []
        for i in [0, 1, 2]
            if hunks[i] > 0
                call add(ret, symbols[i] . hunks[i])
            endif
        endfor
        return join(ret, ' ')
    endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
    function! MyCharCode()
        if winwidth('.') <= 70
            return ''
        endif

  " Get the output of :ascii
        redir => ascii
        silent! ascii
        redir END

        if match(ascii, 'NUL') != -1
            return 'NUL'
        endif

    " Zero pad hex values
        let nrformat = '0x%02x'

        let encoding = (&fenc == '' ? &enc : &fenc)

        if encoding == 'utf-8'
        " Zero pad with 4 zeroes in unicode files
            let nrformat = '0x%04x'
        endif

    " Get the character and the numeric value from the return value of :ascii
    " This matches the two first pieces of the return value, e.g.
    " "<F>  70" => char: 'F', nr: '70'
        let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

    " Format the numeric value
        let nr = printf(nrformat, nr)

        return "'". char ."' ". nr
    endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-template
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle "thinca/vim-template"
    " テンプレート中に含まれる特定文字列を置き換える
    autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
    function! s:template_keywords()
        silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
        silent! %s/<+FILENAME+>/\=expand('%:r')/g
    endfunction
    " テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
    autocmd MyAutoCmd User plugin-template-loaded
        \   if search('<+CURSOR+>')
        \ |   silent! execute 'normal! "_da>'
        \ | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "Shougo/unite.vim", {
        \ "autoload": {
        \   "commands": ["Unite", "UniteWithBufferDir"]
        \ }}
    NeoBundleLazy 'h1mesuke/unite-outline', {
        \ "autoload": {
        \   "unite_sources": ["outline"],
        \ }}
    NeoBundleLazy 'Shougo/neomru.vim', {
        \ "autoload": {
        \   "commands": ["Unite"]
        \ }}

    nnoremap [unite] <Nop>
    nmap U [unite]
    nnoremap <silent> [unite]U :UniteResume<CR>
    nnoremap <silent> [unite]/ :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
    nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=search line -start-insert -no-quit<CR>
    nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
    nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
    nnoremap <silent> [unite]r :<C-u>Unite register<CR>
    nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
    nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
    nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
    nnoremap <silent> [unite]p :<C-u>Unite process<CR>
    nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
    nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
    nnoremap <silent> [unite]w :<C-u>Unite window<CR>

    let s:hooks = neobundle#get_hooks("unite.vim")
    function! s:hooks.on_source(bundle)
        " start unite in insert mode
        let g:unite_enable_start_insert = 1
        let g:unite_source_history_yank_enable = 1
        let g:unite_source_file_mru_limit = 200
        " use vimfiler to open directory
        call unite#custom_default_action("source/bookmark/directory", "vimfiler")
        call unite#custom_default_action("directory", "vimfiler")
        call unite#custom_default_action("directory_mru", "vimfiler")
        autocmd MyAutoCmd FileType unite call s:unite_settings()
        function! s:unite_settings()
            imap <buffer> <Esc><Esc> <Plug>(unite_exit)
            nmap <buffer> <Esc> <Plug>(unite_exit)
            nmap <buffer> <Esc><Esc> <Plug>(unite_exit)
            nmap <buffer> <C-n> <Plug>(unite_select_next_line)
            nmap <buffer> <C-p> <Plug>(unite_select_previous_line)
        endfunction
    endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimFiler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "Shougo/vimfiler", {
        \ "depends": ["Shougo/unite.vim"],
        \ "autoload": {
        \   "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer"],
        \   "mappings": ['<Plug>(vimfiler_switch)'],
        \   "explorer": 1,
        \ }}
    nnoremap <Leader>e :VimFilerExplorer<CR>
    " close vimfiler automatically when there are only vimfiler open
    autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
    let s:hooks = neobundle#get_hooks("vimfiler")
    function! s:hooks.on_source(bundle)
        let g:vimfiler_as_default_explorer = 1
        let g:vimfiler_enable_auto_cd = 1

        " .から始まるファイルおよび.pycで終わるファイルを不可視パターンに
        " 2013-08-14 追記
        let g:vimfiler_ignore_pattern = "\%(^\..*\|\.pyc$\)"

        " vimfiler specific key mappings
        autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
        function! s:vimfiler_settings()
        " ^^ to go up
        nmap <buffer> ^^ <Plug>(vimfiler_switch_to_parent_directory)
        " use R to refresh
        nmap <buffer> R <Plug>(vimfiler_redraw_screen)
        " overwrite C-l
        nmap <buffer> <C-l> <C-w>l
        endfunction
    endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git 関連
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "mattn/gist-vim", {
        \ "depends": ["mattn/webapi-vim"],
        \ "autoload": {
        \   "commands": ["Gist"],
        \ }}

    " vim-fugitiveは'autocmd'多用してるっぽくて遅延ロード不可
    NeoBundle "tpope/vim-fugitive"
    NeoBundleLazy "gregsexton/gitv", {
        \ "depends": ["tpope/vim-fugitive"],
        \ "autoload": {
        \   "commands": ["Gitv"],
        \ }}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" テキスト編集関連
" Vim-Surround
" Align
" Yankring.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'vim-scripts/Align'
    NeoBundle 'vim-scripts/YankRing.vim'
    let g:yankring_history_dir = '~/.vim/'
    let g:yankring_max_history = 10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('lua') && v:version >= 703 && has('patch885')
    NeoBundleLazy "Shougo/neocomplete.vim", {
        \ "autoload": {
        \   "insert": 1,
        \ }}
    let s:hooks = neobundle#get_hooks("neocomplete.vim")
    let g:neocomplete#enable_at_startup = 1
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_fuzzy_completion = 1
        let g:neocomplete#enable_auto_select = 0
        " キーマッピング
        " 補完のキャンセル
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<BS>"
        " Enterで補完の確定(endwiseとの競合対策
        function! s:my_crinsert()
            return pumvisible() ? neocomplete#close_popup() : "\<Cr>"
        endfunction
        inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>
        " TABで補完を選択
        inoremap <expr><TAB> pumvisible() ? "<C-N>" : "<TAB>"
    endfunction

else
    NeoBundleLazy "Shougo/neocomplcache.vim", {
        \ "autoload": {
        \   "insert": 1,
        \ }}
    let g:neocomplcache_enable_at_startup = 1
    let s:hooks = neobundle#get_hooks("neocomplcache.vim")
    function! s:hooks.on_source(bundle)
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_smart_case = 1
    endfunction
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast-Fold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle "Konfekt/FastFold"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle "ervandew/supertab"
" Omni補完をShift + Tabで実現
" <C-E>で補完解除、<C-X><C-O>でオムニ補完、<C-P>で補完選択解除
let g:SuperTabDefaultCompletionType = "<C-X><C-O><C-P>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" NeoBundleLazy "davidhalter/jedi-vim", {
"       \ "autoload": {
"       \   "filetypes": ["python", "python3", "djangohtml"],
"       \ },
"       \ "build": {
"       \   "mac": "pip install jedi",
"       \   "unix": "pip install jedi",
"       \ }}
"
"     let s:hooks = neobundle#get_hooks("jedi-vim")
"
"     function! s:hooks.on_source(bundle)
"         " jediにvimの設定を任せると'completeopt+=preview'するので
"         " 自動設定機能をOFFにし手動で設定を行う
"         let g:jedi#auto_vim_configuration = 0
"         " 補完の最初の項目が選択された状態だと使いにくいためオフにする
"         let g:jedi#popup_select_first = 0
"         " Don't Popup on dot.
"         let g:jedi#completions_enabled = 0
"         let g:jedi#popup_on_dot = 0
"         " quickrunと被るため大文字に変更
"         " gundoと被るため大文字に変更 (2013-06-24 10:00 追記)
"         let g:jedi#rename_command = '<Leader>R'
"         let g:jedi#goto_assignments_command = '<Leader>G'
"
"         " Python comp feat with jedi.vim
"         " NeocompleteとJedi-vimをフルに連携すると、Neocompleteの動作が制限され
"         " るので、OmniFunctionは停止。
"         autocmd FileType python setlocal omnifunc=jedi#completions
"             if !exists('g:neocomplete#force_omni_input_patterns')
"                 let g:neocomplete#force_omni_input_patterns = {}
"             endif
"             "let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"             let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"     endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neo-Snippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    NeoBundleLazy "Shougo/neosnippet.vim", {
"        \ "depends": ["honza/vim-snippets"],
"        \ "autoload": {
"        \   "insert": 1,
"        \ }}
"
"    let s:hooks = neobundle#get_hooks("neosnippet.vim")
"    function! s:hooks.on_source(bundle)
"
"    " Plugin key-mappings.
""    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"    xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"    " SuperTab like snippets behavior.
"    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"        \ "\<Plug>(neosnippet_expand_or_jump)"
"        \: pumvisible() ? "\<C-n>" : "\<TAB>"
"    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"        \ "\<Plug>(neosnippet_expand_or_jump)"
"        \: "\<TAB>"
"    " For snippet_complete marker.
"    if has('conceal')
"        set conceallevel=2 concealcursor=i
"    endif
"
"    " Enable snipMate compatibility feature.
"    let g:neosnippet#enable_snipmate_compatibility = 1
"
"    " Tell Neosnippet about the other snippets
"    let g:neosnippet#snippets_directory=s:bundle_root . '/vim-snippets/snippets'
"    endfunction
"
"    NeoBundle "Shougo/neosnippet-snippets"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle "nathanaelkane/vim-indent-guides"

    " vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
    let g:indent_guides_enable_on_vim_startup=1
    " ガイドをスタートするインデントの量
    let g:indent_guides_start_level=1
    " 自動カラーを無効にする
    let g:indent_guides_auto_colors=0
    " 奇数インデントのカラー
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
    " 偶数インデントのカラー
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
    " ハイライト色の変化の幅
    let g:indent_guides_color_change_percent = 30
    " ガイドの幅
    let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gundo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "sjl/gundo.vim", {
        \ "autoload": {
        \   "commands": ['GundoToggle'],
        \}}
    nnoremap <Space>g :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TaskList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "vim-scripts/TaskList.vim", {
        \ "autoload": {
        \   "mappings": ['<Plug>TaskList'],
        \}}
    nmap <Space>T <plug>TaskList

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'majutsushi/tagbar', {
        \ "autload": {
        \   "commands": ["TagbarToggle"],
        \ },
        \ "build": {
        \   "mac": "brew install ctags",
        \ }}
    nmap <Space>t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickRun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "thinca/vim-quickrun", {
        \ "autoload": {
        \   "mappings": [['nxo', '<Plug>(quickrun)']]
        \ }}

    if has("clientserver")
        nmap <Space>r :QuickRun -runner vimproc<CR>
    else
        nmap <Space>r <Plug>(quickrun)
    endif

    let s:hooks = neobundle#get_hooks("vim-quickrun")
    function! s:hooks.on_source(bundle)
        let g:quickrun_config = {
        \ "_": {
        \   "outputter/buffer/close_on_empty" : 1,
        \   "outputter/buffer/split" : ":vertical rightb",
        \ },
        \ "python":{
        \   "type" : "python",
        \   "command" : "ipython",
        \ },}
    endfunction
    " <C/c>で、強制終了
    " quickrun.vim が実行していない場合には <C-c> を呼び出す
    nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimPandoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "vim-pandoc/vim-pandoc", {
        \ "autoload": {
        \   "filetypes": ["text", "pandoc", "markdown", "rst", "textile"],
        \ }}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[TODO] エラー表示の矢印がどう考えても劣化している。
"[TODO] コードに直接色づけするのをやめさせる。
    NeoBundle "scrooloose/syntastic"
    ", {
    "    \ "build": {
    "    \   "mac": ["pip install flake8", "npm -g install coffeelint"],
    "    \   "unix": ["pip install flake8", "npm -g install coffeelint"],
    "    \ }}

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 2
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    " Python用のチェッカー指定
    let g:syntastic_python_checkers = ["flake8","pyflakes","pylint","pep257","pep8","python"]

    " エラー無視の設定
    " 複数指定する場合はカンマ区切り
    let g:syntastic_python_pep8_args = '--ignore="E501,E128"'
    let g:syntastic_python_pylint_args = '--disable="C0301,W1402"'
    let g:syntastic_python_flake8_args = '--ignore="E501,E128"'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced Commentify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "コメントアウトしたい範囲を選択して、
    "[Leader]xでコメントアウト
    NeoBundle 'hrp/EnhancedCommentify'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-R-Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'jcfaria/Vim-R-Plugin', {
            \ "autoload": {
            \   "filetypes": ["R"],
            \ }}
    let vimrplugin_r_path='C:\Program Files\R\R-3.0.3\bin'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML5 ominicomplete & syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'othree/html5.vim', {
            \     'autoload': {'filetypes': ['html']}
            \  }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSS3 syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'hail2u/vim-css3-syntax', {
            \     'autoload': {'filetypes': ['css']}
            \  }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-ref
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'thinca/vim-ref', {
            \     'autoload': {'commands': ['Ref']}
            \  }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'vim-scripts/vim-auto-save'

    " デフォルトで無効にする
    let g:auto_save = 0
    " do not save while in insert mode
    let g:auto_save_in_insert_mode = 0
    nmap [toggle]S :AutoSaveToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
" Previm
" Markdownの自己完結型プレビューワー
" [TODO] 何とか駆動するようにがんばろう。。。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'plasticboy/vim-markdown', {
            \     'autoload': {'filetypes': ['pandoc','md', 'mkd']}
            \  }
    NeoBundleLazy 'tyru/open-browser.vim', {
            \     'autoload': {'filetypes': ['pandoc','md', 'mkd']}
            \  }
    NeoBundleLazy 'kannokanno/previm', {
            \     'autoload': {'filetypes': ['pandoc','md', 'mkd']}
            \  }
    " Markdown Preview
    " <F7>でプレビュー
    nnoremap <silent> <F7> :PrevimOpen<CR>
    " 現在のタブを閉じる
    nnoremap <silent> <Leader>q :ChromeTabClose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tcomment_vim
" コメントON/OFFを手軽に実行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'tomtom/tcomment_vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Trailing WhiteSpace
" 行末の半角スペースを可視化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'bronson/vim-trailing-whitespace'
    let g:extra_whitespace_ignored_filetypes = ['unite', 'mkd']

""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Obey PEP8.
""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'hynek/vim-python-pep8-indent', {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ }

""""""""""""""""""""""""""""""""""""""""""""""""
" Python Syntax Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy 'hdima/python-syntax', {
        \ "autoload": {
        \   "filetypes": ["python", "python3", "djangohtml"],
        \ },
        \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"カラースキーマの設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Hybrid カラースキーム
    NeoBundle 'w0ng/vim-hybrid'
    " solarized カラースキーム
    NeoBundle 'altercation/vim-colors-solarized'
    " mustang カラースキーム
    NeoBundle 'croaker/mustang-vim'
    " wombat カラースキーム
    NeoBundle 'jeffreyiacono/vim-colors-wombat'
    " jellybeans カラースキーム
    NeoBundle 'nanotech/jellybeans.vim'
    " lucius カラースキーム
    NeoBundle 'vim-scripts/Lucius'
    " zenburn カラースキーム
    NeoBundle 'vim-scripts/Zenburn'
    " mrkn256 カラースキーム
    NeoBundle 'mrkn/mrkn256.vim'
    " railscasts カラースキーム
    NeoBundle 'jpo/vim-railscasts-theme'
    " pyte カラースキーム
    NeoBundle 'therubymug/vim-pyte'
    " molokai カラースキーム
    NeoBundle 'tomasr/molokai'
    call neobundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" インストールされていないプラグインのチェックおよびダウンロード
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleCheck
    let g:hybrid_use_Xresources = 1
    colorscheme molokai
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 最終処理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
    "set clipboard& clipboard+=unnamedplus,unnamed
    set clipboard+=unnamed,unnamedplus
else
    " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
    "set clipboard& clipboard+=unnamed
    set clipboard+=unnamed
endif

" ウガンダ対策
set shortmess+=I

" lightlineの有効化措置
set laststatus=2

" ファイルタイププラグインおよびインデントを有効化
" これはNeoBundleによる処理が終了したあとに呼ばなければならない
filetype detect
filetype plugin on
filetype indent on
