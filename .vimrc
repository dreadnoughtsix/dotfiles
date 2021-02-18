" ============================================================================
" IMPORTANT
" ============================================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" ============================================================================
" PLUGINS
" ============================================================================
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tyru/restart.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'Raimondi/delimitMate'
Plugin 'alvan/vim-closetag'
Plugin 'vim-scripts/loremipsum'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'vim-syntastic/syntastic'
Plugin 'shime/vim-livedown'
Plugin 'jvanja/vim-boostrap4-snippets'
" Colour Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mkarmona/colorsbox'
Plugin 'morhetz/gruvbox'
Plugin 'freeo/vim-kalisi'
Plugin 'tomasr/molokai'
Plugin 'crusoexia/vim-monokai'
Plugin 'ayu-theme/ayu-vim'
Plugin 'carakan/new-railscasts-theme'
Plugin 'Reewr/vim-monokai-phoenix'

call vundle#end()
filetype plugin indent on

" ============================================================================
" MOVING AROUND, SEARCHING AND PATTERNS 
" ============================================================================

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let delimitMate_matchpairs="(:),[:],{:}"

" ============================================================================
" TAGS
" ============================================================================


" ============================================================================
" DISPLAYING TEXT
" ============================================================================

set nu  " Line Numbering

" ============================================================================
" SYNTAX, HIGHLIGHTING, AND SPELLING
" ============================================================================
set autochdir
syntax on

set colorcolumn=131
au FileType gitcommit set textwidth=72
au FileType html set colorcolumn=0
au FileType css set colorcolumn=0
au FileType racket set textwidth=100
au FileType racket set colorcolumn=100
highlight BadWhiteSpace guibg=red guifg=white ctermbg=red ctermfg=white

" Flagging unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.java match BadWhiteSpace /\s\+$/

" Syntax Checking/Highlighting for Python
let python_highlight_all=1

" NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" ============================================================================
" MULTIPLE WINDOWS
" ============================================================================
set splitbelow
set splitright

" ============================================================================
" MULTIPLE TAB PAGES
" ============================================================================

" ============================================================================
" TERMINAL
" ============================================================================


" ============================================================================
" USING THE MOUSE
" ============================================================================


" ============================================================================
" GUI
" ============================================================================
colorscheme monokai-phoenix
set guifont=Dejavu\ Sans\ Mono\ 9
set guioptions -=T
set guioptions -=m

" ============================================================================
" PRINTING
" ============================================================================


" ============================================================================
" MESSAGES AND INFO
" ============================================================================


" ============================================================================
" SELECTING TEXT
" ============================================================================


" ============================================================================
" EDITING TEXT
" ============================================================================

" Remove whitespace when F2 is pressed
nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set textwidth=132
autocmd FileType html :set textwidth=120
autocmd FileType css :set textwidth=120

" ============================================================================
" TABS AND INDENTING
" ============================================================================
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ============================================================================
" FOLDING
" ============================================================================
set foldmethod=indent
set foldlevel=99
set expandtab
set autoindent

" Set space for folding
nnoremap <space> za

" Show docstrings for folded code
let g:SimpylFold_docstring_preview=1

" ============================================================================
" DIFF MODE
" ============================================================================


" ============================================================================
" MAPPING
" ============================================================================
" Running Python code in Vim
nnoremap <silent> <F5> :!clear;python %<CR>

" Compile Java code using Makefile
nnoremap <silent> <F9> :make <bar> :make run <CR>

" Run Java code in Vim
nnoremap <silent> <F10> :!java %:r <CR> 
nnoremap <F11> :Restart <CR>

" ============================================================================
" READING AND WRITING FILES
" ============================================================================
set fileformat=unix

" ============================================================================
" THE SWAP FILE
" ============================================================================


" ============================================================================
" COMMAND LINE EDITING
" ============================================================================


" ============================================================================
" EXECUTING EXTERNAL COMMANDS
" ============================================================================


" ============================================================================
" RUNNING MAKE AND JUMPING TO ERRORS
" ============================================================================


" ============================================================================
" LANGUAGE SPECIFIC
" ============================================================================

augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END

" ============================================================================
" MULTI-BYTE CHARACTERS
" ============================================================================
set encoding=utf-8

" ============================================================================
" VARIOUS
" ============================================================================
let mapleader=","

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_racket_racket_checker = 1
"Virtualenv support
"python with virtualenv support
py << EOF
import os
import sys

if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

" Vim-LaTeX compile to PDF
let g:Tex_DefaultTargetFormat='pdf'

let vim_markdown_preview_github=1
