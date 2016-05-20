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
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tyru/restart.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'Raimondi/delimitMate'

" Colour Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mkarmona/colorsbox'
Plugin 'morhetz/gruvbox'
Plugin 'freeo/vim-kalisi'
Plugin 'tomasr/molokai'


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

set colorcolumn=79
au FileType gitcommit set textwidth=72
highlight BadWhiteSpace guibg=red guifg=white ctermbg=red ctermfg=white

" Flagging unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.java match BadWhiteSpace /\s\+$/

" Syntax Checking/Highlighting for Python
let python_highlight_all=1

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
if has('gui_running')
    set background=dark
    colorscheme molokai
    set guifont=DejaVu\ Sans\ Mono\ 9
else
    colorscheme zenburn
endif

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

set textwidth=79

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


" ============================================================================
" MULTI-BYTE CHARACTERS
" ============================================================================
set encoding=utf-8

" ============================================================================
" VARIOUS
" ============================================================================
let mapleader=","

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
