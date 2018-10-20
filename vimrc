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


if has('terminal')==0 || has('python3_compiled')==0 || has('python_compiled')==0
    " help if_pyth.txt
    echomsg 'Need to recompile!'
    if has('python3_dynamic')==0 || has('python_dynamic')==0
        echomsg 'Could not dynamic load!'
    endif
    " or you could choose to install vim-nox or vim-gtk,
    " it support all scripting and features.
    " python's dll name must be find,if could not,delete cache,run again with no config_dir
    " dependence : ncurses->libncurses5-dev libpython-dev libpython3-dev
    " libperl-dev clipboard->libxt-dev
    " wget https://github.com/vim/vim/archive/master.zip
    " rm ./vim-master/src/auto/config.cache
    " ./configure -enable-python3interp=dynamic -enable-pythoninterp=dynamic
    " -enable-perlinterp=dynamic -with-compiledby=termanary
    " use only once if could not be found :
    " -with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/
    " -with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
    " -x-includes=/usr/include/X11
    " -x-libraries=/usr/include/X11
endif

"source file----------------------------------------------------------

"for the temanary command define by the users
"if you want to know all the function already
"difined by vim ,see usr_41.txt
"the next code could run successfully

"~ could not be recognize
"$HOME must out of ""
"if filereadable($HOME . "/Etc" . "/defaults.vim")
if filereadable("/usr/share/vim/vim80/defaults.vim")
    "source $HOME/Etc/defaults.vim
    source /usr/share/vim/vim80/defaults.vim
endif

if filereadable("/usr/share/vim/vim80/ftplugin.vim")
    "source $HOME/Etc/ftplugin.vim
    source /usr/share/vim/vim80/ftplugin.vim
endif

"set ---------------------------------------------------------------------

set number
set relativenumber
set numberwidth=3

set tabstop=4
set expandtab
set softtabstop=4
set smarttab
set shiftwidth=4
set nojoinspaces

set autoindent
set smartindent
filetype indent plugin on
set foldmethod=manual
" set commentstring&

set ignorecase
set incsearch
set smartcase
set hlsearch

set updatetime&
set notimeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0

set showcmd
set ruler
"set rulerformat
set laststatus=1
"set statusline+=%{strftime(\"%T\")}
set wildmenu
set wildmode&

set modeline
set modelines=3

set nosplitbelow
set nosplitright

set pyxversion&
set runtimepath&
set history=200
set scrolloff=5
set mouse-=a
set backspace=""
" \"* is select(copy or cut is unnecessary) and \"+ is copy or cut
" use \"+ to communicate with system
set clipboard=unnamedplus
set undolevels+=1000

set cpoptions-=c
"set cpoptions+=q
set nrformats="bin,octal,hex,alpha"

"    see highlight for exmaple
"    the order of next 3 line could not be change
"colorscheme for ubuntu-18.04:zellner
if $USER == 'me'
    colorscheme MyColo
elseif $USER == 'syx'
    colorscheme MyColo
else
    echomsg "Please set your colorscheme!"
endif
highlight cursorline cterm=NONE ctermbg=blue
highlight cursorcolumn cterm=NONE ctermbg=blue

"set autochdir
"set shellcmdflag=-ic
"set revins
"set autowriteall
"set cindent
"set cursorline
"set lines=33 columns=95

"cab-------------------------------------------------------------------

cab h vertical leftabove help
cab t vertical rightbelow terminal ++rows=48 ++cols=70
cab matlab vertical rightbelow terminal ++rows=48 ++cols=70 matlab
            \ -nodesktop -nosplash
cab em echomsg
cab vr vertical rightbelow vsplit
"cab a AsyncRun
"cab as AsyncStop

"cnoremap-------------------------------------------------------------

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

"inoremap-------------------------------------------------------------

inoremap ' ''<left>
inoremap " ""<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {<CR>}<up><CR>
inoremap } {}<left>

inoremap <C-f> <right>
inoremap <C-e> <end>

"noremap--------------------------------------------------------------

"help getcharsearch()  <expr> map-argument
"map could have argument
noremap <expr> ; getcharsearch().forward ? ';' : ','
noremap <expr> , getcharsearch().forward ? ',' : ';'
"help internal-variables
noremap <expr> n v:searchforward ? 'n' : 'N'
noremap <expr> N v:searchforward ? 'N' : 'n'

noremap 0 ^
noremap ^ 0
noremap [ {
noremap ] }
noremap m `
noremap ' m
noremap ` '
noremap - :
noremap \ :!

