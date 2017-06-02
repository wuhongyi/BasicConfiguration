#!/bin/bash
# autoinstallcmake.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:45:15 2017 (+0800)
# Last-Updated: 五 6月  2 10:52:48 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 3
# URL: http://wuhongyi.cn -->

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

if [ ! -f "cmake-3.7.2.tar.gz" ]; then
    echo "文件 cmake-3.7.2.tar.gz 不存在"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf cmake-3.7.2.tar.gz
cd cmake-3.7.2
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf cmake-3.7.2

# 
# autoinstallcmake.sh ends here
