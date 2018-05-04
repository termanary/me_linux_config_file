"All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
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
set modeline
set history=200
set scrolloff=5
filetype indent on
colorscheme zellner
highlight cursorline cterm=NONE ctermbg=blue
highlight cursorcolumn cterm=NONE ctermbg=blue
let mapleader = "\<Space>"
"set autochdir
"set shellcmdflag=-ic
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

inoremap <C-f> <right>
inoremap <C-e> <end>

"noremap------------------------------------------------------------------

noremap 0 ^
noremap ^ 0
noremap m `
noremap ' m
noremap ` '
noremap - :
noremap \ :!

"noremap <F7> <ESC>:set insertmode! <CR>
noremap <F9> :call _compile_() <CR>
noremap <F10> :call _test_input_to_run() <CR>
noremap <F11> <ESC>:!gdb -tui %:h/_%:r <CR>

"<Space> is the <Leader>
noremap <Space> <Nop>
noremap <Leader>4 $
noremap <Leader>o O
noremap <Leader>p P
noremap <Leader>g G
noremap <Leader>f F
noremap <Leader>t :!date <CR>
noremap <Leader>w <C-w>
noremap <Leader>h <ESC>:noh <CR>
"sleep
noremap <Leader>e :set cursorline! cursorcolumn! <CR> :sleep 1500m <CR> :set cursorline! cursorcolumn! <CR>
noremap <Leader>c @c
noremap <Leader>d @d

"function----------------------------------------------------------

"the difference between "function x" and "function! x"
"when the vim-file is sourced ,"function x" will become 
"an error and the function will not be substitute ,but  
"the "function! x" not

function _compile_()
    "    if you want to get all the variable 
    "        see options.txt
    if &mod == 1
        write
    endif
    "set filetype=?
    "        help filename-modifiers
    "!cmd % --could handle currently file by shell command
    if &filetype == 'c'
        !gcc -Wall -g -o %:h/_%:t:r %:p
    elseif &filetype == 'cpp'
        !g++ -Wall -g -o %:h/_%:t:r %:p
    else
        let _the_first_line_string=getline(1)
        if _the_first_line_string[1] == "!" && _the_first_line_string[0] == "#" 
            ! %:p
        else 
            if &filetype == 'matlab'
                cd ~/matlab/
                !/media/syx/MATLAB/Matlab_2018a/bin/matlab -nodesktop -nosplash -r %:t:r quit
            elseif &filetype == 'python' 
                !python %:p
            elseif &filetype == 'sh'
                !bash %:p
            endif
        endif
    elseif &filetype == 'vim'
        source %:p
    else
        echomsg 'This is not a c/cpp/python/sh/matlab/vim file!'
    endif
endfunction

"help internal-variables to see l:
"if the variables definded out of a function,
"it's global ,if it is inside a function,
"it is function-local . outside the function
"could not use the variables in a function,
"in a function ,if you want to use the global
"varialbles ,you must add "g:" before a variables,
"the global-variable would not cover the function-local
"varialbles

function! _test_input_to_run()
if exists("g:_the_input_file_")
    let _the_input_file_=g:_the_input_file_
else
    let _the_input_file_="input.txt"
endif
"    findfile(),finddir()
if findfile(_the_input_file_) == _the_input_file_
"    help :!
    execute "! %:h/_%:t:r < " . _the_input_file_ . " "
elseif findfile(_the_input_file_) == ""
    ! %:h/_%:t:r
else 
    echomsg 'ERROR!'
endif
endfunction

function _filetype_set_register_()
    if &filetype == 'c' || &filetype == 'cpp'
        let @c="gI//j0" | let @d = "02xj0" 
    elseif &filetype == 'python' || &filetype == 'sh'
        let @c="gI#j0" | let @d = "0xj0"
    elseif &filetype == 'vim'
        let @c="gI\"\<BS>j0" | let @d = "0xj0"
    elseif &filetype == 'matlab'
        let @c="gI%j0" | let @d = "0xj0"
    endif
endfunction

function _my_own_key_map_insertmode_()
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

"autocmd----------------------------------------------------------------------

augroup _my_own_define_
"    autocmd!  -->clear the autocmd had been defined before 
"the current augroup before the current command 
    autocmd!
"autocmd OptionSet insertmode  call _my_own_key_map_insertmode_()
"updatetime->CursorHoldI
autocmd CursorHoldI * stopinsert
autocmd BufReadPost,WinEnter * call _filetype_set_register_()
augroup end

"readfile----------------------------------------------------------------------

"for the temanary command define by the users
"if you want to know all the function already 
"    difined by vim ,see usr_41.txt
if filereadable("$HOME/vimrc.tmp")
  source $HOME/vimrc.tmp
endif

