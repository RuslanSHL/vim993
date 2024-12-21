"обшая настройка
filetype plugin on 	"распознавание файлов
syntax on 		"подсветка синтаксиса
set nocompatible
set hlsearch 		"подсветка во время поиска
set incsearch
set vb
set noeb
set noswapfile 		"без доп файлов
set nobackup
set splitbelow 		"настройка разделения окон
set splitright
set scrolloff=10 	"10 строк до конца окна
set rnu 		"относительные номера строк
set nu			" обычные номера строк, получаются гибридные
set mouse= 		"без мыши
set foldmethod=indent 	"сворачивание
set foldlevel=99
set smarttab 		"отступы
set copyindent        
set shiftround
set shm+=i
set ls=2 
set encoding=utf8
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

"цветовая схема
set t_Co=256  		"256 цветов
colorscheme mycolor 	" цветовая схема

"сочетания
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"навигация
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" сворачивание
nnoremap <space> za
" Навигатия по табам
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <C-Down> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-Up> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" копирование/вставка в глобальный буфер
noremap <M-y> "+y<CR>
noremap <M-p> "+p
" закрыть все окна кроме текущего
noremap <M-q> :only<CR>

" настройка строки статуса
hi status_line_color cterm=reverse ctermbg=233 ctermfg=245 term=reverse 

function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi mode_color cterm=reverse ctermfg=245 ctermbg=DarkGreen term=reverse
    elseif a:mode == 'r'
        hi mode_color cterm=reverse ctermfg=245 ctermbg=red term=reverse
    else
        hi mode_color cterm=reverse ctermfg=245 ctermbg=green term=reverse
    endif
endfunction

ino <C-C> <Esc>
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi mode_color cterm=reverse ctermbg=233 ctermfg=245 term=reverse

set statusline=%#mode_color#█
set statusline+=\ %#status_line_color#%F
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, 	"file encoding
set statusline+=%{&ff}] 				"file format
set statusline+=%y      				"filetype
set statusline+=%h      				"help file flag
set statusline+=%m      				"modified flag
set statusline+=%r      				"read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

"плагины
if has('win64') || has('win32') || has('win16')
	call plug#begin('~/vimfiles/plugged')
else
	call plug#begin('~/.vim/plugged')
endif
	Plug 'preservim/nerdtree'
	Plug 'vim-autoformat/vim-autoformat'
call plug#end()

"NERDTree config
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
noremap <M-t> :NERDTree<Enter>

"NERDTree congig
autocmd FileType python map <buffer> <M-c> :call flake8#Flake8()<CR>
"python
set pyx=3
let python_highlight_all = 1
autocmd FileType python map <buffer> <C-s> :exec 'bo term ++rows=10 python %'<CR>
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufRead,BufNewFile *.py,*pyw set tabstop=4
au BufRead,BufNewFile *.py,*pyw set softtabstop=4
au BufRead,BufNewFile *.py,*pyw set autoindent
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set colorcolumn=80
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

"курсор
let &t_SI = "\e[2 q"
let &t_SR = "\e[2 q"
let &t_EI = "\e[2 q"


