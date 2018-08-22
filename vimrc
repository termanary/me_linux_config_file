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
set shiftwidth=4
set softtabstop=4
set smarttab

set autoindent
set smartindent
filetype indent on

set ignorecase
set incsearch
set smartcase
set hlsearch

set updatetime&
set notimeout
set ttimeout

set showcmd
set wildmenu
set laststatus=1
"set statusline+=%{strftime(\"%T\")}

set runtimepath&
set modeline
set history=200
set scrolloff=5
set mouse-=a
set backspace=""
set clipboard+=unnamed
set undolevels+=1000

set cpoptions-=c
"set cpoptions+=q
set nrformats="bin,octal,hex,alpha"

"    see highlight for exmaple
"    the order of next 3 line could not be change
"colorscheme for ubuntu-18.04:zellner
colorscheme MyColo
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
cab s .,s/<left><left>
cab vr vertical rightbelow vsplit
"cab a AsyncRun
"cab as AsyncStop

"cnoremap-------------------------------------------------------------

"cnoremap <Esc>b <S-Left>
"cnoremap <Esc>f <S-Right>
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
noremap m `
noremap ' m
noremap ` '
noremap - :
noremap \ :!

noremap <F8> :source $HOME/Etc/vimrc.tmp <CR>
noremap <F9> :call _COMPILE_() <CR>
noremap <F10> :call _TEST_INPUT_TO_RUN_() <CR>

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
"noremap <Leader>r <C-r>

noremap <Leader>h :nohlsearch <CR>
noremap <Leader>u g~aw
noremap <Leader>e :setlocal cursorline! cursorcolumn! <CR> :sleep 400m
            \ <CR> :setlocal cursorline! cursorcolumn! <CR>

"comment
noremap <Leader>c @c
noremap <Leader>d @d

"buffer
noremap <Leader>bn :n <CR>
noremap <Leader>bp :N <CR>

"quickfix
noremap <Leader>qo :copen <CR>
noremap <Leader>qc :cclose <CR>
"noremap <leader>a :AsyncRun 
"noremap <leader>s :AsyncStop 

"file edit----------------------------------------------------------

"How to use one line for 'if' in cmdline : au , map : |
"autocmd CursorHold * if 1==1 | echomsg '0' | endif
"noremap <leader>a :if 1 == 1 \| echom '0' \| endif <CR>

"OJ
noremap <leader>vm :call _OPENFILE_("main.c","l") <CR>
noremap <leader>vi :call _OPENFILE_("input.tst","r") <CR>
noremap <leader>vg :call _OPENFILE_("~/.gdbinit","r") <CR>

"copy to save -> OJ
noremap <leader>vh :!cp %:p ~/hdoj/all/
noremap <leader>vk :!cp %:p ~/poj/all/
noremap <leader>va :!cp %:p /tmp/main.c <CR>

"script
noremap <leader>vs :call _OPENFILE_("~/script/shell.sh","l") <CR>
noremap <leader>vp :call _OPENFILE_("~/script/python.py","l") <CR>

"vimrc
noremap <leader>ve :call _OPENFILE_("~/.vim/vimrc","l") <CR>
noremap <leader>vt :call _OPENFILE_("$HOME/Etc/vimrc.tmp","l") <CR>
noremap <leader>vu :call _OPENFILE_("%:h/vimrc.tmp","l") <CR>

"octave
noremap <leader>vo :call _OPENFILE_("~/script/octave.m ","l") <CR>
noremap <leader>vn :call _OPENFILE_("~/script/input","l") <CR>
noremap <leader>vc :call _OPENFILE_("~/.octaverc","l") <CR>

"tnoremap----------------------------------------------------------

"tnoremap <C-W>n <C-W>N
"tnoremap <C-W>N <C-W>n
"tnoremap <ESC> <C-w>p

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
endif

"help function
function _OPENFILE_(filename,lr)
    if @# == ''
        execute 'edit ' . a:filename
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
        "-std=c89 -std=c99 -std-gnu89 -pedantic -ansi
        "let _gcc_compile_options="-Wunreachable-code -Winline
        "\ -Wstrict-prototypes -Wmissing-prototypes
        "\ -Wshadow -Wtraditional -Waggregate-return
        "\ -Wredundant-decls"
        let _gcc_compile_options=" -Wunreachable-code -Winline
                    \ -Wshadow -Wredundant-decls -Waggregate-return "
        if exists("g:_the_c_compile_options")
            if g:_the_c_compile_options == "HDOJ"
                let _gcc_compile_options = _gcc_compile_options . " -std=c89 "
            endif
        endif
        "gcc-4.8
        execute "!gcc -Wall -Wextra -g -W -pipe " .
                    \ _gcc_compile_options . " -o %:h/_%:t:r %:p -lm"
    elseif &filetype == 'cpp'
        let _gpp_compile_options=" -Wunreachable-code -Winline
                    \ -Wshadow -Wredundant-decls -Waggregate-return "
        if exists("g:_the_cpp_compile_options")
            if g:_the_cpp_compile_options == "HDOJ"
                "let _gpp_compile_options = _gpp_compile_options . " -std=c89 "
                echomsg "HDOJ-C++"
            endif
        endif
        execute "!g++ -Wall -Wextra -g -W -pipe " .
                    \ _gpp_compile_options . " -o %:h/_%:t:r %:p -lm"
