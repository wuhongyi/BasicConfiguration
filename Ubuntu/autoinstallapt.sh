#!/bin/bash
## autoinstallapt.sh --- 
## 
## Description: 
## Author: Hongyi Wu(吴鸿毅)
## Email: wuhongyi@qq.com 
## Created: 四 8月 19 15:17:20 2021 (+0800)
## Last-Updated: 六 8月 17 15:58:05 2024 (+0800)
##           By: Hongyi Wu(吴鸿毅)
##     Update #: 58
## URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi


VERSION=`lsb_release -r`
echo "$VERSION"

apt-get update
apt --fix-broken install
apt -y autoremove

apt -y install net-tools openssh-server curl iotop iftop htop rar minicom git shc screen environment-modules apache2

apt -y install emacs gcc gfortran g++ cmake qtcreator gnuplot texlive texlive-xetex python3-pip jupyter libminizip1 ipython3 openjdk-8-jdk

if [ "$VERSION" = "Release:	20.04" ] ; then 
    echo "当前为Ubuntu 20.04"
    apt -y install qt5-default libqt5webkit5-dev libqt5webengine5 qtwebengine5-dev libqt5webenginecore5 libqt5webenginewidgets5 libqt5webengine-data libqt5webchannel5-dev libqt5websockets5-dev libqt5websockets5 libqt5webview5-dev libqt5webview5 libqt5charts5-dev
    apt -y install python python-dev
elif [ "$VERSION" = "Release:	22.04" ] ; then
    echo "当前为Ubuntu 22.04"
    ## Ubuntu2204
   apt -y install libqt5webkit5-dev libqt5webengine5 qtwebengine5-dev libqt5webenginecore5 libqt5webenginewidgets5 libqt5webengine-data libqt5webchannel5-dev libqt5websockets5-dev libqt5websockets5 libqt5webview5-dev libqt5webview5 libqt5charts5-dev
   apt -y install python3 python3-dev
elif [ "$VERSION" = "Release:	24.04" ] ; then
    echo "当前为Ubuntu 24.04"
    ## Ubuntu2404
   apt -y install libqt5webkit5-dev libqt5webengine5 qtwebengine5-dev libqt5webenginecore5 libqt5webenginewidgets5 libqt5webengine-data libqt5webchannel5-dev libqt5websockets5-dev libqt5websockets5 libqt5webview5-dev libqt5webview5 libqt5charts5-dev
   apt -y install python3 python3-dev
   apt -y install python-dev-is-python3
elif [ "$VERSION" = "Release:	18.04" ] ; then
    echo "当前为Ubuntu 18.04"
    apt -y install qt5-default libqt5webkit5-dev libqt5webengine5 qtwebengine5-dev libqt5webenginecore5 libqt5webenginewidgets5 libqt5webengine-data libqt5webchannel5-dev libqt5websockets5-dev libqt5websockets5 libqt5webview5-dev libqt5webview5 libqt5charts5-dev
    apt -y install python python-dev
else 
    echo "暂时不支持当前版本Ubuntu，请联系吴鸿毅。"
    exit 1
fi



#摄像头
apt -y install qtmultimedia5-dev

apt -y install kate

apt -y install dpkg-dev binutils libx11-dev libxpm-dev libxft-dev libxext-dev libssl-dev openssl doxygen doxygen-latex doxygen-gui graphviz


apt -y install libftgl-dev

apt -y install libpcre3-dev xlibmesa-glu-dev libglew-dev  libmysqlclient-dev libfftw3-dev libcfitsio-dev libgraphviz-dev libavahi-compat-libdnssd-dev libldap2-dev libxml2-dev libkrb5-dev libgsl-dev mysql-server libmysqlclient-dev libfcgi-bin libfcgi-dev libsqlite3-dev  davix-dev davix

apt -y install python3-numpy

apt -y install libxerces-c3.2 libxerces-c-dev libxmu-headers libxmu-dev libmotif-dev

apt -y install libreadline-dev libgtk-3-dev libgtk2.0-dev xfonts-75dpi xfonts-100dpi


if [ "$VERSION" = "Release:	20.04" ] ; then 
    apt -y install freeglut3-dev freeglut3
    apt -y install libncurses5 libncurses5-dev libcanberra-gtk-module
elif [ "$VERSION" = "Release:	22.04" ] ; then
    apt -y install freeglut3-dev freeglut3
    apt -y install libncurses5 libncurses5-dev libcanberra-gtk-module
elif [ "$VERSION" = "Release:	24.04" ] ; then
    apt -y install freeglut3-dev
    apt -y install libncurses-dev libcanberra-gtk-module
elif [ "$VERSION" = "Release:	18.04" ] ; then
    apt -y install freeglut3-dev freeglut3
    apt -y install libncurses5 libncurses5-dev libcanberra-gtk-module
else 
    echo "暂时不支持当前版本Ubuntu，请联系吴鸿毅。"
    exit 1
fi

apt -y install  libsdl2-dev libsdl2-image-dev libglm-dev

apt -y install ffmpeg libsdl1.2-dev

##DAQ
apt -y install libboost-dev libboost-all-dev libzmq3-dev

#qwt
apt -y install libqwt-headers libqwt-qt5-dev

apt -y install libminizip1


# opencv
apt -y install libopencv-dev

apt --fix-broken install

#wget http://archive.ubuntu.com/ubuntu/pool/main/g/glibc/multiarch-support_2.27-3ubuntu1.6_amd64.deb
#dpkg -i multiarch-support_2.27-3ubuntu1.6_amd64.deb

apt -y install multiarch-support

#wget http://archive.ubuntu.com/ubuntu/pool/main/libx/libxp/libxp6_1.0.2-1ubuntu1_amd64.deb
#dpkg -i libxp6_1.0.2-1ubuntu1_amd64.deb
#ln -s /usr/lib/x86_64-linux-gnu/libXp.so.6 /usr/lib/x86_64-linux-gnu/libXp.so
apt -y install libxp6


#ausa
#apt -y install libfmt-dev rapidjson-dev




apt --fix-broken install
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
dpkg -i teamviewer_amd64.deb


if [ "$VERSION" = "Release:	20.04" ] ; then 
    echo "当前为Ubuntu 20.04"
    ## Ubuntu2004
    pip3 install metakernel zmq Markdown voila jupyterlab jupyter
    pip3 install sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs
elif [ "$VERSION" = "Release:	22.04" ] ; then
    echo "当前为Ubuntu 22.04"
    ## Ubuntu2204
    pip3 install metakernel zmq Markdown voila jupyterlab jupyter
    pip3 install sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs
elif [ "$VERSION" = "Release:	24.04" ] ; then
    echo "当前为Ubuntu 24.04"
    ## Ubuntu2404
    
elif [ "$VERSION" = "Release:	18.04" ] ; then
    echo "当前为Ubuntu 18.04"
    ## Ubuntu1804
    pip3 install metakernel zmq Markdown voila jupyterlab jupyter
    pip3 install sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs
else 
    echo "暂时不支持当前版本Ubuntu，请联系吴鸿毅。"
    #exit 1
fi

# apt -y install freecad

# shadowsocks-libev

## 
## autoinstallapt.sh ends here
