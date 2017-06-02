#!/bin/bash
# autoinstallsoftware.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:14:48 2017 (+0800)
# Last-Updated: 五 6月  2 10:15:15 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 1
# URL: http://wuhongyi.cn 

## -----------------------------------------------------------------------------

# 下载需要安装的源代码
rm -f cmake-3.7.2.tar.gz emacs-24.5.tar.gz gcc-4.9.2.tar.gz gdb-7.11.1.tar.gz

wget https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/emacs/emacs-24.5.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/gdb/gdb-7.11.1.tar.gz

if [ ! -f "cmake-3.7.2.tar.gz" ]; then
 echo "文件 cmake-3.7.2.tar.gz 未下载成功"
fi

if [ ! -f "emacs-24.5.tar.gz" ]; then
 echo "文件 emacs-24.5.tar.gz 未下载成功"
fi

if [ ! -f "gcc-4.9.2.tar.gz" ]; then
 echo "文件 gcc-4.9.2.tar.gz 未下载成功"
fi

if [ ! -f "gdb-7.11.1.tar.gz" ]; then
 echo "文件 gdb-7.11.1.tar.gz 未下载成功"
fi

# 
# autoinstallsoftware.sh ends here
