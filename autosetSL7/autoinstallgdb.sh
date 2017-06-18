#!/bin/bash
# autoinstallgdb.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:42:05 2017 (+0800)
# Last-Updated: 日 6月 18 13:47:51 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 5
# URL: http://wuhongyi.cn 

gdbfilename="gdb-7.11.1"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${gdbfilename}.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/gdb/${gdbfilename}.tar.gz

if [ ! -f "${gdbfilename}.tar.gz" ]; then
    echo "文件 ${gdbfilename}.tar.gz 未下载成功"
    exit 1
fi


num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${gdbfilename}.tar.gz
cd ${gdbfilename}
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf ${gdbfilename}


# 
# autoinstallgdb.sh ends here
