#!/bin/bash
# autoinstallgcc7.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 四 4月 19 19:33:31 2018 (+0800)
# Last-Updated: 五 4月 26 20:30:43 2024 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 2
# URL: http://wuhongyi.cn 

gccfilename="gcc-11.4.0"

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
./configure --prefix=/opt/GCC/11.4.0 --mandir=/opt/GCC/11.4.0/share/man --infodir=/opt/GCC/11.4.0/share/info --enable-checking=release  --enable-languages=c,c++,fortran --disable-multilib
make -j$num
make install
cd ..
rm -rf ${gccfilename}

#rm -f /lib64/libstdc++.so.6.0.20-gdb.py

# 
# autoinstallgcc7.sh ends here
