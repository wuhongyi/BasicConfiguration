#!/bin/bash
# auto.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:06:13 2017 (+0800)
# Last-Updated: 五 4月 27 14:07:08 2018 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 19
# URL: http://wuhongyi.cn 


if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi


rm -rf ScientificLinuxYumSet/
git clone https://github.com/wuhongyi/ScientificLinuxYumSet.git

cp -f ScientificLinuxYumSet/sl6/yum.repos.d/*  /etc/yum.repos.d/
rm -rf ScientificLinuxYumSet/


#emacs
yum -y install giflib-devel.x86_64  giflib-utils.x86_64

#gcc
yum -y install glibc-static libstdc++-static


## -----------------------------------------------------------------------------

## 常用必需

#汉化包，缺少将导致有些软件为英文界面，例如kate
yum -y install kde-l10n-Chinese.noarch  kde-l10n-Chinese-Traditional.noarch

#多机并行（有空再测试G4的多机并行）
yum -y install mpich.x86_64 mpich-devel.x86_64

#压缩解压缩.rar文件
yum -y install rar.x86_64

#打开ntfs格式硬盘
yum -y install findntfs.x86_64 ntfs-3g.x86_64 ntfs-3g-devel.x86_64

#flash播放
yum -y install flash-plugin.x86_64

# nfs文件共享
yum -y install nfs-utils portmap

#数据恢复
yum -y install extundelete.x86_64

##realpath
yum -y install realpath.x86_64
## -----------------------------------------------------------------------------

## 额外功能（根据需要选择安装）

#clang编译器
# yum -y install clang.x86_64 clang-devel.x86_64

#shell脚本加密
# yum -y install shc.x86_64

#htop
yum -y install htop.x86_64

#加快显示网页的latex数学公式
# yum -y install mathjax.noarch

#markdown转pdf
# yum -y install pandoc.x86_64

#文件编码转换
# yum -y install convmv.noarch

## -----------------------------------------------------------------------------

#ROOT

yum -y install fftw.x86_64 fftw-devel.x86_64 fftw-libs.x86_64
yum -y install ruby.x86_64 ruby-devel.x86_64 ruby-libs.x86_64
yum -y install pythia8.x86_64 pythia8-devel.x86_64
yum -y install R.x86_64
yum -y install R-RInside.x86_64 R-RInside-devel.x86_64 R-Rcpp.x86_64 R-Rcpp-devel.x86_64
yum -y install unuran.x86_64 unuran-devel.x86_64

yum -y install gsl.x86_64 gsl-devel.x86_64
yum -y install graphviz.x86_64 graphviz-devel.x86_64
yum -y install expect.x86_64 expect-devel.x86_64
yum -y install davix.x86_64 davix-devel.x86_64
yum -y install avahi-compat-libdns_sd.x86_64 avahi-compat-libdns_sd-devel.x86_64
yum -y install ftgl.x86_64 ftgl-devel.x86_64
yum -y install glew.x86_64 glew-devel.x86_64
yum -y install mysql++.x86_64 mysql++-devel.x86_64
yum -y install cfitsio.x86_64 cfitsio-devel.x86_64
yum -y install libxml2*
yum -y install binutils-devel.x86_64


#Geant4
yum -y install xerces-c.x86_64  xerces-c-devel.x86_64




# 
# auto.sh ends here
