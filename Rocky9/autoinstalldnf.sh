#!/bin/bash
# autoinstalldnf.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 二 10月 12 16:54:11 2021 (+0800)
# Last-Updated: 五 11月  5 20:33:47 2021 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 14
# URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

dnf -y install emacs


pip3 install metakernel zmq Markdown voila jupyterlab jupyter
pip3 install sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs


dnf -y install  fftw.x86_64  fftw-devel.x86_64 gsl.x86_64 gsl-devel.x86_64 ruby.x86_64 ruby-devel.x86_64 davix.x86_64 davix-devel.x86_64 unuran.x86_64 unuran-devel.x86_64 ftgl.x86_64 ftgl-devel.x86_64 cfitsio.x86_64 cfitsio-devel.x86_64 libxml2.x86_64 libxml2-devel.x86_64 binutils.x86_64 binutils-devel.x86_64 pythia8.x86_64 pythia8-devel.x86_64 gfal2.x86_64  gfal2-devel.x86_64 xrootd.x86_64 xrootd-client.x86_64 xrootd-client-devel.x86_64 xrootd-devel.x86_64 libXpm-devel.x86_64 libXft-devel.x86_64 libXext-devel.x86_64 readline.x86_64 readline-devel.x86_64

dnf -y install xerces-c.x86_64 xerces-c-devel.x86_64 libXmu.x86_64  libXmu-devel.x86_64 motif.x86_64 motif-devel.x86_64 mesa* freeglut*

dnf -y install qt5-qtwebkit.x86_64 qt5-qtwebkit-devel.x86_64 qt5-qtquickcontrols.x86_64 qt5-qtx11extras.x86_64 qt5-qtx11extras-devel.x86_64 qt5-qtwebengine.x86_64 qt5-qtwebengine-devel.x86_64  qt5-qtwebengine-devtools.x86_64 qt5-qtwebsockets.x86_64 qt5-qtwebsockets-devel.x86_64 qt5-qtwebview.x86_64 qt5-qtwebview-devel.x86_64 harfbuzz-devel.x86_64 freetype-devel.x86_64 gtk2-devel.x86_64 gtk3-devel.x86_64




# 
# autoinstalldnf.sh ends here