"elseif &filetype == 'java'
    elseif &filetype == 'sh'
        "help function-list
        "help file-functions
        if executable(expand("%:p"))
            ! %:p
        else
            !bash %:p
        endif
    elseif &filetype == 'matlab'
        if executable(expand("%:p"))
            ! %:p
        else
            !octave-cli %:p
        endif
    elseif &filetype == 'vim'
        source %:p
    elseif &filetype == 'python'
        if executable(expand("%:p"))
            ! %:p
        else
            !python %:p
        endif
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
    if &filetype == 'c' || &filetype == 'cpp'
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
        if expand("%:h") != "."
            let _result_=expand("%:h") . "/" . _the_input_file_
        else
            let _result_=_the_input_file_
        endif
        if findfile(_the_input_file_,expand("%:h"))
                    \ == _result_
            "help :!
            execute "! %:h/_%:t:r < %:h/" . _the_input_file_
            "\ . " 2>&1 \| tee /tmp/tmpoutput.%:t:r "
        elseif findfile(_the_input_file_) == ""
            ! %:h/_%:t:r 2>&1
        else
            "echoerr
            echomsg 'ERROR!'
        endif
"elseif &filetype == 'java'
    endif
endfunction

function _FILETYPE_SET_REGISTER_()
"if filereadable(expand("%:h") . "/vimrc.tmp")
    "source %:h/vimrc.tmp
"endif
    if     &filetype == 'c' || &filetype == 'cpp'
        let @c="8<hI//j0" | let @d = "02x==j0"
        syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
        syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
        highlight cFunctions gui=NONE cterm=bold  ctermfg=yellow
"elseif &filetype == 'java'
    elseif &filetype == 'matlab'
        "highlight MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL ctermbg=red
        "match MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL /;\+$/
        highlight MATLAB_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        match MATLAB_MY_OWN_DEFINE_NOTE /^%%.*$/
        let @c="8<hI%j0"  | let @d = "0x==j0"
        let @o="A;j" | let @t="$xj"
        let @m=expand("%:t:r")
        noremap <buffer> <leader>m :w <CR><C-w>l<C-W>"m<CR><C-w>p
        noremap <buffer> <leader>; @o
        noremap <buffer> <leader>, @t
    elseif &filetype == 'python' || &filetype == 'sh' || &filetype == 'gdb'
                \ || &filetype == 'conf'
        let @c="8<hI#j0"  | let @d = "0x==j0"
    elseif &filetype == ''
        if expand("%:t:r") == 'input' || expand("%:t") == 'input.tst'
            set iskeyword+=.,-
        endif
    elseif &filetype == 'vim'
        let @c="8<hI\"xj0" | let @d = "0x==j0"
        "help cterm-colors
        highlight VIM_MY_OWN_DEFINE_SPACE_EOL ctermbg=red
        match VIM_MY_OWN_DEFINE_SPACE_EOL /\s\+$/
        "elseif &filetype == 'make'
        "setlocal list listchars=tab:>-,trail:@
    else
        let @c="8<hI#j0"  | let @d = "0x==j0"
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
    au BufReadPost * exe "normal! g`\""
"au BufReadPost * if line("'\"") != 1 || line("'\"") != 1 | exe "normal! g`\"" | endif
    "autocmd CursorHold * redraw
augroup end

""##### auto fcitx  ###########
"let g:input_toggle = 1
"function! Fcitx2en()
"let s:input_status = system("fcitx-remote")
"if s:input_status == 2
  "let g:input_toggle = 1
  "let l:a = system("fcitx-remote -c")
"endif
"endfunction
"
"function! Fcitx2zh()
"let s:input_status = system("fcitx-remote")
"if s:input_status != 2 && g:input_toggle == 1
  "let l:a = system("fcitx-remote -o")
  "let g:input_toggle = 0
"endif
"endfunction
"
"set ttimeoutlen=150
""退出插入模式
"autocmd InsertLeave * call Fcitx2en()
""进入插入模式
"autocmd InsertEnter * call Fcitx2zh()
""##### auto fcitx end ######

