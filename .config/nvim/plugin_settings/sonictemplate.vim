"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-template
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:sonictemplate_vim_template_dir = ["$XDG_CONFIG_HOME/nvim/templates"]


    " " テンプレート中に含まれる特定文字列を置き換える
    " autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
    " function! s:template_keywords()
    "     silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    "     silent! %s/<+FILENAME+>/\=expand('%:r')/g
    " endfunction
    " " テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
    " autocmd MyAutoCmd User plugin-template-loaded
    "     \   if search('<+CURSOR+>')
    "     \ |   silent! execute 'normal! "_da>'
    "     \ | endif
    "
