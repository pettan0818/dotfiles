set guifont=Andale\ Mono:h12

"カーソルを点滅させない
set guicursor=a:blinkon0

if has('multi_byte_ime')
  hi Cursor guifg=bg guibg=Green gui=NONE
  hi CursorIM guifg=NONE guibg=Purple gui=NONE
endif

colorscheme molokai
