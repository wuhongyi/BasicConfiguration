#!/bin/bash
# auto.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:06:13 2017 (+0800)
# Last-Updated: 三 6月 28 19:37:42 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 11
# URL: http://wuhongyi.cn 


if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi


rm -rf ScientificLinuxYumSet/
git clone https://github.com/wuhongyi/ScientificLinuxYumSet.git

cp -f ScientificLinuxYumSet/sl7/yum.repos.d/*  /etc/yum.repos.d/
rm -rf ScientificLinuxYumSet/


#EPEL提供的一个yum插件。使用该插件后用yum安装软件时可以并行下载，大大提高了软件的下载速度，减少了下载的等待时间。安装该插件的同时会安装另一个软件axel。axel是一个并行下载工具，在下载http、ftp等简单协议的文件时非常好用。
yum -y install yum-axelget

#dnf
yum -y install dnf

#emacs
yum -y install giflib-devel.x86_64  giflib-utils.x86_64

#gcc
yum -y install glibc-static libstdc++-static


## -----------------------------------------------------------------------------

## 常用必需

#多机并行（有空再测试G4的多机并行）
yum -y install mpich.x86_64 mpich-devel.x86_64
yum -y install mpich-3.0.x86_64 mpich-3.0-devel.x86_64 mpich-3.2.x86_64 mpich-3.2-devel.x86_64

#汉化包，缺少将导致有些软件为英文界面，例如kate
yum -y install kde-l10n-Chinese.noarch  kde-l10n-Chinese-Traditional.noarch

#screen
yum -y install screen.x86_64

# 读取写入json格式数据
yum -y install jsoncpp.x86_64 jsoncpp-devel.x86_64 

#压缩解压缩.rar文件
yum -y install rar.x86_64

#打开ntfs格式硬盘
yum -y install findntfs.x86_64 ntfs-3g.x86_64 ntfs-3g-devel.x86_64

#gnuplot
#rm -f /usr/bin/gnuplot
yum -y install gnuplot.x86_64 gnuplot-common.x86_64 gnuplot-minimal.x86_64 gnuplot-latex.noarch


#flash播放
yum -y install flash-plugin.x86_64

#minicom超级终端
yum -y install minicom.x86_64

# nfs文件共享
yum -y install -y nfs-utils rpcbind  #SL6 yum -y install -y nfs-utils portmap

#hdf5
yum -y install hdf5.x86_64  hdf5-devel.x86_64 hdf5-mpich.x86_64 hdf5-mpich-devel.x86_64  hdf5-openmpi.x86_64 hdf5-openmpi-devel.x86_64

## -----------------------------------------------------------------------------

## 额外功能（根据需要选择安装）

#elog
# yum -y install elog.x86_64

#kate编辑器
# yum -y install kate.x86_64 kate-devel.x86_64 kate-libs.x86_64 kate-part.x86_64 ghc-highlighting-kate-devel.x86_64 ghc-highlighting-kate.x86_64

#桌面录制
# yum -y install recordmydesktop.x86_64 gtk-recordmydesktop.noarch

#mp3格式文件转wav格式
# yum -y install mpg123.x86_64 mpg123-devel.x86_64 perl-Audio-Play-MPG123.noarch

#播放mp3
# yum -y install libmad.x86_64 libmad-devel.x86_64

#clang编译器
# yum -y install clang.x86_64 clang-devel.x86_64

#shell脚本加密
# yum -y install shc.x86_64

#htop
# yum -y install htop.x86_64

#npm  用于jekyll/hexo、gitbook
# yum -y install npm.noarch  nodejs.x86_64
# yum -y install rubygems-devel.noarch
# gem update --system


#加快显示网页的latex数学公式
# yum -y install mathjax.noarch

#markdown转pdf
# yum -y install pandoc.x86_64


#翻译软件，配置后可选词翻译
# yum -y install goldendict.x86_64 goldendict-docs.noarch

#okular pdf阅读器(基于KDE) 感觉没有默认的evince好
# yum -y install okular.x86_64

#文件编码转换
# yum -y install convmv.noarch

## -----------------------------------------------------------------------------

#ROOT

yum -y install fftw.x86_64 fftw-devel.x86_64 fftw-libs.x86_64
yum -y install gsl.x86_64 gsl-devel.x86_64
yum -y install graphviz.x86_64 graphviz-devel.x86_64
yum -y install ruby.x86_64 ruby-devel.x86_64 ruby-libs.x86_64
yum -y install expect.x86_64 expect-devel.x86_64
yum -y install davix.x86_64 davix-devel.x86_64
yum -y install unuran.x86_64 unuran-devel.x86_64
yum -y install avahi-compat-libdns_sd.x86_64 avahi-compat-libdns_sd-devel.x86_64
yum -y install ftgl.x86_64 ftgl-devel.x86_64
yum -y install glew.x86_64 glew-devel.x86_64
yum -y install mysql++.x86_64 mysql++-devel.x86_64
yum -y install cfitsio.x86_64 cfitsio-devel.x86_64
yum -y install libxml2*
yum -y install binutils-devel.x86_64
yum -y install pythia8.x86_64 pythia8-devel.x86_64
yum -y install redhat-lsb.x86_64
yum -y install R.x86_64
yum -y install R-RInside.x86_64 R-RInside-devel.x86_64 R-Rcpp.x86_64 R-Rcpp-devel.x86_64

#Geant4
yum -y install xerces-c.x86_64  xerces-c-devel.x86_64




# 
# auto.sh ends here
