"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Denite-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nnoremap [denite] <Nop>
    nmap <Space>D [denite]
    nnoremap <silent> [denite]/ :<C-u>Denite -buffer-name=search line -start-insert -no-quit<CR>
    nnoremap <silent> [denite]s :<C-u>Denite -buffer-name=search line -start-insert -no-quit<CR>
    nnoremap <silent> [denite]f :<C-u>DeniteWithBufferDir -buffer-name=files file_mru<CR>
    nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
    nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
    nnoremap <silent> [denite]m :<C-u>Denite file_mru<CR>
    nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
    nnoremap <silent> [denite]d :<C-u>Denite dein<CR>
    nnoremap <silent> [denite]c :<C-u>Denite command<CR>
    nnoremap <silent> [denite]l :<C-u>Denite file_rec<CR>
    nnoremap <silent> [denite]h :<C-u>Denite help<CR>


