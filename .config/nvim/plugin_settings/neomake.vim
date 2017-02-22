" Automake Run on Enter strs and write files.
autocmd! BufWritePost,BufEnter,InsertLeave * Neomake

let g:neomake_error_sign    = { 'text': '>>', 'texthl': 'NeomakeErrorSign' }
let g:neomake_warning_sign  = { 'text': 'W>', 'texthl': 'NeomakeWarningSign' }
let g:neomake_message_sign  = { 'text': 'M>', 'texthl': 'NeomakeMessageSign' }
let g:neomake_info_sign     = { 'text': 'I>', 'texthl': 'NeomakeInfoSign' }

let g:neomake_python_enabled_makers = ['python', 'mypy', 'flake8', 'pylint']

" let g:neomake_python_pylama_maker_args = neomake#makers#ft#python#pylama()['args'] + ['-i', 'E501, W0611']
let g:neomake_python_pylint_maker_args = neomake#makers#ft#python#pylint()['args'] + ['--disable=line-too-long']
let g:neomake_python_flake8_maker_args = neomake#makers#ft#python#flake8()['args'] + ['--ignore=E115,E266,E501']
