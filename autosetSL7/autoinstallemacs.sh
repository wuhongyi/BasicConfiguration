#!/bin/bash
# autoinstallemacs.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:13:19 2017 (+0800)
# Last-Updated: 五 6月  2 10:52:37 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 7
# URL: http://wuhongyi.cn -->

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

if [ ! -f "emacs-24.5.tar.gz" ]; then
    echo "文件 emacs-24.5.tar.gz 不存在"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf emacs-24.5.tar.gz
cd emacs-24.5
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf emacs-24.5

# 
# autoinstallemacs.sh ends here
