set completeopt+=noselect
" Basic settings.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_delay = 750

call deoplete#custom#source('look', 'filetypes', ['rst', 'markdown', 'txt', 'gitrebase', 'gitcommit', 'vcs-commit', 'hybrid', 'text', 'help', 'tex'])
" Keymapping.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<BS>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction
