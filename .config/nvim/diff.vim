"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimdiff設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetDiffMode()
    if &diff
        setlocal nospell
        setl scrollbind
        " setlocal wrap<
    endif
endfunction
autocmd VimEnter,FilterWritePre * call SetDiffMode()
" diffモードで開いて片方を残してそのまま編集したい時、 diffモードが続いてしまって見難いのでdiffoffをする必要がありますが、 これを自動で行う様に以下の様な設定をしておくと便利です。
autocmd WinEnter * if(winnr('$') == 1) && (getbufvar(winbufnr(0), '&diff')) == 1 | diffoff | endif
" 左側に編集中のファイル、右側に元のファイルを表示します。 (デフォルトではこのオプションはオフで、そのままだと右側に編集中のファイルがおかれる。)
" set splitright
" 開いたファイルの初期状態からの違いをdiffモードで見ることが出来る
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Change colourscheme when diffing
fun! SetDiffColours()
    highlight DiffAdd    cterm=bold ctermfg=white ctermbg=DarkGreen
    highlight DiffDelete cterm=bold ctermfg=white ctermbg=DarkGrey
    highlight DiffChange cterm=bold ctermfg=white ctermbg=DarkBlue
    highlight DiffText   cterm=bold ctermfg=white ctermbg=DarkRed
endfun
autocmd FilterWritePre * call SetDiffColours()
