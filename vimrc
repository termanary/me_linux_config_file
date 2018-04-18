" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------
"-------------------------------------------------------------------------

"thenext indicate is what define by me3 

"set ---------------------------------------------------------------------

set number
set relativenumber 
set numberwidth=6
set showcmd
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent
set ignorecase
set incsearch
set smartcase
set hlsearch
set wildmenu
set laststatus=2
"set shellcmdflag=-ci
set scrolloff=5
colorscheme zellner
let mapleader = "\<Space>"
"set revins
"set autowriteall
"set cindent
"set cursorline
"set mouse=a
"set lines=33 columns=95

"ab-----------------------------------------------------------------------

cab h vertical leftabove help

"inoremap-----------------------------------------------------------------

inoremap ' ''<left>
inoremap " ""<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {<CR>}<up><CR>
inoremap } {}<left>
inoremap <C-l> <ESC>
""inoremap . <ESC>
""inoremap ] .

inoremap <C-f> <right>
inoremap <C-e> <end>

"onoremap-----------------------------------------------------------------

"nnoremap------------------------------------------------------------------

"noremap------------------------------------------------------------------

noremap 0 ^
noremap ^ 0
noremap m `
noremap ' m
noremap ` '
noremap - :
noremap \ :!

noremap <F7> <ESC>:set insertmode! <CR>
"filetype ?"
noremap <F8> <ESC>:w <CR>:!gcc -Wall -g -o link main.c <CR>
noremap <F9> <ESC>:w <CR>:!g++ -Wall -g -o link main.cpp <CR>
noremap <F10> <ESC>:!./link <input.txt <CR>
noremap <F11> <ESC>:!gdb -tui link <CR>

"<Space> is the <Leader>
noremap <Space> <Nop>
noremap <Leader>4 $
noremap <Leader>o O
noremap <Leader>p P
noremap <Leader>g G
noremap <Leader>t :!date <CR>
noremap <Leader>w <C-w>
noremap <Leader>h <ESC>:noh <CR>
noremap <Leader>c @c
let @c = "gI//j"
noremap <Leader>d @d
let @d = "02xj"

"function-autocmd---------------------------------------------------------

function _ecc()
inoremap <C-n> <down>
inoremap <C-p> <up>
inoremap <C-f> <right>
inoremap <C-b> <left>
inoremap <C-e> <end>
inoremap <C-a> <home>
inoremap <C-d> <del>
"inoremap <C-u> <ESC>:h
"inoremap <C-w> <ESC>cb
inoremap <A-f> <ESC>wi
inoremap <A-b> <ESC>bi
endfunction

autocmd OptionSet insertmode : call _ecc()

