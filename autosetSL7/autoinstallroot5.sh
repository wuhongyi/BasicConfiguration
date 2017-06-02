#!/bin/bash
# autoinstallroot5.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 13:00:02 2017 (+0800)
# Last-Updated: 五 6月  2 15:27:47 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 8
# URL: http://wuhongyi.cn -->

filename="root_v5.34.36"
pathinstall="/opt"

# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

name=`expr $filename | sed 's/_v//g' | sed 's/\.//g'` #去除_v .
buildname="build$name"

rm -f ${filename}.source.tar.gz
wget https://root.cern.ch/download/${filename}.source.tar.gz

if [ ! -f "${filename}.source.tar.gz" ]; then
    echo "文件 ${filename}.source.tar.gz 未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${filename}.source.tar.gz
mv root $filename
mkdir $buildname
cd $buildname
cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -Dall=ON  ../$filename
make -j$num
make install
cd ../
rm -rf $buildname
rm -rf $filename

echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本ROOT请将 source ${pathinstall}/$name/bin/thisroot.sh  添加进 .bashrc "

# 
# autoinstallroot5.sh ends here
