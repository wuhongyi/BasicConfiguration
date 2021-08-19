#!/bin/bash
## installapt.sh --- 
## 
## Description: 
## Author: Hongyi Wu(吴鸿毅)
## Email: wuhongyi@qq.com 
## Created: 四 8月 19 15:17:20 2021 (+0800)
## Last-Updated: 四 8月 19 15:20:47 2021 (+0800)
##           By: Hongyi Wu(吴鸿毅)
##     Update #: 3
## URL: http://wuhongyi.cn 

apt -y install net-tools openssh-server iotop iftop htop rar minicom git shc screen environment-modules apache2
apt -y install emacs gcc gfortran g++ cmake qt5-default qtcreator gnuplot texlive texlive-xetex python3-pip jupyter libminizip1


apt -y install dpkg-dev binutils libx11-dev libxpm-dev libxft-dev libxext-dev python libssl-dev

apt -y install libpcre3-dev xlibmesa-glu-dev libglew-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev libgraphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev libxml2-dev libkrb5-dev libgsl-dev 

apt -y install libxerces-c3.2 libxerces-c-dev libxmu-headers libxmu-dev libmotif-dev

apt -y install libreadline-dev libgtk-3-dev libgtk2.0-dev install xfonts-75dpi xfonts-100dpi

apt -y install freeglut3-dev freeglut3 libsdl2-dev libsdl2-image-dev libglm-dev

apt -y install libncurses5



wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1.2_amd64.deb
dpkg -i multiarch-support_2.27-3ubuntu1.2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libx/libxp/libxp6_1.0.2-1ubuntu1_amd64.deb
dpkg -i libxp6_1.0.2-1ubuntu1_amd64.deb
ln -s /usr/lib/x86_64-linux-gnu/libXp.so.6 /usr/lib/x86_64-linux-gnu/libXp.so


apt --fix-broken install
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
dpkg -i teamviewer_amd64.deb


## 
## installapt.sh ends here
