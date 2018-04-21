#!/bin/bash
# autoinstallcgicc.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 六 4月 21 19:01:41 2018 (+0800)
# Last-Updated: 六 4月 21 19:09:07 2018 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 1
# URL: http://wuhongyi.cn 

cgiccname="cgicc-3.2.19"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${cgiccname}.tar.gz

wget ftp://ftp.gnu.org/gnu/cgicc/${cgiccname}.tar.gz

if [ ! -f "${cgiccname}.tar.gz" ]; then
    echo "文件 ${cgiccname}.tar.gz 未下载成功"
    exit 1
fi


num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${cgiccname}.tar.gz
cd ${cgiccname}

./configure --prefix=/usr
make -j$num
make install
cd ..
rm -rf ${cgiccname}



# 
# autoinstallcgicc.sh ends here
