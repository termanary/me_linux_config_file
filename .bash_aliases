
bind -x '"\ev":vim main.c'
bind -x '"\eh":htop'
#bind -x '"\et":date'
#bind -x '"\el":ls'

#echo $PATH
export PATH="$PATH:/media/MATLAB/Matlab_2018a/bin/"
export PATH="$PATH:$HOME/Bin/"
export EDITOR=/usr/bin/vim

LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

alias l='ls --color=auto '
alias la='ls -A --color=auto '
alias lh='ls -lh --color=auto '
alias info='info --vi-keys'

#alias cd='cd;ls'
alias c='cd;ls'
alias c.='cd ../;ls'
alias ca='cd ~/Tmp/acm/;ls'
alias ct='cd ~/Tmp/;ls'
alias co='cd ~/octave/tmp/;ls'
alias ch='cd ~/hdoj/tmp/;ls'
alias ck='cd ~/poj/tmp/;ls'

alias df='df -h '
alias du='du -h '
alias free='free -h '

alias rm='rm -v '
alias cp='cp -iv '
alias mv='mv -iv '

alias v='$HOME/.vim/vim.sh' 
alias e='emacs -nw'
alias s='screen '
alias gdb='gdbtui '
#alias le='/usr/share/vim/vim80/macros/less.sh'
alias le='~/Bin/less.sh'
#octave-cli octave -q
#alias octave='octave-cli --silent'
#alias oc='~/octave/octave/octave-4.4.0/run-octave '
alias o='octave-cli'
#alias scilab='scilab-cli'
alias matlab='matlab -nosplash -nodesktop '

#alsamixer : the sound of system
#acpi : the power of the system
#shutdown 2:00
