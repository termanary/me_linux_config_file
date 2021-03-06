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

" COMPILE VIM:
" How to compile vim with terminal and python3 feature :
" you could choose to install vim-nox or vim-gtk,
" it support all scripting and features.
" clear cache : rm $/src/auto/config.cache
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

" SOURCE FILE:--------------------------------------------------------

" ~ could not be recognize
" $HOME must out of ""
" if filereadable($HOME . "/Etc" . "/defaults.vim")
if filereadable("/usr/share/vim/vim80/defaults.vim")
    source /usr/share/vim/vim80/defaults.vim
elseif v:version == 801
    source /usr/local/share/vim/vim81/defaults.vim
else
    echoerr "fail read defaults.vim"
endif

if filereadable("/usr/share/vim/vim80/ftplugin.vim")
    source /usr/share/vim/vim80/ftplugin.vim
elseif v:version == 801
    source /usr/local/share/vim/vim81/ftplugin.vim
else
    echoerr "fail read ftplugin.vim"
endif

" SETTING: -----------------------------------------------------------

set nocompatible

" NUMBER:
set number
set relativenumber
set numberwidth=3

" TAB:
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set nojoinspaces
" set list
" set listchars=tab:>-

" INDENT:
set autoindent
set smartindent
" see $VIMRUNTIME/scripts.vim $VIMRUNTIME/filetype.vim
filetype indent plugin on
" set foldmethod=manual
" help cinoptions-value
set cinoptions=(1s
" help ft-python-indent
let g:pyindent_open_paren = '&sw'
let g:pyindent_continue = '&sw * 2'
" let g:pyindent_nested_paren = '&sw * 2'

" SEARCH:
set ignorecase
set incsearch
set smartcase
set hlsearch

" MAP WAITING:
set notimeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0

" STATUSLINE:
" when shortmess include 'I', there will be not intro-msg
set shortmess+=filnrx
set shortmess-=mwasWAqFSI
set showmode
set showcmd
set ruler
" set rulerformat
set showtabline=1
set laststatus=1
" set tabline=
set tabline=%!_TAB_LINE_()
" set statusline=
" set fillchars&
" set lazyredraw

" WILD MENU:
" help wildcard
set wildmenu
set wildmode=full
" set wildchar&
" makefiles need ?
set wildignore+=*.o,*.hi,*.class
" set suffixes+=.o,.class

" ENCODE:
set encoding=utf-8
" cp936 is GBK
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,default,latin1
" set fileencoding
set fileformats=unix,dos
" set fileformat
" set termencoding

" TAB PAGE:
" only for vim -p, not for :tabnew
set tabpagemax=4

" MODELINE:
set modeline
set modelines=3

" SPLIT:
" set nosplitbelow
" set nosplitright
" set noconfirm

" vimrc in curent dir
" set noexrc
" set nosecure

" PYTHON:
" set pyxversion&
" set pythondll&
" set pythonhome&
" set pythonthreedll&
" set pythonthreehome&

" OTHER:
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

set cpoptions-=cHInx;
" set cpoptions+=q
" : bin,octal,hex,alpha
set nrformats=bin,octal,hex

" set mousehide
" set mousemodel

" set spell

" HIGHLIGHT:
" see highlight for exmaple
" the order of next 3 line could not be change
" colorscheme for ubuntu-18.04:zellner
if $USER == 'me'
    colorscheme MyColo
elseif $USER == 'syx'
    colorscheme MyColo
endif
highlight CursorLine cterm=NONE ctermbg=blue
highlight CursorColumn cterm=NONE ctermbg=blue

" set autochdir
" set shellcmdflag=-ic
" set revins
" set autowriteall
" set cindent
" set cursorline
" set lines=33 columns=95

" CAB:----------------------------------------------------------------

" help vert windo bufdo
cab h vertical leftabove help
cab t vertical rightbelow terminal ++rows=48 ++cols=70
" cab oct octave-cli \| sed 's/ans =//' \| sed 's/^\s\+//g' \| sed 's/\s\+/ /g'
"             \ \| sed '/Columns/d' \| sed '/^\s*$/d'
" cab mat vertical rightbelow terminal ++rows=48 ++cols=70 matlab
"             \ -nodesktop -nosplash

" CNOREMAP:-----------------------------------------------------------

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" INOREMAP:-----------------------------------------------------------

inoremap ' ''<left>
inoremap " ""<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>

" inoremap <C-b> <left>
inoremap <C-f> <right>
inoremap <C-e> <end>
inoremap <delete> <Nop>

" NOREMAP:------------------------------------------------------------
" nnoremap
" help map-modes

" all function call map must add <C-u> to avoid errors by number
noremap <F9> :<C-u>call _COMPILE_() <CR>
noremap <F10> :<C-u>call _TEST_INPUT_TO_RUN_() <CR>
noremap <F11> :<C-u>call _DEBUG_() <CR>

" help getcharsearch()  <expr> map-argument
" map could have argument
noremap <expr> ; getcharsearch().forward ? ';' : ','
noremap <expr> , getcharsearch().forward ? ',' : ';'
" help internal-variables
noremap <expr> n v:searchforward ? 'n' : 'N'
noremap <expr> N v:searchforward ? 'N' : 'n'

" help index
noremap 0 ^
noremap ^ 0
noremap [ {
noremap ] }
noremap m `
noremap ' m
noremap ` '
noremap - :
" mode()
noremap \ :!

noremap <Space> <Nop>
noremap <Del> <Nop>
noremap <insert> <Nop>

" help key-codes
" if leader couldnt find a new key ,consider 't'
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

noremap <leader>i :<C-u>setlocal cursorline! <CR>
noremap <Leader>/ :<C-u>nohlsearch <CR>
noremap <Leader>u g~aw
noremap <Leader>e :<C-u>setlocal cursorline! cursorcolumn!<CR>:sleep 400m
            \<CR>:setlocal cursorline! cursorcolumn!<CR>

" TAB: help tabpage
" N: need <C-u> to clear
" consider to use 'tabnew' or 'tab vsplit'
" help v:count, EXAMPLE: noremap gx :<C-u>echo v:count<CR>
" 'tabmove +N' != 'tabmove N' and 'tabnext +N' != 'tabnext N'
" 'tabnext' != 'tabnext +1'->will cause Error
noremap <Leader>wt :tab vsplit <CR>
noremap gt :<C-u>call _TAB_NEXT_() <CR>
" noremap <Leader>tX :<C-u>tabmove +1 <CR>
" noremap <Leader>tx :<C-u>tabmove -1 <CR>
" noremap <Leader>tv :<C-u>tab vsplit <CR>

" BUFFER:
" buffer-list argument-list
noremap <Leader>bn :bn <CR>
noremap <Leader>bp :bN <CR>

" QUICKFIX:
" noremap <Leader>xo :<C-u>copen <CR>
" noremap <Leader>xc :<C-u>cclose <CR>
" noremap <Leader>xn :<C-u> (v:count?1:v:count) cnext <CR>
noremap <Leader>xn :<C-u> cnext <CR>
noremap <Leader>xp :<C-u> cprevious <CR>

" FILE EDIT:----------------------------------------------------------

" How to use one line for 'if' in cmdline : au , map : |
" autocmd CursorHold * if 1==1 | echomsg '0' | endif
" noremap <leader>a :if 1 == 1 \| echom '0' \| endif <CR>

" OJ:
noremap <Leader>vm :<C-u>call _OPENFILE_("","l") <CR>
noremap <Leader>vi :<C-u>call _OPENFILE_("input.tst","r") <CR>
noremap <Leader>vg :<C-u>call _OPENFILE_("~/.gdbinit","r") <CR>

" copy to save -> OJ
" noremap <Leader>vh :<C-u>!cp %:p ~/hdoj/all/
" noremap <Leader>vk :<C-u>!cp %:p ~/poj/all/
" noremap <Leader>va :<C-u>!cp %:p /home/syx/.main.c <CR>

" SCRIPT:
noremap <Leader>vs :<C-u>call _OPENFILE_("~/script/shell.sh","l") <CR>
noremap <Leader>vp :<C-u>call _OPENFILE_("~/script/python3.py","l") <CR>
noremap <Leader>vd :<C-u>call _OPENFILE_("~/script/Tmp/dot/graph.dot","l") <CR>
" noremap <Leader>vy :<C-u>call _OPENFILE_("~/.pythonstartup","l") <CR>
noremap <Leader>vb :<C-u>call _SHELL_ALIASES_() <CR>
" noremap <Leader>vr :<C-u>call _OPENFILE_("~/.psqlrc","l") <CR>:set filetype=sql <CR>
" noremap <Leader>vq :<C-u>call _OPENFILE_("~/script/pgSQL.sql","l") <CR>

" VIMRC:
noremap <Leader>ve :<C-u>call _OPENFILE_("~/.vim/vimrc","l") <CR>
noremap <Leader>vt :<C-u>call _OPENFILE_("~/script/vimscript.vim","l") <CR>

" OCTAVE:
noremap <Leader>vo :<C-u>call _OPENFILE_("~/script/octave.m ","l") <CR>
noremap <Leader>vn :<C-u>call _OPENFILE_("~/script/input.tst","l") <CR>
" noremap <Leader>vc :<C-u>call _OPENFILE_("~/.octaverc","l") <CR>

" TNOREMAP:-----------------------------------------------------------

if !has('terminal')
    echoerr "Don't support terminal!"
else
    " tnoremap <C-W>n <C-W>N
    " tnoremap <C-W>N <C-W>n
    tnoremap <ESC> <C-w>p
endif

" FUNCTION:-----------------------------------------------------------

" the difference between "function x" and "function! x"
" when the vim-file is sourced ,"function x" will become
" an error and the function will not be substitute ,but
" the "function! x" not

" diference between echo and echomsg :
" echo : all types , no messages
" echomsg : string type , messages

function _PYTHON_FUNCTION_()
    if !has('python3_compiled')
        echoerr "Don't support python3!"
        " finish
        return
    endif
    if !has('python3_dynamic')
        echoerr "Could not dynamic load python3!"
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
"main.py",
# "mycpu_top.v",
]
FileFormat = [
".c",
".cpp",
".h",
".java",
".v",
".s",
".sql",
".py",
".sh",
".vim",
".m",
".html",
".css",
".js",
".jsp",
".dot",
".l",
".y",
".pl",
".hs",
]
FileAdd = [
".c",
".cpp",
".s",
]

CurDirList = os.listdir(".")
CurDirList.sort()
CurDirList.reverse()
# remove the hidden file:
for i in range(len(CurDirList)) :
    if CurDirList[i][0] == '.' :
        CurDirList = CurDirList[0:i]
        break
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

" GLOBAL VARIABLES: --------------------------------------------------

" if a global variable do not define as this ,
" it will not be aoto-complete in cmd-line
" help List
let g:gtkwave_ban = 0
let g:MipsCompile = 0
noremap <F8> :<C-u>call _GlobalVariableReverse_() <CR>
function _GlobalVariableReverse_()
    if &filetype == 'c' || &filetype == 'cpp'
        let g:MipsCompile = !g:MipsCompile
    elseif &filetype == 'verilog'
        let g:gtkwave_ban = !g:gtkwave_ban
    endif
endfunction

" ----------------------------------------------------------------------

function _SHELL_ALIASES_()
    if $USER == "me"
        call _OPENFILE_("~/.zsh_aliases","l")
    elseif $USER == "syx"
        call _OPENFILE_("~/.bash_aliases","l")
    endif
endfunction

" help function / function-list
function _OPENFILE_(filename,lr)
    " vim -
    " :vsplit : for f in [ 'files','files' ] | exe 'vsplit ' f | endfor
    " help :for / :bar
    if a:filename == ""
        call _PYTHON_FUNCTION_()
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
                echoerr 'ERROR!'
            endif
        endif
    endif
endfunction

" help v:
if !exists("g:_the_input_file_")
    " can not have ; with 'let'
    let g:_the_input_file_="input.tst"
endif

" MAKEFILE:
" How to create a Makefile automatically
function _AUTO_COMPILE_()
    " compile main.c -> _main.mn
    !cd $PWD
    !autoscan
    !cp configure.scan configure.ac
    !sed -i '/AC_INIT/ a AM_INIT_AUTOMAKE' configure.ac
    !sed -i '/AC_OUTPUT/ i AC_CONFIG_FILES([Makefile])' configure.ac
    !aclocal
    !autoheader
    !autoconf
    !touch Makefile.am
    !echo "bin_PROGRAMS=_main.mn" > Makefile.am
    !echo "_main_mn_SOURCES=main.c" >> Makefile.am
    !touch NEWS README AUTHORS ChangeLog
    !automake -a
    !./configure
    " !make
    " !./_main.mn
endfunction

" FOR WEB:
" modify tomcat8 configure file first: info needed to be recorded
" touch /etc/tomcat8/Catalina/localhost/test.xml
" add: <Context docBase="/home/syx/web/"/>
let g:prefix="http://127.0.0.1:8080/"
let g:filexml="test"."/"
" you may need to judge dir sometimes
let g:docBase="/home/syx/web/"

function _COMPILE_()
    " if you want to get all the variable :see options.txt
    execute '%s/^\s\+$//ge'
    if &mod == 1
        " help 'write
        if &readonly == 1
            echoerr "Readonly file!"
            return
        elseif @% == ''
            echoerr "File name is needed!"
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
        " Linux could compile a program of other architecture like MIPS :
        " 32 bit : gcc-mips-linux-gnu gcc-mipsel-linux-gnu
        " 64 bit : gcc-mips64-linux-gnuabi64 gcc-mips64el-linux-gnuabi64
        " g++* , too
        if findfile("Makefile",expand("%:h")) != ""
            make
        elseif g:MipsCompile
            let MipsGcc="mips-linux-gnu-gcc "
            let MipsCompileOptions="-S "
            execute "!" . MipsGcc . MipsCompileOptions . "-o %:h/%:t:r.s %:p"
        else
            let GccCompileOptions="-Wfloat-equal -Wshadow -Wstrict-prototypes"
            execute "!gcc -Wall -Wextra -lpthread -Wfatal-errors -g3 -pipe
                        \ -Dtermanary=0 " . GccCompileOptions .
                        \ " -o %:h/_%:t:r.mn %:p -lm "
        endif
    elseif &filetype == 'cpp'
        " octave-C++ :
        " sudo apt install liboctave-dev
        " mkoctfile helloworld.cpp
        " octave-cli --eval 'helloworld(*)'
        if findfile("Makefile",expand("%:h")) != ""
            make
        else
            let _gpp_compile_options="-Wfloat-equal -Wshadow"
            execute "!g++ -Wall -Wextra -lpthread -Wfatal-errors -g3 -pipe
                        \ -Dtermanary=0 " . _gpp_compile_options .
                        \ " -o %:h/_%:t:r.mn %:p "
        endif
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
    elseif &filetype == 'sh' || &filetype == 'zsh'
        " help :bar
        " zsh
        execute "!" . (executable(expand("%:p"))?"":"bash ") . "%:p"
    elseif &filetype == 'vim'
        source %:p
    elseif &filetype == 'matlab'
        " sudo apt install liboctave-dev
        " !mkoctfile %:p
        " !octave-cli --eval '%:t:r (*)'
        execute "!" . (executable(expand("%:p"))?"":"octave-cli --no-init-file ")
                    \ . "%:p"
    elseif &filetype == 'java'
        " gnu-gcc:gcj/gij :was removed after gcc-7,was available before gcc-6
        if findfile(expand("%:h") . "/" . ".class") != ""
            echoerr "ERROR: \".class\" is not a directory!"
        else
            call mkdir(expand("%:h") . "/" . ".class","p")
            " just one file:
            !javac -d %:h/.class -classpath %:h/.class:%:h:. -g %:p
            " a project:
            " !javac -d . -classpath %:h/.class:%:h:. -g %:p
        endif
    elseif &filetype == 'sql'
        " !psql < %:p
        " !psql -c

        " !mysql -ume -pme < %:p
        !mysql -ume -pme -e "source %:p"
    elseif &filetype == 'verilog'
        " How about use automake?
        " sudo apt install / iverilog gtkwave / verilator
        " help : bufwinnr("str") windo
        " %:t:r:r : main.v main_tb.v/main.tb.v/main.vt
        if exists("g:Compile_Verilog_Only") && g:Compile_Verilog_Only
            !iverilog -o %:h/_%:t:r.vvp %:p
        else
            let _tb_index=strridx(expand("%:t:r"),"_tb")
            if _tb_index == -1
                "verilog source file
                let _other_source_file_nr=bufwinnr(expand("%:t:r")."_tb")
                execute _other_source_file_nr == -1 ||
                    \ getbufinfo(bufnr(expand("%:t:r")."_tb"))[0].changed == 0
                    \ ? "" : _other_source_file_nr . " windo write | wincmd p"
                " -Wall
                execute "!iverilog -o %:h/_%:t:r.vvp %:p" .
                    \ (findfile(expand("%:t:r")."_tb.v",expand("%:h")) == ""
                    \ ? "" : " %:h/%:t:r_tb.v")
            else
                "verilog testbench file
                let _new_filename=strcharpart(expand("%:t:r"),0,_tb_index)
                let _other_source_file_nr=bufwinnr(_new_filename . ".v")
                execute _other_source_file_nr == -1 ||
                    \ getbufinfo(bufnr(_new_filename . ".v"))[0].changed == 0 ?
                    \ "" : _other_source_file_nr . " windo write | wincmd p"
                execute "!iverilog -o %:h/_" . _new_filename . ".vvp %:h/" .
                            \ _new_filename . ".v %:p"
            endif
        endif
    elseif &filetype == 'make'
        make
    elseif &filetype == 'dot'
        " dot could also product svg-format image
        " svg: vector graph, plain text, html/js,
        !dot -Tpng %:p -o %:h/%:t:r.png
    elseif &filetype == 'lex'
        " flex
        if findfile("Makefile",expand("%:h")) != ""
            make
        else
            " filename-modifiers: %:p:h:h %:t:r:r %:s?x?x?
            " -d --yywrap
            !flex --yylineno --header-file=%:h/%:t:r_lex.h -o %:h/%:t:r_lex.c %:p
        endif
    elseif &filetype == 'yacc'
        " bison
        if findfile("Makefile",expand("%:h")) != ""
            make
        else
            !bison --defines=%:h/%:t:r_yacc.h -o %:h/%:t:r_yacc.c %:p
        endif
    elseif &filetype == 'html' || &filetype == 'xhtml'
        " ASYNCHRONOUS RUNNING:
        " help channel
        " help job-options
        " let data = job_start("cmd",{
        "             \"out_cb":"FUN_OUT_CB",
        "             \"err_cb":"FUN_ERR_CB",
        "             \"close_cb":"FUN_CLOSE_CB",
        "             \"exit_cb":"FUN_EXIT_CB"
        "             \})
        " function! FUN_OUT_CB(channel,msg)
        " endfunction
        " function! FUN_ERR_CB(channel,msg)
        " endfunction
        " function! FUN_CLOSE_CB(channel)
        " endfunction
        " function! FUN_EXIT_CB(channel,msg)
        " endfunction
        let index=strridx(expand("%:p"),g:docBase)
        let filename=expand("%:p")
        " file must in g:docBase
        if -1!=index
            let filename=filename[index+strlen(g:docBase):]
            call job_start("firefox --full-screen --new-tab " . g:prefix . g:filexml . filename )
        else
            " !firefox %:p
            call job_start("firefox --full-screen --new-tab " . filename)
        endif
    elseif &filetype == 'jsp'
        let index=strridx(expand("%:p"),g:docBase)
        let filename=expand("%:p")
        " file must in g:docBase
        if -1!=index
            " stridx(),strridx() str[2:3]
            let filename=filename[index+strlen(g:docBase):]
            call job_start("firefox --full-screen --new-tab " . g:prefix . g:filexml . filename )
        else
            echoerr "Could not run!"
        endif
    elseif &filetype == 'javascript'
        " js run in different location is totolly different:different api
        " js in browser(client),js in server(nodejs) and js in firefox(browser
        " api)
        " install web-ext: npm install --global web-ext
        " !web-ext run
        " !node/nodejs
        !nodejs --use_strict %:p
    elseif &filetype == 'perl'
        execute "!" . (executable(expand("%:p"))?"":"perl -W ") . "%:p"
    elseif &filetype == 'haskell'
        !ghc %:p -o %:h/_%:t:r.mn
    elseif &filetype == 'asm'
        " only do this could gcc compile assemble to 32-bit : gcc -m32
        " sudo apt install gcc-multilib g++-multilib
        " intel : sudo apt install nasm
        " AT&T : sudo apt install as
        !nasm %:p -o %:h/%:t:r.bin
        !dd if=%:h/%:t:r.bin of=fd.img bs=512 count=1 conv=notrunc
        !bochs
        " if !g:MipsCompile
        "     !nasm -f elf %:p -o %:h/_%:t:r.o
        "     !gcc -m32 %:h/_%:t:r.o -o %:h/_%:t:r.mn
        " endif
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
        if &readonly == 1
            echoerr "Readonly file!"
            return
        elseif @% == ''
            echoerr "File name is needed!"
            return
        else
            write
        endif
    endif
    if findfile(g:_the_input_file_,expand("%:h")) != ""
        let existInput=1
    else
        let existInput=0
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
        if existInput
            " help :!
            execute "! %:h/_%:t:r.mn < %:h/" . g:_the_input_file_
                        " \ . " 2>&1 \| tee /tmp/tmpoutput.%:t:r "
        else
            " ! %:h/_%:t:r.mn 2>&1
            ! %:h/_%:t:r.mn
            " echoerr
        endif
    elseif &filetype == 'java'
        " if you need other *.jar,you need to add '-cp /path/a.jar:*'
        if existInput
            " for java-mysql
            execute "!java -classpath %:h/.class:%:h:/usr/share/java/mysql.jar:. %:t:r < %:h/" . g:_the_input_file_
        else
            !java -classpath %:h/.class:%:h:/usr/share/java/mysql.jar:. %:t:r
                        " \ " -classpath %:h %:t:r 2>&1"
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
            execute "!vvp -n %:h/_%:t:r.vvp" . (exists("g:less_use") && g:less_use ?
                        \" | tee /tmp/out":"")
        else
            "verilog testbench file
            let _new_filename=strcharpart(expand("%:t:r"),0,_tb_index)
            execute "!vvp -n %:h/_" . _new_filename . ".vvp" .(exists("g:less_use")
                        \ && g:less_use ? " | tee /tmp/out":"")
        endif
    elseif &filetype == 'dot'
        !fim %:h/%:t:r.png
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
        " :Evaluate
        "
        " call TermDebugSendCommand('where')
        "
        tab vsplit
        packadd termdebug
        " can't use '~'
        Termdebug %:h/_%:t:r.mn
        " Gdb Program Source
        Source
        wincmd H
        Program
        " 'wincmd 15 -' is illegal:
        15 wincmd -
        tnoremap <buffer> <ESC> <C-w>:<C-u>Source<CR>
        Gdb
        " call win_execute()
        tnoremap <buffer> <ESC> <C-w>:<C-u>Source<CR>
        Source
        "
        " 'K'
        noremap <buffer> <Leader>cb :<C-u>Break <CR>
        noremap <buffer> <Leader>cd :<C-u>Clear <CR>
        noremap <buffer> <Leader>cr :<C-u>Run <CR>
        " noremap <buffer> <Leader>cn :<C-u>Over <CR>
        noremap <buffer> <Leader>cc :<C-u>Continue <CR>
        noremap <buffer> <Leader>cs :<C-u>Step <CR>
        noremap <buffer> <Leader>cn :<C-u>call TermDebugSendCommand('next') <CR>
        noremap <buffer> <Leader>cq :<C-u>call TermDebugSendCommand('quit') <CR>
                    \:mapclear <buffer> <CR>
        " noremap <buffer> <Leader>cg :<C-u>call TermDebugSendCommand(
        "             \'startup_deubg') <CR>
        noremap <buffer> <Leader>cp :<C-u>call TermDebugSendCommand('display') <CR>
        noremap <buffer> <Leader>h :<C-u>Source<CR>
        noremap <buffer> <Leader>l :<C-u>Gdb<CR>
    elseif &filetype == 'python'
        !pudb3 %:p
    elseif &filetype == 'java'
        " long time no use
        " !jdb -classpath %:h %:t:r
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
    elseif &filetype == 'javascript'
        !nodejs debug %:p
    elseif &filetype == 'perl'
        !perl -d %:p
    endif
