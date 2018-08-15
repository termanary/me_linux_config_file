#alsamixer : the sound of system
#acpi : the power of the system

bind -x '"\ev":vim '
bind -x '"\eh":htop'

#echo $PATH
export EDITOR=/usr/bin/vim
export PATH="$PATH:/media/MATLAB/Matlab_2018a/bin/"
#export PATH="$PATH:$HOME/Bin/"

HISTSIZE=100000

LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

alias l='ls --color=auto '
alias la='ls -A --color=auto '
alias lh='ls -lh --color=auto '
alias info='info --vi-keys'

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
#octave-cli octave -q
alias octave='octave-cli --silent'
alias o='octave-cli'
alias matlab='matlab -nosplash -nodesktop '

