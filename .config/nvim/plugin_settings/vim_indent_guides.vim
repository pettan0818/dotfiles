"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