endfunction

" You could use 'K' to get help about octave by <cword> and 'keywordprg' :
function _DOC_HELP_()
    if &filetype == 'matlab'
        " How <cword> use in :! or expand, it likes %:p
        execute "!octave-cli --eval \"help <cword>\" "
    endif
endfunction

function _FILETYPE_SET_REGISTER_()
    " this function is about certain filetype and for local options ,
    " syntax highlighting , <buffer> map and b:variables .
    " match only used in current window
    " syntax match SPACE "^\s\+$"
    " ctermbg,ctermfg is different
    " RGB value #000000 only could be used to gui, not cterm
    " highlight SPACE gui=NONE cterm=bold  ctermbg=green

    " if @% != "" && strridx(expand("%:p:h"),"/media/Windows") != -1
    "             \ && &fileformat == "unix" && &filetype == "verilog"
    "     setlocal fileformat=dos
    "     echomsg "DOS FILE!"
    " endif

    if &filetype != 'c' && &filetype != 'cpp'
        " for Termdebug package
        mapclear <buffer>
    endif
    " vmapclear <buffer>
    " smapclear <buffer>
    " imapclear <buffer>
    if     &filetype == 'c' || &filetype == 'cpp'
        inoremap <buffer> { {<ESC>:<C-u>call PAIRS()<CR>
        if &filetype == 'c'
            syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
            syntax match cFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
            highlight cFunctions gui=NONE cterm=bold  ctermfg=yellow
        endif
    elseif &filetype == 'java'
        inoremap <buffer> { {<ESC>:<C-u>call PAIRS()<CR>
    elseif &filetype == ''
        if expand("%:t:r") == 'input' || expand("%:t") == 'input.tst'
            setlocal iskeyword+=.,-
        endif
    elseif &filetype == 'python' || &filetype == 'sh' || &filetype == 'gdb'
                \ || &filetype == 'zsh' || &filetype == 'conf'
        if &filetype == 'python'
            " K: help
            " 'iskeyword influence 'keywordprg
            " setlocal iskeyword+=.
            setlocal keywordprg=pydoc3
        endif
        highlight PYTHON_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        syntax match PYTHON_MY_OWN_DEFINE_NOTE /^#\s*#.*$/
    elseif &filetype == 'matlab'
        " setlocal keywordprg=:<C-u>call _DOC_HELP_()
        " highlight MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL ctermbg=red
        " match MATLAB_MY_OWN_DEFINE_SEMICOLON_EOL /;\+$/
        highlight MATLAB_MY_OWN_DEFINE_NOTE ctermbg=blue ctermfg=white
        syntax match MATLAB_MY_OWN_DEFINE_NOTE /^%\s*%.*$/
        " search @[a-zA-Z] too check
        " help registers:
        " let @m=expand("%:t:r")
        " noremap <buffer> <Leader>m :<C-u>w <CR><C-w>l<C-W>"m<CR><C-w>p
        " noremap <buffer> <Leader>; :s/$/;/<CR>:nohlsearch<CR>g;
        " noremap <buffer> <Leader>, :s/;$//<CR>:nohlsearch<CR>g;
    elseif &filetype == 'vim'
        " help cterm-colors
        highlight VIM_MY_OWN_DEFINE_SPACE_EOL ctermbg=red
        syntax match VIM_MY_OWN_DEFINE_SPACE_EOL /\s\+$/
        " if with ':' in the beginning, it will be accept as an Ex-cmd
        setlocal keywordprg=:vertical\ leftabove\ help
    elseif &filetype == 'make'
        setlocal noexpandtab
        setlocal list
        setlocal listchars=tab:>-
    elseif &filetype == 'verilog'
        " see indent/verilog.vim : for write a indent file,
        " you need to know API in vim and regular expression
        let b:verilog_indent_modules = 1
        inoremap <buffer> ' '
        " noremap <buffer> <leader>s :<C-u>%s/[^.]\<\>/&_tb/gc
" \<left><left><left><left><left><left><left><left><left><left>
    elseif &filetype == 'asm'
        syntax match AsmAddress "^\s\+\<[0-9a-fA-F]*\>:"me=e-1
        syntax match AsmNumber "\<[0-9a-fA-f]\{2}\> "
        highlight AsmAddress gui=NONE cterm=bold ctermfg=darkyellow
        highlight AsmNumber gui=NONE cterm=bold ctermfg=darkyellow
    elseif &filetype == 'html'
        " inoremap <buffer> < <><left>
    elseif &filetype == 'perl'
        setlocal keywordprg=perldoc
    endif
endfunction

" INDENT FUNCTION:'{'
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

" TIMER:
" To display time in tabline realtime :
" let timer=timer_start(1000,"_TIMER_CB_",{"repeat":-1})
call timer_start(1000,"_TIMER_CB_",{"repeat":-1})
function _TIMER_CB_(timer)
    redrawtabline
endfunction
" highlight tab<tab>
" only gui could use RGB value #000000
highlight TabLine cterm=bold ctermfg=darkcyan ctermbg=black
highlight TabLineSel cterm=bold ctermfg=black ctermbg=darkyellow
highlight TabLineFill cterm=bold ctermfg=yellow ctermbg=black
highlight TabLineInfo cterm=bold ctermfg=magenta ctermbg=black
function _TAB_LINE_()
    let tabLineStr=""
    " NOTE: range(x) = [0,...,x-1] ; range(a,b) = [a,...,b]
    " winnr(),tabpagewinnr() is similar to tabpagenr(),
    " use arg "$" to get num:
    for i in range(1,tabpagenr("$"))
        "
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let fullname = bufname(buflist[winnr-1])
        let index = strridx(fullname,'/')
        let name = fullname[index+1:len(fullname)] . ' '
        let name = len(name)==1? "[No Name] " : name
        let fnalen = 20
        let name .= len(name)>=fnalen? '' : repeat(' ',fnalen-len(name))
        let name = (i==tabpagenr()? "%#TabLineSel#" : "%#TabLine#") . name
        "
        " you could get any information you want about buffer by "getbufinfo()"
        let name = i . ' ' . name
        let moded = 0
        for j in buflist
            let bufinfo = getbufinfo(j)[0]
            if bufinfo["changed"]
                let moded = 1
                break
            endif
        endfor
        let name = "%#TabLineInfo#" . (moded?"[+] ":"    ") . name
        let tabLineStr .= name
    endfor
    let tabLineStr .= "%#TabLineFill#%=%{strftime(\"%T\")}"
    return tabLineStr
endfunction

function _TAB_NEXT_()
    if(tabpagenr('$')==1)
        " tabnew
        tab vsplit
    else
        if(v:count==0)
            " tabprevious
            tabnext
        else
            " gt
            " calculate the tabpage number at the end:
            " let jump = (tabpagenr()+v:count)%tabpagenr('$')
            " let jump = jump==0?tabpagenr('$'):jump
            " execute jump . "tabnext"
            execute v:count . "tabnext"
        endif
    endif
endfunction

function FCITX_ZH2EN()
    " only for fcitx
    " change input method automatically
    if $USER=='syx' && $DISPLAY != ''
        let fcitx_status = system("fcitx-remote")
        if fcitx_status[0]=='2'
            call system("fcitx-remote -c")
        endif
    endif
endfunction

" AUTOCMD:------------------------------------------------------------

augroup _MY_OWN_DEFINE_
    " autocmd!  -->clear the autocmd had been defined before
    " the current augroup before the current command
    autocmd!
    " autocmd OptionSet insertmode  call _MY_OWN_KEY_MAP_INSERTMODE_()
    " updatetime->CursorHoldI
    " help insert.txt change.txt
    autocmd CursorHoldI * stopinsert
    autocmd InsertLeave * call FCITX_ZH2EN()
    " 'normal' consider keymap but 'normal!' not
    autocmd BufReadPost * if line("'\"") <= line("$")
                \| execute "normal! g`\"" | endif
    autocmd BufReadPost *.c,*.cpp,*.py,*m,*sh,*.vim,*.v
                \ if ! &readonly | execute '%s/^\s\+$//ge' | endif
    autocmd BufEnter * call _FILETYPE_SET_REGISTER_()
    " autocmd BufWritePost * if $USER == 'me' | mkview | endif
    " autocmd BufReadPost * if @% != '' && $USER == 'me' | loadview | endif
    " autocmd CursorHold * redraw
augroup end

" COMMAND:------------------------------------------------------------

" help usr_41.txt
if exists("s:_command_exists")
    delcommand Vlsplit
    delcommand Vrsplit

    delfunction _VsplitFunction_
endif

" help function-argument
" help command-complete cmdline-completion
" help 40.2
" -nargs = x : just supply a number of x arguments
" help <f-args> <args>
" command -complete=file -nargs=* LS !ls --color=auto
command -complete=file -nargs=* Vlsplit :<C-u>call _VsplitFunction_("l",<f-args>)
command -complete=file -nargs=* Vrsplit :<C-u>call _VsplitFunction_("r",<f-args>)
function _VsplitFunction_(direction, ... )
    if a:direction != "l" && a:direction != "r"
        echoerr "Direction have no effect!"
        return
    endif
    if a:0 == 0
        if a:direction == "l"
            vsplit
        elseif a:direction == "r"
            vertical rightbelow vsplit
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

let s:_command_exists=0

" PLUGIN:-------------------------------------------------------------

" Principle of Comment : help call
" :[range]call function() could accept [range] as same as map [range]:
" it will call func every line, but
" function funName() range will only affect one line
" function _COMMENT_() [range]
"     call setline(".","// " . getline("."))
" endfunction
" noremap <Leader>d :<C-u>call _COMMENT_() <CR>

" Plugin : NERDCommment
" could not use <C-u> for number is needed
noremap <Leader>d :call NERDComment("n","Toggle") <CR>
" it could use a beautiful(or sexy) comment style in C like:
" /*
"  * text
"  */
" noremap <Leader>c :call NERDComment("n","Sexy") <CR>
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_c = 1
" function: extend()
" or change like next line:
let g:NERDAltDelims_python = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCreateDefaultMappings = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 0
" flex bison
" let g:NERDCustomDelimiters = {'lex': { 'left': ' /**', 'right': '*/' } }

" Plugin : auto-pairs
" Affected Char : \' \" ( [ {
" Needed Function :(<insert>) (<BS>) (<SPACE>) (<indent>)

" COMMENT:------------------------------------------------------------

" COLOR:
" Black White
" DarkRed Red
" DarkYellow Yellow
" DarkGreen Green
" DarkBlue Blue
" DarkCyan Cyan
" DarkMagenta Magenta
" DarkGrey Grey

