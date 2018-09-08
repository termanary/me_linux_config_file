#acpi : the power of the system
#alsamixer : the sound of system

alias pr='touch main.c input.tst'

#PS1='\u@\h:\w$ '

bind -x '"\ev":vim '
bind -x '"\eh":htop'

#echo $PATH
# env :all variable
export EDITOR=/usr/local/bin/vim
export PATH="$PATH:/media/MATLAB/Matlab_2018a/bin/"
export PYTHONSTARTUP=~/.pythonstartup
export HISTSIZE=100000
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#it's necessary 
alias grep='grep --color=auto -E '
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
alias less='less -N'

alias rm='rm -v '
alias cp='cp -iv '
alias mv='mv -iv '

alias p='python3 '
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


