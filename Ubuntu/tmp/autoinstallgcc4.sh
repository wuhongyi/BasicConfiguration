#!/bin/bash
# autoinstallgcc4.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:50:17 2017 (+0800)
# Last-Updated: 五 8月 20 21:03:59 2021 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 10
# URL: http://wuhongyi.cn 

gccfilename="gcc-4.9.4"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${gccfilename}.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/gcc/${gccfilename}/${gccfilename}.tar.gz

if [ ! -f "${gccfilename}.tar.gz" ]; then
    echo "文件 ${gccfilename}.tar.gz 未下载成功"
    exit 1
fi


num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${gccfilename}.tar.gz
cd ${gccfilename}
./contrib/download_prerequisites #自动编译下载所需文件
./configure --prefix=/opt/GCC/4.9.4 --mandir=/opt/GCC/4.9.4/share/man --infodir=/opt/GCC/4.9.4/share/info --enable-checking=release  --enable-languages=c,c++,fortran --disable-multilib
make -j$num
make install
cd ..
rm -rf ${gccfilename}

#rm -f /lib64/libstdc++.so.6.0.20-gdb.py

# 
# autoinstallgcc4.sh ends here
