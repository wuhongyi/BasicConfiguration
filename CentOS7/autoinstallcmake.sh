#!/bin/bash
# autoinstallcmake.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:45:15 2017 (+0800)
# Last-Updated: 日 6月 18 13:47:15 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 6
# URL: http://wuhongyi.cn 

cmakefilename="cmake-3.7.2"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${cmakefilename}.tar.gz
vcmake=${cmakefilename%.*}
vcmake=`expr $vcmake | sed 's/cmake-/v/g'`
wget https://cmake.org/files/${vcmake}/${cmakefilename}.tar.gz

if [ ! -f "${cmakefilename}.tar.gz" ]; then
    echo "文件 ${cmakefilename}.tar.gz 未下载成功"
    exit 1
fi


num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${cmakefilename}.tar.gz
cd ${cmakefilename}
./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf ${cmakefilename}

# 
# autoinstallcmake.sh ends here
