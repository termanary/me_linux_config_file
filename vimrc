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
" set compatible

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
" if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
" if has("autocmd")
"  filetype plugin indent on
" endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
" set showcmd		" Show (partial) command in status line.
" set showmatch		" Show matching brackets.
" set ignorecase		" Do case insensitive matching
" set smartcase		" Do smart case matching
" set incsearch		" Incremental search
" set autowrite		" Automatically save before commands like :next and :make
" set hidden		" Hide buffers when they are abandoned
" set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

if !has('terminal') || !has('python3_compiled')
    " help if_pyth.txt
    echomsg 'Need to recompile!'
    if !has('python3_dynamic')
        echomsg 'Could not dynamic load!'
    endif
    " or you could choose to install vim-nox or vim-gtk,
    " it support all scripting and features.
    " python's dll name must be find,if could not,delete cache,run again
    " with no config_dir. dependence :
    " ncurses->libncurses5-dev libpython3-dev clipboard->libxt-dev
    " wget https://github.com/vim/vim/archive/master.zip
    " rm ./vim-master/src/auto/config.cache
    " ./configure -enable-python3interp=dynamic -enable-pythoninterp=dynamic
    " use only once if could not be found :
    " -with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/
    " -with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
    " -x-includes=/usr/include/X11
    " -x-libraries=/usr/include/X11
endif

" source file----------------------------------------------------------

" for the temanary command define by the users
" if you want to know all the function already
" difined by vim ,see usr_41.txt
" the next code could run successfully

" ~ could not be recognize
" $HOME must out of ""
" if filereadable($HOME . "/Etc" . "/defaults.vim")
if filereadable("/usr/share/vim/vim80/defaults.vim")
    " source $HOME/Etc/defaults.vim
    source /usr/share/vim/vim80/defaults.vim
endif

if filereadable("/usr/share/vim/vim80/ftplugin.vim")
    " source $HOME/Etc/ftplugin.vim
    source /usr/share/vim/vim80/ftplugin.vim
endif

" set ---------------------------------------------------------------------

set nocompatible

" number
set number
set relativenumber
set numberwidth=3

" tab
set tabstop=4
set expandtab
set softtabstop=4
set smarttab
set shiftwidth=4
set nojoinspaces
" set list
" set listchars=tab:>-

