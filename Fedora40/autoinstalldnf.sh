#!/bin/bash
# autoinstalldnf.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 二 10月 12 16:54:11 2021 (+0800)
# Last-Updated: 日 9月  8 18:38:29 2024 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 17
# URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

dnf -y install redhat-lsb-core boost boost-devel

dnf -y install emacs cmake.x86_64 screen.x86_64 minicom.x86_64 ntfs-3g.x86_64 ntfs-3g-devel.x86_64 gnuplot.x86_64 gnuplot-common.x86_64  python3-pip environment-modules.x86_64 openssl.x86_64 openssl-devel.x86_64 

dnf -y install zeromq.x86_64 zeromq-devel.x86_64 cppzmq-devel.x86_64 czmq.x86_64 czmq-devel.x86_64

dnf -y install shc.x86_64 htop.x86_64 iftop.x86_64


dnf -y install  fftw.x86_64  fftw-devel.x86_64 gsl.x86_64 gsl-devel.x86_64 ruby.x86_64 ruby-devel.x86_64 davix.x86_64 davix-devel.x86_64 unuran.x86_64 unuran-devel.x86_64 ftgl.x86_64 ftgl-devel.x86_64 cfitsio.x86_64 cfitsio-devel.x86_64 libxml2.x86_64 libxml2-devel.x86_64 binutils.x86_64 binutils-devel.x86_64 pythia8.x86_64 pythia8-devel.x86_64 gfal2.x86_64  gfal2-devel.x86_64 xrootd.x86_64 xrootd-client.x86_64 xrootd-client-devel.x86_64 xrootd-devel.x86_64 libXpm-devel.x86_64 libXft-devel.x86_64 libXext-devel.x86_64 readline.x86_64 readline-devel.x86_64

dnf -y install xerces-c.x86_64 xerces-c-devel.x86_64 libXmu.x86_64  libXmu-devel.x86_64 motif.x86_64 motif-devel.x86_64 mesa* freeglut*

dnf -y install qt5-qtwebkit.x86_64 qt5-qtwebkit-devel.x86_64 qt5-qtquickcontrols.x86_64 qt5-qtx11extras.x86_64 qt5-qtx11extras-devel.x86_64 qt5-qtwebengine.x86_64 qt5-qtwebengine-devel.x86_64  qt5-qtwebengine-devtools.x86_64 qt5-qtwebsockets.x86_64 qt5-qtwebsockets-devel.x86_64 qt5-qtwebview.x86_64 qt5-qtwebview-devel.x86_64 harfbuzz-devel.x86_64 freetype-devel.x86_64 gtk2-devel.x86_64 gtk3-devel.x86_64


pip3 install metakernel zmq Markdown voila jupyterlab jupyter
pip3 install sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs


systemctl start sshd

# 
# autoinstalldnf.sh ends here
