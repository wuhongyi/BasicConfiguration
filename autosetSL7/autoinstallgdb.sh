#!/bin/bash
# autoinstallgdb.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:42:05 2017 (+0800)
# Last-Updated: 五 6月  2 10:52:56 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 2
# URL: http://wuhongyi.cn -->

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

if [ ! -f "gdb-7.11.1.tar.gz" ]; then
    echo "文件 gdb-7.11.1.tar.gz 不存在"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf gdb-7.11.1.tar.gz
cd gdb-7.11.1
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf gdb-7.11.1


# 
# autoinstallgdb.sh ends here