" indent
set autoindent
set smartindent
" see $VIMRUNTIME/scripts.vim $VIMRUNTIME/filetype.vim
filetype indent plugin on
set foldmethod=manual
" help cinoptions-value
set cinoptions=(1s
" help ft-python-indent
let g:pyindent_open_paren = '&sw'
let g:pyindent_continue = '&sw * 2'
" let g:pyindent_nested_paren = '&sw * 2'

" search
set ignorecase
set incsearch
set smartcase
set hlsearch

" map waiting
set notimeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0

" statusline
set showcmd
set ruler
" set rulerformat
set laststatus=1
" set statusline+=%{strftime(\"%T\")}

" wild menu
" help wildcard
set wildmenu
set wildmode=full
set wildignore+=*.o,*.hi,*.class
" set suffixes&

" tab-page
set tabpagemax=4

" modeline
set modeline
set modelines=3

" split
set nosplitbelow
set nosplitright
set noconfirm

" vimrc in curent dir
set noexrc
set nosecure

" python
" set pyxversion&
" set pythondll&
" set pythonhome&
" set pythonthreedll&
" set pythonthreehome&

" set runtimepath&
set history=200
set scrolloff=5
set mouse-=a
set backspace=start
" \"* is select(copy or cut is unnecessary) and \"+ is copy or cut
" use \"+ to communicate with system
set clipboard=unnamedplus
set undolevels+=1000
" set path

" set termwinkey=

set cpoptions-=c
" set cpoptions+=q
" : bin,octal,hex,alpha
set nrformats=bin,octal,hex

" set mousehide
" set mousemodel

" set spell
" set list

" see highlight for exmaple
" the order of next 3 line could not be change
" colorscheme for ubuntu-18.04:zellner
if $USER == 'me'
    colorscheme MyColo
elseif $USER == 'syx'
    colorscheme MyColo
endif
highlight cursorline cterm=NONE ctermbg=blue
highlight cursorcolumn cterm=NONE ctermbg=blue

" set autochdir
" set shellcmdflag=-ic
" set revins
" set autowriteall
" set cindent
" set cursorline
" set lines=33 columns=95

" cab-------------------------------------------------------------------

" help vert windo bufdo
cab h vertical leftabove help
cab t vertical rightbelow terminal ++rows=48 ++cols=70
cab oct octave-cli \| sed 's/ans =//' \| sed 's/^\s\+//g' \| sed 's/\s\+/ /g'
            \ \| sed '/Columns/d' \| sed '/^\s*$/d'
cab mat vertical rightbelow terminal ++rows=48 ++cols=70 matlab
            \ -nodesktop -nosplash

" cnoremap-------------------------------------------------------------

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" inoremap-------------------------------------------------------------

inoremap ' ''<left>
inoremap " ""<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>

" inoremap <C-b> <left>
inoremap <C-f> <right>
inoremap <C-e> <end>
" inoremap <C-d> <delete>
" inoremap <C-g> <C-d>
inoremap <delete> <Nop>

" noremap--------------------------------------------------------------

noremap <F9> :call _COMPILE_() <CR>
noremap <F10> :call _TEST_INPUT_TO_RUN_() <CR>
noremap <F11> :call _DEBUG_() <CR>

" help getcharsearch()  <expr> map-argument
" map could have argument
noremap <expr> ; getcharsearch().forward ? ';' : ','
noremap <expr> , getcharsearch().forward ? ',' : ';'
" help internal-variables
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

noremap <Space> <Nop>
noremap <Del> <Nop>
noremap <insert> <Nop>

" help key-codes
let mapleader = "\<Space>"
noremap <Leader>4 $
noremap <Leader>o O
noremap <Leader>p P
noremap <Leader>g G
noremap <Leader>f F
noremap <Leader>t T
noremap <Leader>w <C-w>
noremap <Leader>h <C-w>h
noremap <Leader>l <C-w>l
noremap <Leader>q <C-w>q
" noremap <Leader>r <C-r>

noremap m/ /\v
noremap <Leader>/ :nohlsearch <CR>
noremap <Leader>u g~aw
noremap <Leader>e :setlocal cursorline! cursorcolumn!<CR>:sleep 400m
            \<CR>:setlocal cursorline! cursorcolumn!<CR>

" buffer
" buffer-list argument-list
noremap <Leader>bn :bn <CR>
noremap <Leader>bp :bN <CR>

" quickfix
" noremap <Leader>qo :copen <CR>
" noremap <Leader>qc :cclose <CR>

" file edit----------------------------------------------------------

" How to use one line for 'if' in cmdline : au , map : |
" autocmd CursorHold * if 1==1 | echomsg '0' | endif
" noremap <leader>a :if 1 == 1 \| echom '0' \| endif <CR>

" OJ
noremap <Leader>vm :call _OPENFILE_("","l") <CR>
noremap <Leader>vi :call _OPENFILE_("input.tst","r") <CR>
noremap <Leader>vg :call _OPENFILE_("~/.gdbinit","r") <CR>

" copy to save -> OJ
noremap <Leader>vh :!cp %:p ~/hdoj/all/
noremap <Leader>vk :!cp %:p ~/poj/all/
noremap <Leader>va :!cp %:p /media/program/main <CR>

" script
noremap <Leader>vs :call _OPENFILE_("~/script/shell.sh","l") <CR>
noremap <Leader>vp :call _OPENFILE_("~/script/python3.py","l") <CR>
noremap <Leader>vy :call _OPENFILE_("~/.pythonstartup","l") <CR>
noremap <Leader>vb :call SHELL_ALIASES() <CR>

" vimrc
noremap <Leader>ve :call _OPENFILE_("~/.vim/vimrc","l") <CR>
noremap <Leader>vt :call _OPENFILE_("~/script/vimscript.vim","l") <CR>
noremap <Leader>vu :call _OPENFILE_("%:h/vimrc.tmp","l") <CR>

" octave
noremap <Leader>vo :call _OPENFILE_("~/script/octave.m ","l") <CR>
noremap <Leader>vn :call _OPENFILE_("~/script/input.tst","l") <CR>
noremap <Leader>vc :call _OPENFILE_("~/.octaverc","l") <CR>

" tnoremap----------------------------------------------------------

if !has('terminal')
    echomsg "Don't support terminal!"
else
    tnoremap <C-W>n <C-W>N
    tnoremap <C-W>N <C-W>n
    tnoremap <ESC> <C-w>p
endif

" function----------------------------------------------------------

" the difference between "function x" and "function! x"
" when the vim-file is sourced ,"function x" will become
" an error and the function will not be substitute ,but
" the "function! x" not

if exists("s:_function_exists")
    delfunction _OPENFILE_
    delfunction _PYTHON_FUNCTION_
    delfunction SHELL_ALIASES
    delfunction VsplitFunction

    "delfunction _COMPILE_
    delfunction _TEST_INPUT_TO_RUN_
    delfunction _DEBUG_
    delfunction _FILETYPE_SET_REGISTER_

    delfunction PAIRS
    delfunction NORMAL
    delfunction BSD_STYLE

    delfunction  GlobalVariableReverse
endif

" diference between echo and echomsg :
" echo : all types , no messages
" echomsg : string type , messages

function _PYTHON_FUNCTION_()
    if !has('python3_compiled')
        echomsg "Don't support python3!"
        " finish
        return
    endif
    if !has('python3_dynamic')
        echomsg "Could not dynamic load python3!"
        return
    endif
" help if_pyth.txt
" py3eval()
python3 << ENDPYTHON3

import os
import vim

FileName = [
"main.c",
"main.cpp",
"Main.java",
]
FileFormat = [
".c",
".cpp",
".java",
".h",
".py",
".m",
".sh",
".vim",
".v",
".pl",
".hs",
".asm",
]
FileAdd = [
".c",
".cpp",
]

CurDirList = os.listdir(".")
CurDirList.sort()
CurDirList.reverse()
for fn in FileName :
    # OJ,task,project
    if fn in CurDirList and os.path.isfile(fn) :
        if vim.eval("@%") != "" or vim.eval("&mod") == "1" :
            RetStatus = vim.command("vsplit " + fn)
        else :
            RetStatus = vim.command("edit " + fn)
        break
# if "RetStatus" in locals() or "RetStatus" in globals() :
if "RetStatus" in globals() :
    # pass
    for ld in CurDirList :
        for ff in FileAdd :
            if os.path.isfile(ld) and os.path.splitext(ld)[-1] == ff :
                # RetStatus = vim.command("argadd " + ld)
                RetStatus = vim.command("badd " + ld)
                break
else :
    # other,script
    FileNumber = int(vim.eval("len(tabpagebuflist())"))
    WinCount = 4
    for ld in CurDirList :
        for ff in FileFormat :
            if os.path.isfile(ld) and os.path.splitext(ld)[-1] == ff :
                if FileNumber == 1 :
                    if vim.eval("@%") != "" or vim.eval("&mod") == "1" :
                        RetStatus = vim.command("vsplit " + ld)
                    else :
                        RetStatus = vim.command("edit " + ld)
                        break
                elif FileNumber < WinCount :
                    RetStatus = vim.command("vsplit " + ld)
                else :
                    # RetStatus = vim.command("argadd " + ld)
                    RetStatus = vim.command("badd " + ld)
                FileNumber += 1
                break
    if "RetStatus" in globals() :
        pass
    else :
        print("File Not Found!")

ENDPYTHON3
endfunction

" Global variables : -------------------------------------------------------

" if a global variable do not define as this ,
" it will not be aoto-complete in cmd-line
" help List
let g:JavaNewVersion = 1
let g:gtkwave_ban = 0
noremap <F8> :call GlobalVariableReverse() <CR>
function GlobalVariableReverse()
    if &filetype == 'java'
        let g:JavaNewVersion = !g:JavaNewVersion
    elseif &filetype == 'verilog'
        let g:gtkwave_ban = !g:gtkwave_ban
    endif
endfunction

" ----------------------------------------------------------------------

function SHELL_ALIASES()
    if $USER == "me"
        call _OPENFILE_("~/.zsh_aliases","l")
    elseif $USER == "syx"
        call _OPENFILE_("~/.bash_aliases","l")
    endif
endfunction

" help function
" help function-list
function _OPENFILE_(filename,lr)
    " vim -
    " :vsplit : for f in [ 'files','files' ] | exe 'vsplit ' f | endfor
    " help :for
    " help :bar
    if a:filename == ""
        call _PYTHON_FUNCTION_()

        " " $PWD , . = %:h
        " for fn in g:FileName
        "     " help cmdline file-searching
        "     " &path &cdpath
        "     " finddir() findfile() glob() globpath() split()
        "     " find
        "     if findfile(fn,$PWD) != ""
        "         if &mod || @% != ""
        "             execute "vsplit " . fn
        "         else
        "             execute "edit " .fn
        "         endif
        "         let FindFileSucess = 0
        "         break
        "     endif
        " endfor

        " if !exists("FindFileSucess")
        "     let FileNumber = 0
        "     for ff in g:FileFormat
        "         let GetFiles = glob(ff)
        "         if GetFiles != ""
        "             let GetFiles = split(GetFiles,"\n")
        "             for gf in GetFiles
        "                 if !isdirectory(gf)
        "                     let FileNumber += 1
        "                     if FileNumber == 1
        "                         if &mod || @% != ""
        "                             execute "vsplit " . gf
        "                             let FileNumber += 1
        "                         else
        "                             execute "edit " . gf
        "                         endif
        "                     elseif FileNumber <= 4
        "                         execute "vsplit " . gf
        "                     else
        "                         execute "argadd " . gf
        "                     endif
        "                 endif
        "             endfor
        "         endif
        "     endfor
        " endif

    else
        " help argadd
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
                echomsg 'ERROR!'
            endif
        endif
    endif
endfunction

" help v:
if !exists("g:_the_input_file_")
    " can not have ; with 'let'
    let g:_the_input_file_="input.tst"
endif

function _COMPILE_()
    " if you want to get all the variable :see options.txt
    execute '%s/^\s\+$//ge'
    if &mod == 1
        " help 'write
        if @% == ''
            echomsg "File name is needed!"
            return
        else
            " :update
            write
        endif
    endif
    " help filename-modifiers
    " set filetype=?
    " !cmd % --could handle currently file by shell command
    if &filetype == 'c'
        " ---------------------------------------------------
        " help make makeprg errorformat quickfix
        " ---------------------------------------------------
        " options : standard : -std=c89
        " release compilation : -static
        " ---------------------------------------------------
        " 32-bit : gcc -m32
        " sudo apt install gcc-multilib g++-multilib
        " ---------------------------------------------------
        " windows : cygwin : simulation ; mingw-w64 : compilation ;
        " linux : wine : simulation ; mignw-w64 : compilation ;
        " sudo apt install mingw-w64
        " x86_64-w64-mingw32-gcc ; i686-w64-mingw32-gcc
        " sudo ln -s /usr/bin/i686-w64-mingw32-gcc gccwin32
        " sudo ln -s /usr/bin/x86_64-w64-mingw32-g++ g++win64
        " ---------------------------------------------------
        let _gcc_compile_options=" -Wfloat-equal -Wshadow -Wstrict-prototypes "
        execute "!gcc -Wall -Wextra -Wfatal-errors -g3 -pipe -Dtermanary=0 " .
                    \ _gcc_compile_options . " -o %:h/_%:t:r.mn %:p -lm "
    elseif &filetype == 'cpp'
        " octave-C++ :
        " sudo apt install liboctave-dev
        " mkoctfile helloworld.cpp
        " octave-cli --eval 'helloworld(*)'
        let _gpp_compile_options=" -Wfloat-equal -Wshadow "
        execute "!g++ -Wall -Wextra -Wfatal-errors -g3 -pipe -Dtermanary=0 " .
                    \ _gpp_compile_options . " -o %:h/_%:t:r.mn %:p "
    elseif &filetype == 'python'
        if expand("%:h") == "/home/me/script" || expand("%:h") ==
                    \ "/tmp"
            " for script
            if findfile(g:_the_input_file_,$PWD) != ""
                " pypy
                execute "!" . (executable(expand("%:p"))?"":"python3")
                            \ . " %:p <$PWD/input.tst"
            else
                execute "!" . (executable(expand("%:p"))?"":"python3") . " %:p"
            endif
        else
            " for OJ
            if findfile(g:_the_input_file_,expand("%:h")) != ""
                execute "!" . (executable(expand("%:p"))?"":"python3")
                            \ . " %:p <%:h/input.tst"
            else
                execute "!" . (executable(expand("%:p"))?"":"python3") . " %:p"
            endif
        endif
    elseif &filetype == 'matlab'
        " sudo apt install liboctave-dev
        " !mkoctfile %:p
        " !octave-cli --eval '%:t:r (*)'
        execute "!" . (executable(expand("%:p"))?"":"octave-cli --no-init-file ")
                    \ . "%:p"
    elseif &filetype == 'sh' || &filetype == 'zsh'
        " help :bar
        " zsh
        execute "!" . (executable(expand("%:p"))?"":"bash ") . "%:p"
    elseif &filetype == 'vim'
        source %:p
    elseif &filetype == 'java'
        " gnu-gcc:gcj/gij :was removed after gcc-7,was available before gcc-6
        " !javac -g -d %:h/class/ %:p
        execute "!" . (g:JavaNewVersion?"javac-11":"javac") . " -classpath %:h
                    \ -g -d %:h/class %:p"
    elseif &filetype == 'verilog'
        " sudo apt install / iverilog gtkwave / verilator
        " help : bufwinnr("str") windo
        " %:t:r:r : main.v main_tb.v/main.tb.v/main.vt
        if exists("g:Compile_Verilog_Only") && g:Compile_Verilog_Only
            !iverilog -o %:h/_%:t:r.mn %:p
        else
            let _tb_index=strridx(expand("%:t:r"),"_tb")
            if _tb_index == -1
                "verilog source file
                let _other_source_file_nr=bufwinnr(expand("%:t:r")."_tb")
                execute _other_source_file_nr == -1 ||
                    \ getbufinfo(bufnr(expand("%:t:r")."_tb"))[0].changed == 0
                    \ ? "" : _other_source_file_nr . " windo write | wincmd p"
                " -Wall
                execute "!iverilog -o %:h/_%:t:r.mn %:p" .
                    \ (findfile(expand("%:t:r")."_tb.v",expand("%:h")) == ""
                    \ ? "" : " %:h/%:t:r_tb.v")
            else
                "verilog testbench file
                let _new_filename=strcharpart(expand("%:t:r"),0,_tb_index)
                let _other_source_file_nr=bufwinnr(_new_filename . ".v")
                execute _other_source_file_nr == -1 ||
                    \ getbufinfo(bufnr(_new_filename . ".v"))[0].changed == 0 ?
                    \ "" : _other_source_file_nr . " windo write | wincmd p"
                execute "!iverilog -o %:h/_" . _new_filename . ".mn %:h/" .
                            \ _new_filename . ".v %:p"
            endif
        endif
    elseif &filetype == 'perl'
        execute "!" . (executable(expand("%:p"))?"":"perl -W ") . "%:p"
    elseif &filetype == 'haskell'
        !ghc %:p -o %:h/_%:t:r.mn
    elseif &filetype == 'asm'
        " only do this could gcc compile assemble to 32-bit : gcc -m32
        " sudo apt install gcc-multilib g++-multilib
        " intel : sudo apt install nasm
        " AT&T : sudo apt install as
        !nasm -f elf %:p -o %:h/_%:t:r.o
        !gcc -m32 %:h/_%:t:r.o -o %:h/_%:t:r.mn
    else
        if executable(expand("%:p"))
            ! %:p
        endif
    endif
endfunction

" help internal-variables to see l:
" if the variables definded out of a function,
" it's global ,if it is inside a function,
" it is function-local . outside the function
" could not use the variables in a function,
" in a function ,if you want to use the global
" varialbles ,you must add "g:" before a variables,
" the global-variable would not cover the function-local
" varialbles

function _TEST_INPUT_TO_RUN_()
    " findfile(),finddir()
    " register '%' and '#'
    " copen
    if &mod == 1
        if @% == ''
            echomsg "File name is needed!"
            return
        else
            write
        endif
    endif
    " when you want to give a string variable to another ,
    " you need to use "let"
    " when you want to merge two string variable together ,
    " use operator "."
    " %:p:h is different from %:h , other like : %:r:r %:.
    " help filename-modifiers
    " let _result_=expand("%:p:h") . "/" . g:_the_input_file_
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'asm'
                \ || &filetype == 'haskell'
        if findfile(g:_the_input_file_,expand("%:h")) != ""
            " help :!
            execute "! %:h/_%:t:r.mn < %:h/" . g:_the_input_file_
                        " \ . " 2>&1 \| tee /tmp/tmpoutput.%:t:r "
        elseif findfile(g:_the_input_file_,expand("%:h")) == ""
            " ! %:h/_%:t:r.mn 2>&1
            ! %:h/_%:t:r.mn
        else
            " echoerr
            echomsg 'ERROR!'
        endif
    elseif &filetype == 'java'
        if findfile(g:_the_input_file_,expand("%:h")) != ""
            execute "!" . (g:JavaNewVersion?"java-11":"java") .
                    \ " -classpath %:h/class %:t:r < %:h/" . g:_the_input_file_
        elseif findfile(g:_the_input_file_,expand("%:h")) == ""
            execute "!" . (g:JavaNewVersion?"java-11":"java") .
                        \ " -classpath %:h/class %:t:r "
                        " \ " -classpath %:h %:t:r 2>&1"
        else
            echomsg 'ERROR!'
        endif
    elseif &filetype == 'verilog'
        " if $TERM == 'linux' || $TERM == 'screen.linux'
        "
        " elseif $TERM == "xterm" || $TERM == 'screen'
        "
        " else
        "
        " endif
        "
        " verilog example :
        " initial
        " begin
        "     $dumpfile("first.vcd");
        "     $dumpvars(0,first_tb);
        "     $monitor("%g\t A is %b, B is %b.",$time,x_tb,y_tb);
        "     #1000 $finish;
        " end
        "
        let _tb_index=strridx(expand("%:t:r"),"_tb")
        if _tb_index == -1
            "verilog source file
            execute "!%:h/_%:t:r.mn" . (exists("g:less_use") && g:less_use ?
                        \" | tee /tmp/out":"")
        else
            "verilog testbench file
            let _new_filename=strcharpart(expand("%:t:r"),0,_tb_index)
            execute "! %:h/_" . _new_filename . ".mn" .(exists("g:less_use")
                        \ && g:less_use ? " | tee /tmp/out":"")
        endif
    endif
endfunction

function _DEBUG_()
    if &filetype == 'c' || &filetype == 'cpp'
        "
        " emacs :
        " !emacs --eval "(gdb \"gdb -i=mi %:h/_%:t:r.mn \")"
        "
        " help terminal-debug : <- vim plugin ->
        "
        " :Run [args]
        " :Arguments {args}
        "
        " :Break
        " :Clear
        "
        " :Step      = gdb "step"
        " :Over      = gdb "next"
        " :Finish    = gdb "finish"
        " :Continue  = gdb "continue"
        " :Stop
        "
        " call TermDebugSendCommand('where')
        packadd termdebug
        Termdebug %:h/_%:t:r.mn
        Gdb
        wincmd J
        Source
        wincmd H
        Program
        10 wincmd +
        Source

        noremap <buffer> b :Break <CR>
        noremap <buffer> d :Clear <CR>
        noremap <buffer> r :Run <input.tst <CR>
        noremap <buffer> n :Over <CR>
        noremap <buffer> s :Step <CR>
        noremap <buffer> c :Continue <CR>
        noremap <buffer> q :call TermDebugSendCommand('quit') <CR>
\:mapclear <buffer> <CR>

    elseif &filetype == 'python'
        !pudb3 %:p
    elseif &filetype == 'java'
        !jdb -classpath %:h %:t:r
    elseif &filetype =='verilog'
        let _tb_index=strridx(expand("%:t:r"),"_tb")
        if _tb_index == -1
            "verilog source file
            if g:gtkwave_ban == 0 && ( $TERM == "xterm" || $TERM == 'screen' )
                !gtkwave %:h/%:t:r.vcd
            endif
        else
            "verilog testbench file
            let _new_filename=strcharpart(expand("%:t:r"),0,_tb_index)
            if g:gtkwave_ban==0 && ( $TERM == "xterm" || $TERM == 'screen' )
                execute "!gtkwave %:h/" . _new_filename . ".vcd"
            endif
        endif
    elseif &filetype == 'perl'
        !perl -d %:p
    endif
endfunction

function _FILETYPE_SET_REGISTER_()
    " this function is about certain filetype and for local options ,
    " syntax highlighting , <buffer> map and b:variables .

    " if filereadable(expand("%:h") . "/vimrc.tmp")
    "     source %:h/vimrc.tmp
    " endif

    " syntax match SPACE "^\s\+$"
    " ctermbg,ctermfg is different
    " highlight SPACE gui=NONE cterm=bold  ctermbg=green

    if @% != "" && strridx(expand("%:p:h"),"/media/Windows") != -1
                \ && &fileformat == "unix" && &filetype == "verilog"
        setlocal fileformat=dos
        echomsg "DOS FILE!"
    endif

    mapclear <buffer>
    " vmapclear <buffer>
    " smapclear <buffer>
    " imapclear <buffer>

    if     &filetype == 'c' || &filetype == 'cpp'
        inoremap <buffer> { {<ESC>:call PAIRS()<CR>
        if &filetype == 'c'
            syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
            syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
            highlight cFunctions gui=NONE cterm=bold  ctermfg=yellow
        endif
    elseif &filetype == 'java'
        inoremap <buffer> { {<ESC>:call PAIRS()<CR>
    elseif &filetype == ''
        if expand("%:t:r") == 'input' || expand("%:t") == 'input.tst'
            setlocal iskeyword+=.,-
        endif
    elseif &filetype == 'python' || &filetype == 'sh' || &filetype == 'gdb'
                \ || &filetype == 'zsh' || &filetype == 'conf'
        highlight PYTHON_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        match PYTHON_MY_OWN_DEFINE_NOTE /^# #.*$/
    elseif &filetype == 'matlab'
        " highlight MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL ctermbg=red
        " match MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL /;\+$/
        highlight MATLAB_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        match MATLAB_MY_OWN_DEFINE_NOTE /^% %.*$/
        let @m=expand("%:t:r")
        noremap <buffer> <Leader>m :w <CR><C-w>l<C-W>"m<CR><C-w>p
        noremap <buffer> <Leader>; :s/$/;/<CR>:nohlsearch<CR>g;
        noremap <buffer> <Leader>, :s/;$//<CR>:nohlsearch<CR>g;
    elseif &filetype == 'vim'
        " help cterm-colors
        highlight VIM_MY_OWN_DEFINE_SPACE_EOL ctermbg=red
        match VIM_MY_OWN_DEFINE_SPACE_EOL /\s\+$/
    elseif &filetype == 'verilog'
        " see indent/verilog.vim : for write a indent file,
        " you need to know API in vim and regular expression
        let b:verilog_indent_modules = 1
        inoremap <buffer> ' '
        noremap <buffer> <leader>s :%s/[^.]\<\>/&_tb/gc
\<left><left><left><left><left><left><left><left><left><left>
    elseif &filetype == 'asm'
        syntax match AsmAddress "^\s\+\<[0-9a-fA-F]*\>:"me=e-1
        syntax match AsmNumber "\<[0-9a-fA-f]\{2}\> "
        highlight AsmAddress gui=NONE cterm=bold  ctermfg=darkyellow
        highlight AsmNumber gui=NONE cterm=bold  ctermfg=darkyellow
    endif
endfunction

" indent function
function BSD_STYLE(add)
    call append(".",repeat(" ",indent(".")) . "}" . (a:add?";":"") )
    call append(".",repeat(" ",indent(".") + &shiftwidth))
    call cursor(line(".")+1,col(".")+&shiftwidth)
    startinsert!
    " if there is no "return" , vimscript will run out of the next
    " command after "startinsert" before run "startinsert"
    return
endfunction
function NORMAL(pairs)
    if a:pairs
        call setline(".",getline(".")[0:col(".")-1] . "}"
                    \ . getline(".")[col("."):])
        " call setline(".",getline(".") . "}")
    endif
    if col(".") + 1 == col("$")
        startinsert!
    else
        call cursor(line("."),col(".") + 1)
        startinsert
    endif
    return
endfunction

function PAIRS()
    if &filetype == 'c' || &filetype == 'cpp'
        let Pos = col(".") - 2
        let LineString = getline(".")
        " current line
        if strridx(LineString,"enum ") != -1
            call NORMAL(1) | return
        elseif strridx(LineString,"else") != -1
                    \ || strridx(LineString,"do") != -1
            call BSD_STYLE(0) | return
        endif
        while Pos >= 0
            if LineString[Pos] == ')'
                call BSD_STYLE(0) | return
            elseif LineString[Pos] == '='
                call NORMAL(1) | return
            elseif LineString[Pos] != ' '
                call NORMAL(0) | return
            endif
            let Pos -= 1
        endwhile
        " previous line
        if line(".") != 1 && ( strridx(getline(line(".")-1)[0:5],"struct")
                    \ != -1 || strridx(getline(line(".")-1)[0:4],"union")!=-1)
            call BSD_STYLE(1) | return
        else
            call BSD_STYLE(0) | return
        endif
    elseif &filetype == 'java'
        let Pos = col(".") - 2
        let LineString = getline(".")
        if strridx(LineString,"else") != -1
            call BSD_STYLE(0) | return
        endif
        while Pos >= 0
            if LineString[Pos] == ')'
                call BSD_STYLE(0) | return
            elseif LineString[Pos] == '='
                call NORMAL(1) | return
            elseif LineString[Pos] != ' '
                call NORMAL(0) | return
            endif
            let Pos -= 1
        endwhile
        call BSD_STYLE(0) | return
    endif
endfunction

let s:_function_exists=0
" autocmd--------------------------------------------------------------

augroup _MY_OWN_DEFINE_
    " autocmd!  -->clear the autocmd had been defined before
    " the current augroup before the current command
    autocmd!
    " autocmd OptionSet insertmode  call _MY_OWN_KEY_MAP_INSERTMODE_()
    " updatetime->CursorHoldI
    autocmd CursorHoldI * stopinsert
    autocmd BufReadPost * if line("'\"") <= line("$") | exe "normal! g`\"" | endif
    autocmd BufReadPost *.c,*.cpp,*.py,*m,*sh,*.vim,*.v
                \ if ! &readonly | execute '%s/^\s\+$//ge' | endif
    autocmd BufEnter * call _FILETYPE_SET_REGISTER_()
    " autocmd BufWritePost * if $USER == 'me' | mkview | endif
    " autocmd BufReadPost * if @% != '' && $USER == 'me' | loadview | endif
    " autocmd CursorHold * redraw
augroup end

" command--------------------------------------------------------------

if exists("s:_command_exists")
    delcommand Vlsplit
    delcommand Vrsplit
endif

" help function-argument
" help command-complete cmdline-completion
" help 40.2
" -nargs = x : just supply a number of x arguments
" help <f-args> <args>
command -complete=file -nargs=* LS !ls --color=auto
command -complete=file -nargs=* Vlsplit :call VsplitFunction("l",<f-args>)
command -complete=file -nargs=* Vrsplit :call VsplitFunction("r",<f-args>)
function VsplitFunction(direction, ... )
    if a:direction != "l" && a:direction != "r"
        echomsg "Direction have no effect!"
        return
    endif
    if a:0 == 0
        if a:direction == "l"
            execute "vsplit "
        elseif a:direction == "r"
            execute "vertical rightbelow vsplit "
        endif
    else
        " help a:0 a:1 a:000 a:000[0]
        for Files in a:000
            if a:direction == "l"
                execute "vsplit " . Files
            elseif a:direction == "r"
                execute "vertical rightbelow vsplit " . Files
            endif
        endfor
    endif
endfunction

" For Java Complete :
" command! -nargs=1 -complete=customlist,JavaComplete Java !java <args>
"
" " getcompletion()
" " function! FileCompletion(ArgLead, CmdLine, CursorPos)
" "     return getcompletion(a:ArgLead, 'file')
" " endfunction
"
" function! JavaComplete(ArgLead,CmdLine,CursorPos)
"     if match(&wildignore,"*.class") != -1
"         set wildignore -=*.class
"         let re = split(glob("*.class"),"\n")
"         set wildignore +=*.class
"         return re
"     else
"         let re = split(glob("*.class"),"\n")
"         return split(glob("*.class"),"\n")
"     endif
" endfunction

let s:_command_exists=0

" Plugin---------------------------------------------------------------

" Plugin : NERDCommment
noremap <Leader>d :call NERDComment("n","Toggle") <CR>
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_python = 0
let g:NERDCommentEmptyLines = 1
let g:NERDCreateDefaultMappings = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 0

" Plugin : auto-pairs
" Affected Char : \' \" ( [ {
" Needed Function :(<insert>) (<BS>) (<SPACE>) (<indent>)

" Comment--------------------------------------------------------------

" color:
" Black White
" DarkRed Red
" DarkYellow Yellow
" DarkGreen Green
" DarkBlue Blue
" DarkCyan Cyan
" DarkMagenta Magenta
" DarkGrey Grey

" Status line
" https://groups.google.com/forum/#!topic/vim_use/wPnsi-40FhE
" set laststatus=2
" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4c\ %*             "column number
" set statusline +=%2*0x%04B\ %*          "character under cursor

" Concat the active statusline
" ------------------------------------------=--------------------=------------
"               Gibberish                   | What da heck?      | Example
" ------------------------------------------+--------------------+------------
" set statusline=                            "| Clear status line  |
" set statusline+=\ %7*%{&paste?'=':''}%*    "| Paste symbol       | =
" set statusline+=%4*%{&ro?'':'#'}%*         "| Modifiable symbol  | #
" set statusline+=%6*%{TlMode()}             "| Readonly symbol    | 
" set statusline+=%*%n                       "| Buffer number      | 3
" set statusline+=%6*%{TlModified()}%0*      "| Write symbol       | +
" set statusline+=\ %1*%{TlSuperName()}%*    "| Relative supername | cor/app.js
" set statusline+=\ %<                       "| Truncate here      |
" set statusline+=%(\ %{TlBranchName()}\ %) "| Git branch name    |  master
" set statusline+=%4*%(%{TlWhitespace()}\ %) "| Space and indent   | trail34
" set statusline+=%(%{TlSyntax()}\ %)%*      "| syntax error/warn  | E:1W:1
" set statusline+=%=                         "| Align to right     |
" set statusline+=%{TlFormat()}\ %4*%*      "| File format        | unix 
" set statusline+=%(\ %{&fenc}\ %)           "| File encoding      | utf-8
" set statusline+=%4*%*%(\ %{&ft}\ %)       "| File type          |  python
" set statusline+=%3*%2*\ %l/%2c%4p%%\ %*   "| Line and column    | 69:77/ 90%
" ------------------------------------------'--------------------'---------

