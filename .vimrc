" No Vi互換モード
if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

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
" コンテキストに合わせてファイルタイプを変更する
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle 'Shougo/context_filetype.vim'

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
" Vim Outliner
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'vim-scripts/VOoM'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundleLazy "Shougo/unite.vim", {
        \ "autoload": {
        \   "commands": ["Unite", "UniteWithBufferDir"]
        \ }}
    NeoBundle "Shougo/unite-outline"
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
    nnoremap <silent> [unite]G :<C-u>Unite grammarous<CR>
    nnoremap <silent> [unite]r :<C-u>Unite register<CR>
    nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
    nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
    nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
    nnoremap <silent> [unite]p :<C-u>Unite process<CR>
    nnoremap <silent> [unite]o :<C-u>Unite outline -vertical -winwidth=40<CR>
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
    NeoBundle 'kana/vim-textobj-user'
    NeoBundle 'kana/vim-operator-user'
    NeoBundle 'kana/vim-textobj-line'
    NeoBundle 'osyo-manga/vim-textobj-multiblock'
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

        " _(アンダースコア)区切りの補完を有効化
        let g:neocomplete#enable_underbar_completion = 1
        let g:neocomplete#enable_camel_case_completion  =  1

        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " キーマッピング
        " 補完のキャンセル
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<BS>"
        inoremap <expr><S-Tab> neocomplete#smart_close_popup()."<C-X><C-O><C-P>"
        " Enterで補完の確定(endwiseとの競合対策)
        function! s:my_crinsert()
            return pumvisible() ? neocomplete#close_popup() : "\<Cr>"
        endfunction
        inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>
        " TABで補完を選択
        inoremap <expr><TAB> pumvisible() ? "<C-N>" : "<TAB>"
        if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
        endif
        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=jedi#completions
        " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
        let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript
        " let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
        let g:neocomplete#force_omni_input_patterns.python =
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
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

" Include Path Completion
NeoBundle "Shougo/neoinclude.vim"

" Syntax completion
NeoBundle "Shougo/neco-syntax"
let g:necosyntax#min_keyword_length = 2

" Vim syntax Completion
NeoBundle "Shougo/neco-vim"

" English words completion
NeoBundle "ujihisa/neco-look"

" Github completion
NeoBundle "rhysd/github-complete.vim"
let g:github_complete_enable_neocomplete = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
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

NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}

    let s:hooks = neobundle#get_hooks("jedi-vim")

    function! s:hooks.on_source(bundle)
        " jediにvimの設定を任せると'completeopt+=preview'するので
        " 自動設定機能をOFFにし手動で設定を行う
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#show_call_signatures = "0"
        " 補完の最初の項目が選択された状態だと使いにくいためオフにする
        let g:jedi#popup_select_first = 0
        " Don't Popup on dot.
        let g:jedi#completions_enabled = 0
        let g:jedi#popup_on_dot = 0
        " quickrunと被るため大文字に変更
        " gundoと被るため大文字に変更 (2013-06-24 10:00 追記)
        let g:jedi#rename_command = '<Leader>R'
        let g:jedi#goto_assignments_command = '<Leader>G'
        if jedi#init_python()
        function! s:jedi_auto_force_py_version() abort
            let major_version = pyenv#python#get_internal_major_version()
            call jedi#force_py_version(major_version)
        endfunction
        augroup vim-pyenv-custom-augroup
            autocmd! *
            autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
            autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
        augroup END
        endif
    endfunction

    " Do not load vim-pyenv until *.py is opened and
    " make sure that it is loaded after jedi-vim is loaded.
    NeoBundleLazy 'lambdalisue/vim-pyenv', {
            \ 'depends': ['davidhalter/jedi-vim'],
            \ 'autoload': {
            \   'filetypes': ['python', 'python3'],
            \ }}
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
" vim-grammarous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    NeoBundle "rhysd/vim-grammarous"
    let g:grammarous#default_comments_only_filetypes = {
                \ '*' : 1, 'help' : 0, 'markdown' : 0,
                \ }
    let g:grammarous#disabled_rules = {
                \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
                \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
                \ }
    let g:grammarous#hooks = {}
    function! g:grammarous#hooks.on_check(errs)
        nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
        nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
        nmap <buffer><Esc><Esc> <Plug>(grammarous-reset)
    endfunction

    function! g:grammarous#hooks.on_reset(errs)
        nunmap <buffer><C-n>
        nunmap <buffer><C-p>
        nunmap <buffer><Esc><Esc>
    endfunction

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
        \   "runner" : "vimproc",
        \   "runner/vimproc/updatetime" : 60,
        \ },
        \ "python":{
        \   "type" : "python",
        \   "command" : "python",
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

    " Go用のチェッカー
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

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
    let g:extra_whitespace_ignored_filetypes = ['unite', 'mkd', 'md']

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
    colorscheme jellybeans
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 最終処理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
    set clipboard+=unnamed,unnamedplus
else
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
