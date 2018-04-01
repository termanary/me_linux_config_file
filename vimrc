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


"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------

"thenext indicate is what define by me3 

"set -----------------------------------------------------------------------------------------------

set number
set relativenumber 
set showcmd
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent
set smartcase
set incsearch
set hlsearch
set scrolloff=5
colorscheme zellner
let mapleader = "\<Space>"
"set autowriteall
"set cindent
"set cursorline
"set mouse=a
"set lines=33 columns=95

"inoremap-------------------------------------------------------------------------------------------

inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap [ []<ESC>i
inoremap ( ()<ESC>i
inoremap { {<CR>;<CR>}<ESC>kS
inoremap } {}<ESC>i
inoremap . <ESC>
inoremap ] .

"the next key-bind is like emacs in insert mode "

inoremap <C-e> <end>
inoremap <C-f> <right>

"noremap--------------------------------------------------------------------------------------------

"w b e
"t f
"0 ^
"<Space> is the <Leader>
nnoremap <Leader>6 ^
nnoremap <Leader>4 $
nnoremap <Leader>o O
nnoremap <Leader>p P
nnoremap <Leader>g G
nnoremap ZZ <Esc>:xa <CR>
nnoremap ZQ <Esc>:qa! <CR>
nnoremap m `
nnoremap ' m
nnoremap ` '
nnoremap - <Esc>:
nnoremap \ <Esc>:!

nnoremap <Space> <Nop>
nnoremap <F6> <ESC>:set noinsertmode <CR>
nnoremap <F7> <ESC>:set insertmode <CR>
nnoremap <F8> <ESC>:w <CR>:!gcc -Wall -g -o link main.c <CR>
nnoremap <F9> <ESC>:w <CR>:!g++ -Wall -g -o link main.cpp <CR>
nnoremap <F10> <ESC>:!./link <input.txt <CR>
nnoremap <F11> <ESC>:!gdb -tui --command=~/.gdb link <CR>
nnoremap <F12> <ESC>:colorscheme desert <CR>

