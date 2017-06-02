#!/bin/bash
# autoinstallgcc.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:50:17 2017 (+0800)
# Last-Updated: 五 6月  2 10:57:12 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 2
# URL: http://wuhongyi.cn -->

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

if [ ! -f "gcc-4.9.2.tar.gz" ]; then
    echo "文件 gcc-4.9.2.tar.gz 不存在"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf gcc-4.9.2.tar.gz
cd gcc-4.9.2
./contrib/download_prerequisites #自动编译下载所需文件
./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --enable-checking=release  --enable-languages=c,c++,fortran --disable-multilib
make -j$num
make install
cd ..
rm -rf gcc-4.9.2

# 
# autoinstallgcc.sh ends here
