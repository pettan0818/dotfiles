nnoremap <Space>r :QuickRun<CR>
nnoremap <expr><silent>> <C-c> quickrun#is_runnning() ? quickrun#sweep_sessions() : "\<C-c>"

let g:quickrun_config = {
\ "_": {
\   "outputter" : "buffer",
\   "outputter/buffer/running_mark" : "ﾊﾞﾝ（∩`･ω･）ﾊﾞﾝﾊﾞﾝﾊﾞﾝﾊﾞﾝﾞﾝ",
\   "outputter/buffered/target" : "buffer",
\   "outputter/buffer/split" : "vertical rightb",
\   "outputter/buffer/close_on_empty" : 1,
\   "outputter/quickfix/close_on_empty" : 1,
\   "runner" : "vimproc",
\   "runner/vimproc/updatetime" : 60,
\   "runner/vimproc/sleep" : 10,
\ },
\ "C++":{
\   "type": "C++",
\   "command" : "clang++ -std=C++11",
\ },
\ "python":{
\   "type": "python",
\   "command" : "python",
\  }}

