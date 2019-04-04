#!/bin/bash -v
# run it when you reinstall system

error_occur()
{
    if [ $? -ne 0 ] ; then
      exit
    fi
}

sudo apt install pppoeconf 
#sudo pppoeconf
# sudo service networking restart
# ??? :
# sudo echo "ipv6 ," >> /etc/ppp/options

wget https://github.com/termanary/me_linux_config_file/archive/master.zip 
unzip master.zip 

# language
sudo dpkg-reconfigure locales  
sudo apt install mate-desktop-environment lightdm
sudo systemctl set-default multi-user.target 

# ???
# sudo apt install openjdk-8-jdk

sudo apt install \
zsh gcc g++ gdb \
iverilog gtkwave \
htop emacs screen \
qbittorrent evince \
gimp audacity wesnoth \

sudo apt install python-pip python3-pip 
sudo python3 -m pip install cyaron
error_occur
sudo python3 -m pip install sympy
error_occur
sudo python3 -m pip install numpy
error_occur
sudo python3 -m pip install numba
error_occur
sudo python3 -m pip install ipython
error_occur
sudo python3 -m pip install pudb
error_occur
sudo python -m pip install sympy 
error_occur

sudo apt install fcitx-table-wbpy gnome-disk-utility 
# the sound of firefox :
sudo apt install pulseaudio 
# plot for octave
sudo apt install gnuplot-x11 

sudo adduser me
sudo adduser guest
sudo addgroup me MATLAB
sudo addgroup syx MATLAB
sudo chsh -s /usr/bin/zsh me

# ----------------------------------------------------------------------

# sudo dpkg -i /media/Altera_Quartus_2/libpng12-0_1.2.50-1ubuntu2.14.04.3_amd64.deb

# sudo cp -r /media/syx/*/me/ /home/me
# sudo chown -R me:me /home/me/me/

# sudo cp -r /media/syx/*/syx/ /home/syx
# sudo chown -R syx:syx /home/syx/syx/

# sudo cp -r ~/download/firefox/firefox/ /opt/
# sudo apt install xdg-utils
# sudo dpkg -i ~/download/wps/wps-office_10.1.0.6757_amd64.deb
# sudo apt install libqt5opengl5 libcurl3 libqt5printsupport5 libqt5x11extras5
# sudo apt install linux-headers-amd64 linux-headers-4.9.0-8-amd64
# sudo dpkg -i ~/download/virtualbox/virtualbox-5.2_5.2.22-126460~Debian~stretch_amd64.deb

# # vim compile
# sudo apt install libncurses5-dev libpython3-dev libxt-dev gawk
# cd ~/download/vim/vim-master
# rm ./src/auto/config.cache
# ./configure -enable-python3interp=dynamic
# make
# sudo make install
# # ./configure -enable-python3interp=dynamic -enable-pythoninterp=dynamic
# # -with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/
# # -with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/
# # -x-includes=/usr/include/X11
# # -x-libraries=/usr/include/X11

# cp ~/Desktop/me_linux_config_file-master.zip /tmp/
# cd /tmp/
# unzip me_linux_config_file-master.zip
# cd me_linux_config_file-master/
# if [ ! -e ~/backup ] ;then
#     mkdir ~/backup
# fi
# fstab hosts keyboard sources.list
# cp /etc/fstab /etc/hosts /etc/default/keyboard /etc/apt/sources.list ~/backup
# Warning :
# # append by wc and tail :
# # sudo cp fstab /etc/fstab
# sudo cp hosts /etc/hosts
# sudo cp keyboard /etc/default/keyboard
# sudo cp sources.list /etc/apt/sources.list
# # init.el .octaverc .pythonstartup .screenrc vimrc .zsh_aliases .gdbinit cgdbrc

# if [ ! -e /media/program ] ; then
#     sudo mkdir /media/program
#     cd /media/program
#     sudo touch main
#     sudo chown -R root:MATLAB /media/program
#     sudo chmod -R g+w /media/program
# fi

# sudo chown -R root:root /media/MATLAB/ /media/Altera_Quartus_2/
# sudo chown -R root:MATLAB /media/Torrent/

# # octave compile
# sudo apt install gfortran libblas-dev liblapack-dev libpcre3-dev libreadline-dev gnuplot-x11 
# cd ~/download/octave/octave-source/octave-4.4.1/
# ./configure
# make
# sudo make install


sudo apt install network-manager
sudo apt install openssh-server 
sudo /etc/init.d/ssh start 
apt search gcc-mips 
sudo apt install gcc-mips-linux-gnu 