noremap <F8> :source ~/script/vimscript.vim <CR>
noremap <F9> :call _COMPILE_() <CR>
noremap <F10> :call _TEST_INPUT_TO_RUN_() <CR>
noremap <F11> :call _DEBUG_() <CR>
" noremap <F11> :!emacs --eval "(gdb \"gdb -i=mi %:h/_%:t:r \")" <CR>
"emacs --eval "(pdb \"pdb %:p \")" <CR>

"help key-codes
let mapleader = "\<Space>"
noremap <Space> <Nop>
noremap <Leader>4 $
noremap <Leader>o O
noremap <Leader>p P
noremap <Leader>g G
noremap <Leader>f F
noremap <Leader>t T
noremap <Leader>w <C-w>
noremap <Leader>h <C-w>h
noremap <Leader>l <C-w>l
noremap <Leader>j <C-w>j
noremap <Leader>k <C-w>k
noremap <Leader>q <C-w>q
"noremap <Leader>r <C-r>

noremap m/ /\v
noremap <Leader>/ :nohlsearch <CR>
noremap <Leader>u g~aw
noremap <Leader>e :setlocal cursorline! cursorcolumn!<CR>:sleep 400m
            \<CR>:setlocal cursorline! cursorcolumn!<CR>

"buffer
noremap <Leader>bn :n <CR>
noremap <Leader>bp :N <CR>

"quickfix
" noremap <Leader>qo :copen <CR>
" noremap <Leader>qc :cclose <CR>
"noremap <Leader>a :AsyncRun 
"noremap <Leader>s :AsyncStop 

"file edit----------------------------------------------------------

"How to use one line for 'if' in cmdline : au , map : |
"autocmd CursorHold * if 1==1 | echomsg '0' | endif
"noremap <leader>a :if 1 == 1 \| echom '0' \| endif <CR>

"OJ
noremap <Leader>vm :call _OPENFILE_("main.c*","l") <CR>
noremap <Leader>vi :call _OPENFILE_("input.tst","r") <CR>
noremap <Leader>vg :call _OPENFILE_("~/.gdbinit","r") <CR>

"copy to save -> OJ
noremap <Leader>vh :!cp %:p ~/hdoj/all/
noremap <Leader>vk :!cp %:p ~/poj/all/
noremap <Leader>va :!cp %:p /media/Program/main.c <CR>

"script
noremap <Leader>vs :call _OPENFILE_("~/script/shell.sh","l") <CR>
noremap <Leader>vp :call _OPENFILE_("~/script/python3.py","l") <CR>
noremap <Leader>vy :call _OPENFILE_("~/.pythonstartup","l") <CR>
noremap <Leader>vb :call _OPENFILE_("~/.bash_aliases","r") <CR>

"vimrc
noremap <Leader>ve :call _OPENFILE_("~/.vim/vimrc","l") <CR>
noremap <Leader>vt :call _OPENFILE_("~/script/vimscript.vim","l") <CR>
noremap <Leader>vu :call _OPENFILE_("%:h/vimrc.tmp","l") <CR>

"octave
noremap <Leader>vo :call _OPENFILE_("~/script/octave.m ","l") <CR>
noremap <Leader>vn :call _OPENFILE_("~/script/input.tst","l") <CR>
noremap <Leader>vc :call _OPENFILE_("~/.octaverc","l") <CR>

"tnoremap----------------------------------------------------------

if has('terminal')==0
    echo "Don't support terminal!"
else
    tnoremap <C-W>n <C-W>N
    tnoremap <C-W>N <C-W>n
    tnoremap <ESC> <C-w>p
endif

"function----------------------------------------------------------

"the difference between "function x" and "function! x"
"when the vim-file is sourced ,"function x" will become
"an error and the function will not be substitute ,but
"the "function! x" not

if exists("_function_exists")
    "delfunction _COMPILE_
    delfunction _TEST_INPUT_TO_RUN_
    delfunction _FILETYPE_SET_REGISTER_
    delfunction _OPENFILE_
    delfunction _PYTHON_FUNCTION_
endif

function _PYTHON_FUNCTION_()
if has('python_compiled')==0 || has('python3_compiled')==0
    echomsg "Don't support python3/python!"
    " finish
    return
endif
if has('python3_dynamic')==0 || has('python_dynamic')==0
    echomsg "Could not dynamic load python3/python!"
    return
endif
" help if_pyth.txt
python3 << ENDPYTHON3
    print('python3')
    # import vim
    # vim.command("echom 'vim'")
    # import os
    files=[
    "main.c" ,
    "main.cpp" ,
    "Main.java" ,]
    print(files)
ENDPYTHON3
endfunction

"help function
function _OPENFILE_(filename,lr)
    " vim -
    if @% == ''
        if &mod == 1
            execute 'vsplit ' . a:filename
        else
            execute 'edit ' . a:filename
        endif
    else
        if a:lr=='l'
            execute 'vsplit ' . a:filename
        elseif a:lr=='r'
            execute 'vertical rightbelow vsplit ' . a:filename
        else
            echomsg 'ERROR'
        endif
    endif
endfunction

function _COMPILE_()
    "if you want to get all the variable :see options.txt
    if &mod == 1
        write
    endif
    "help filename-modifiers
    "set filetype=?
    "!cmd % --could handle currently file by shell command
    if &filetype == 'c'
        " ---------------------------------------------------
        " make makeprg
        " ---------------------------------------------------
        " options : standard : -std=c89
        " release compilation : -static
        " ---------------------------------------------------
        " 32-bit : gcc -m32
        " sudo apt install gcc-multilib g++-multilib
        " ---------------------------------------------------
        " windows : cygwin : simulation ; mingw-w64 : compilation ;
        " sudo apt install mingw-w64
        " x86_64-w64-mingw32-gcc ; i686-w64-mingw32-gcc
        " ---------------------------------------------------
        let _gcc_compile_options=" -Wfloat-equal -Wshadow -Wstrict-prototypes "
        execute "!gcc -Wall -Wextra -Wfatal-errors -g3 -pipe -Dtermanary=0 " .
                    \ _gcc_compile_options . " -o %:h/_%:t:r %:p -lm "
    elseif &filetype == 'cpp'
        " octave-C++ :
        " sudo apt install liboctave-dev
        " mkoctfile helloworld.cpp
        " octave-cli --eval 'helloworld(*)'
        let _gpp_compile_options=" -Wfloat-equal -Wshadow "
        execute "!g++ -Wall -Wextra -Wfatal-errors -g3 -pipe -Dtermanary=0 " .
                    \ _gpp_compile_options . " -o %:h/_%:t:r %:p "
    elseif &filetype == 'python'
        if executable(expand("%:p"))
            ! %:p
        else
            " pypy
            !python3 %:p
        endif
    elseif &filetype == 'matlab'
        " sudo apt install liboctave-dev
        " !mkoctfile %:p
        " !octave-cli --eval '%:t:r (*)'
        if executable(expand("%:p"))
            ! %:p
        else
            !octave-cli --no-init-file %:p
        endif
    elseif &filetype == 'sh'
        "help function-list
        "help file-functions
        "help :bar
        " zsh
        if executable(expand("%:p"))
            ! %:p
        else
            !bash %:p
        endif
    elseif &filetype == 'vim'
        source %:p
    elseif &filetype == 'java'
        " gnu-gcc:gcj/gij :was removed after gcc-7,was available before gcc-6
        !javac -g -d %:h/class/ %:p
    elseif &filetype == 'verilog'
        " sudo apt install iverilog gtkwave verilator
        !iverilog -o %:h/_%:t:r %:p
    elseif &filetype == 'asm'
        " only do this could gcc compile assemble to 32-bit : gcc -m32
        " sudo apt install gcc-multilib g++-multilib
        " intel : sudo apt install nasm
        " AT&T : sudo apt install as
        !nasm -f elf %:p -o %:h/%:t:r.o
        !gcc -m32 %:h/%:t:r.o -o %:h/_%:t:r
    elseif &filetype == 'haskell'
        !ghc %:p -o %:h/_%:t:r
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

function _TEST_INPUT_TO_RUN_()
    "findfile(),finddir()
    "register '%' and '#'
    "copen
    if exists("g:_the_input_file_")
        let _the_input_file_=g:_the_input_file_
    else
        "can not have ; with 'let'
        let _the_input_file_="input.tst"
    endif
    "when you want to give a string variable to another ,
    "you need to use "let"
    "when you want to merge two string variable together ,
    "use operator "."
    " %:p:h is different from %:h , other like : %:r:r %:.
    "help filename-modifiers
    " let _result_=expand("%:p:h") . "/" . _the_input_file_
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'asm'
                \ || &filetype == 'haskell'
        if findfile(_the_input_file_,expand("%:h")) != ""
            "help :!
            execute "! %:h/_%:t:r < %:h/" . _the_input_file_
            "\ . " 2>&1 \| tee /tmp/tmpoutput.%:t:r "
        elseif findfile(_the_input_file_,expand("%:h")) == ""
            ! %:h/_%:t:r 2>&1
        else
            "echoerr
            echomsg 'ERROR!'
        endif
    elseif &filetype == 'java'
        if findfile(_the_input_file_,expand("%:h/class")) != ""
            execute "!java -classpath %:h/class/ %:t:r < %:h/" . _the_input_file_
        elseif findfile(_the_input_file_,expand("%:h/class")) == ""
            !java -classpath %:h/class/ %:t:r 2>&1
        else
            echomsg 'ERROR!'
        endif
    endif
endfunction

function _DEBUG_()
    if &filetype == 'c' || &filetype == 'cpp'
        !emacs --eval "(gdb \"gdb -i=mi %:h/_%:t:r \")"
    elseif &filetype == 'python'
        !pudb %:p
    elseif &filetype == 'java'
        !jdb -classpath %:h/class %:t:r
    endif
endfunction

function _FILETYPE_SET_REGISTER_()
    "if filereadable(expand("%:h") . "/vimrc.tmp")
    "source %:h/vimrc.tmp
    "endif
    mapclear <buffer>
    if     &filetype == 'c' || &filetype == 'cpp'
        syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
        syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
        highlight cFunctions gui=NONE cterm=bold  ctermfg=yellow
    elseif &filetype == 'matlab'
        "highlight MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL ctermbg=red
        "match MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL /;\+$/
        inoremap <buffer> ' '
        highlight MATLAB_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        match MATLAB_MY_OWN_DEFINE_NOTE /^% %.*$/
        let @m=expand("%:t:r")
        noremap <buffer> <Leader>m :w <CR><C-w>l<C-W>"m<CR><C-w>p
        noremap <buffer> <Leader>; :s/$/;/<CR>:nohlsearch<CR>g;
        noremap <buffer> <Leader>, :s/;$//<CR>:nohlsearch<CR>g;
    elseif &filetype == 'python' || &filetype == 'sh' || &filetype == 'gdb' || &filetype == 'conf'
        highlight PYTHON_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        match PYTHON_MY_OWN_DEFINE_NOTE /^# #.*$/
    elseif &filetype == ''
        if expand("%:t:r") == 'input' || expand("%:t") == 'input.tst'
            set iskeyword+=.,-
        endif
    elseif &filetype == 'vim'
        "help cterm-colors
        highlight VIM_MY_OWN_DEFINE_SPACE_EOL ctermbg=red
        match VIM_MY_OWN_DEFINE_SPACE_EOL /\s\+$/
        "elseif &filetype == 'make'
        "setlocal list listchars=tab:>-,trail:@
    elseif &filetype == 'verilog'
        inoremap <buffer> ' '
    endif
endfunction

let _function_exists=0
"autocmd--------------------------------------------------------------

augroup _MY_OWN_DEFINE_
    "autocmd!  -->clear the autocmd had been defined before
    "the current augroup before the current command
    autocmd!
    "autocmd OptionSet insertmode  call _MY_OWN_KEY_MAP_INSERTMODE_()
    "updatetime->CursorHoldI
    autocmd BufEnter * call _FILETYPE_SET_REGISTER_()
    autocmd CursorHoldI * stopinsert
    autocmd BufReadPost * if line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " autocmd BufWritePost * if $USER == 'me' | mkview | endif
    " autocmd BufReadPost * if @% != '' && $USER == 'me' | loadview | endif
    "autocmd CursorHold * redraw
augroup end

"color:
"Black White
"DarkRed Red
"DarkYellow Yellow
"DarkGreen Green
"DarkBlue Blue
"DarkCyan Cyan
"DarkMagenta Magenta
"DarkGrey Grey

" Status line
" https://groups.google.com/forum/#!topic/vim_use/wPnsi-40FhE
"set laststatus=2
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4c\ %*             "column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

" Concat the active statusline
" ------------------------------------------=--------------------=------------
"               Gibberish                   | What da heck?      | Example
" ------------------------------------------+--------------------+------------
"set statusline=                            "| Clear status line  |
"set statusline+=\ %7*%{&paste?'=':''}%*    "| Paste symbol       | =
"set statusline+=%4*%{&ro?'':'#'}%*         "| Modifiable symbol  | #
"set statusline+=%6*%{TlMode()}             "| Readonly symbol    | 
"set statusline+=%*%n                       "| Buffer number      | 3
"set statusline+=%6*%{TlModified()}%0*      "| Write symbol       | +
"set statusline+=\ %1*%{TlSuperName()}%*    "| Relative supername | cor/app.js
"set statusline+=\ %<                       "| Truncate here      |
"set statusline+=%(\ %{TlBranchName()}\ %) "| Git branch name    |  master
"set statusline+=%4*%(%{TlWhitespace()}\ %) "| Space and indent   | trail34
"set statusline+=%(%{TlSyntax()}\ %)%*      "| syntax error/warn  | E:1W:1
"set statusline+=%=                         "| Align to right     |
"set statusline+=%{TlFormat()}\ %4*%*      "| File format        | unix 
"set statusline+=%(\ %{&fenc}\ %)           "| File encoding      | utf-8
"set statusline+=%4*%*%(\ %{&ft}\ %)       "| File type          |  python
"set statusline+=%3*%2*\ %l/%2c%4p%%\ %*   "| Line and column    | 69:77/ 90%
" ------------------------------------------'--------------------'---------

"nerdcommenter:
"ca mode
"cA insert end of line
"c$ comment to end
"cs block
"cm
"c<space> toggle
" cc line

noremap <Leader>d :call NERDComment("n","Toggle") <CR>
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_python = 1

