<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 17 21:37:37 2021 (+0800)
;; Last-Updated: 三 8月 18 22:06:43 2021 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 52
;; URL: http://wuhongyi.cn -->

# README


apt -y install net-tools openssh-server iotop iftop htop rar minicom git shc screen environment-modules apache2
sudo apt -y install emacs gcc gfortran g++ cmake qt5-default qtcreator gnuplot texlive texlive-xetex python3-pip jupyter libminizip1


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


cmake -DCMAKE_INSTALL_PREFIX=/opt/root62402 -Dqt5web=ON -Dwebgui=ON -Droot7=ON -Dfcgi=ON -Dgviz=ON -Dminuit2=ON ../root-6.24.02/


https://blog.csdn.net/weixin_35804181/article/details/71224294


https://pinyin.sogou.com/linux/help.php

https://blog.csdn.net/u012787602/article/details/79611095



https://www.cnblogs.com/rainy0426/articles/12790686.html
source /usr/share/modules/init/sh


echo $MODULEPATH

建议 /etc/environment-modules/modules


apache cgi
https://www.freesion.com/article/7805709799/






安装Jtag驱动
与Windows不同的是，当你给FPGA连上Jtag线准备烧写程序的时候会发现，你的Vivado无法发现FPGA。open hardware manager 之后只能看到下图中的界面，而没有芯片信息：
原因即是没有安装Jtag线的驱动，Ubuntu需要手动安装驱动，其驱动位置在于…/(你的安装位置)/Vivado/Vivado/2017.4/data/xicom/cable_drivers/lin64/install_script/install_drivers.



Ubuntu 14以上就已经不再支持libpng12，然而有些软件又依赖于libpng12（如我要使用的Cisco Packet Tracer）。我们可以采用特定的方法安装低版本的libpng。


根据Ubuntu官网的提示，我们在其中加上 deb http://cz.archive.ubuntu.com/ubuntu xenial main
/etc/apt/source.list
然后保存，并更新package list后即可安装




<!-- README.md ends here -->
