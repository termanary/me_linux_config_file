#acpi : the power of the system
#alsamixer : the sound of system

# git/svn
# bash/zsh
# gcc/g++ -> clang/clang++

#PS1='\u@\h:\w$ '

bind -x '"\ev":vim '
bind -x '"\eh":htop'
bind -x '"\ez":zsh'
# bind -x '"\em":/home/me/.vim/findfile.py'
# bind -s '"\ea":"\C-asudo\C-e"'

#echo $PATH
# env :all variable
export EDITOR=/usr/local/bin/vim
# could not add '/' at the end of path
export PYTHONSTARTUP=~/.pythonstartup
export PYTHONPATH=.:$PYTHONPATH
export HISTSIZE=100000
export HISTTIMEFORMAT="%F %T "
export HISTFILESIZE=1000000
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:\
/media/MATLAB/Matlab_R2018a/bin:\
/media/MatheMatica/MatheMatica_11_3_0/Executables:\
"

#it's necessary 
alias grep='grep --color=auto -E --binary-files=without-match '
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='ls --color=auto '
alias la='ls -A --color=auto '
alias lh='ls -lh --color=auto '
alias info='info --vi-keys'

alias c.='cd ../;ls'
alias cs='cd ~/script/;ls'
alias ca='cd ~/Acm/Tmp/;ls'
alias ch='cd ~/hdoj/tmp/;ls'
alias ck='cd ~/poj/tmp/;ls'

alias df='df -h '
alias du='du -h '
alias free='free -h '
# alias less='less -N'

alias rm='rm -v '
alias cp='cp -iv '
alias mv='mv -iv '

alias p='python3'
# yacas : another computer algebra system different from sympy
alias sym="python3 -i -E -c \"from sympy import * ; x,y,z=symbols('x y z') ; print('x,y,z has been defined\n')\" "
alias e='emacs -nw'
alias s='screen '
alias gdb='gdbtui '
#octave-cli octave -q
alias o='octave-cli'
alias matlab='matlab -nosplash -nodesktop '
alias vi="vim --clean "

#copy from stackoverflow
#g () { emacs --eval "(insert \"autocmd\") " ; }
gd () { emacs --eval "(gdb \"gdb -i=mi $*\")" ; }

#a bash function
#argument could get like this:
v ()
{
    if [ $# -gt 2 ]
    then
        vim $*
    elif [ $# -le 2 ]
    then
        vim -O $*
    else
        echo 'ERROR'
    fi
}

tm ()
{
    if [ $# -eq 0 ]
    then
        echo "Argument Needed!"
    elif [ $# -gt 1 ]
    then
        echo "Too many argument!"
    else
        if [ $1 == "c" ]
        then
            touch main.c input.tst
            if ! [ -s "main.c" ]
            then
                echo -e "#include<stdio.h>\n\nint main(void)\
\n{\n    return 0;\n}\n" > main.c
            fi
        elif [ $1 == "p" ]
        then
            touch main.cpp input.tst
            if ! [ -s "main.cpp" ]
            then
                echo -e "#include<cstdio>\n\nusing namespace std;\n\n\
int main(void)\n{\n    return 0;\n}\n" > main.cpp
            fi
        else
            echo "Do not know the argument!"
        fi
    fi
}


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

