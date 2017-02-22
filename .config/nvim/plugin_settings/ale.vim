let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)

let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_flake8_args = '--ignore=E115,E266,E501'
let g:ale_pylint_options = '--disable=line-too-long,no-member'
