set completeopt+=noselect
" Basic settings.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1

" Keymapping.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<BS>"
