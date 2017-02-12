" Automake Run on Enter strs and write files.
autocmd! BufWritePost,BufEnter,InsertLeave * Neomake

let g:neomake_error_sign = {"text": ">>", "texthl": "Error"}
let g:neomake_warning_sign = {"text": ">", "texthl": "Todo"}

" Python Setting.
let g:neomake_python_enabled_makers = ['python', 'pylint', 'pylama', 'flake8', 'mypy']

let g:neomake_python_pylama_maker = { 'args': ['-i', 'E501, W0611'], }
let g:neomake_python_pylint_maker = { 'args': ['--disable=line-too-long'] }
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=250', '--ignore=E115,E266'], }
