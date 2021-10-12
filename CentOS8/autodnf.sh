#!/bin/bash
# autodnf.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 二 10月 12 16:54:11 2021 (+0800)
# Last-Updated: 二 10月 12 20:34:39 2021 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 8
# URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi


dnf -y install epel-release

dnf -y install emacs screen.x86_64 minicom.x86_64 ntfs-3g.x86_64 ntfs-3g-devel.x86_64 gnuplot.x86_64 gnuplot-common.x86_64

dnf -y install zeromq.x86_64 zeromq-devel.x86_64 cppzmq-devel.x86_64 czmq.x86_64 czmq-devel.x86_64

dnf -y install qt5-qtwebkit.x86_64 qt5-qtwebkit-devel.x86_64 qt5-qtquickcontrols.x86_64 qt5-qtx11extras.x86_64 qt5-qtx11extras-devel.x86_64 harfbuzz-devel.x86_64 freetype-devel.x86_64

dnf -y install shc.x86_64 htop.x86_64 iftop.x86_64 texlive.x86_64


dnf -y install fftw.x86_64  fftw-devel.x86_64 gsl.x86_64 gsl-devel.x86_64 ruby.x86_64 ruby-devel.x86_64 davix.x86_64 davix-devel.x86_64 unuran.x86_64 unuran-devel.x86_64 ftgl.x86_64 ftgl-devel.x86_64 cfitsio.x86_64 cfitsio-devel.x86_64 libxml2.x86_64 libxml2-devel.x86_64 binutils.x86_64 binutils-devel.x86_64 pythia8.x86_64 pythia8-devel.x86_64 gfal2.x86_64  gfal2-devel.x86_64 xrootd.x86_64 xrootd-client.x86_64 xrootd-client-devel.x86_64 xrootd-devel.x86_64 libXpm-devel.x86_64 libXft-devel.x86_64 libXext-devel.x86_64



dnf -y install xerces-c.x86_64 xerces-c-devel.x86_64

wget https://repo.mysql.com//mysql80-community-release-el8-1.noarch.rpm
rpm -ivh mysql80-community-release-el8-1.noarch.rpm
dnf -y install mysql-server
dnf -y install mysql-devel.x86_64


pip3 install  -i http://pypi.douban.com/simple --trusted-host pypi.douban.com --upgrade pip
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter==1.0.0
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com metakernel
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com zmq
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com Markdown
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyterlab
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com voila
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com Django
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com shell qdarkstyle pandas pandas-datareader BeautifulSoup4 selenium


# 
# autodnf.sh ends here
