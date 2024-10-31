"общая настройка
set cursorline
set t_Co=256
set nocompatible
syntax on
set hlsearch
set visualbell
set noerrorbells
set novisualbell
set mouse=a
set nobackup
set noswapfile
set number relativenumber
set scrolloff=10
set ruler
set incsearch
" цветовая схема
colorscheme mycolor

" отступы
set expandtab
set smarttab
set copyindent        
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set shiftround
" статус бар
set ls=2 

set nobackup 

set encoding=utf8

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1
"главное меню
set shm+=i
"python
set pyx=3
let python_highlight_all = 1
"Plugin 'klen/python-mode'
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

 let &t_SI = "\e[2 q"
 let &t_SR = "\e[2 q"
 let &t_EI = "\e[2 q"



