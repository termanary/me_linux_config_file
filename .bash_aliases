#acpi : the power of the system
#alsamixer : the sound of system

#PS1='\u@\h:\w$ '

bind -x '"\ev":vim '
bind -x '"\eh":htop'

#echo $PATH
# env :all variable
export EDITOR=/usr/local/bin/vim
# could not add '/' at the end of path
export PATH="$PATH:/media/MATLAB/Matlab_2018a/bin:/media/MatheMatica/MatheMatica_11.3.0_LINUX/Executables"
export PYTHONSTARTUP=~/.pythonstartup
export PYTHONPATH=.:$PYTHONPATH
export HISTSIZE=10000
export HISTTIMEFORMAT="%F %T "
export HISTFILESIZE=1000000
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
alias sym="python3 -i -E -c \"from sympy import * ; x,y,z=symbols('x y z') ; print('x,y,z has been defined\n')\" "
alias e='emacs -nw'
alias s='screen '
alias gdb='gdbtui '
#octave-cli octave -q
alias o='octave-cli'
alias matlab='matlab -nosplash -nodesktop '

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

pr ()
{
    touch main.c input.tst
    echo -e "#include<stdio.h>\n\n\
int main(void)\n\
{\n\
    return 0;\n\
}\n" >> main.c
}


