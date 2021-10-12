#!/bin/bash
# autoinstallroot624.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 四 4月 19 19:41:34 2018 (+0800)
# Last-Updated: 日 10月  3 23:47:15 2021 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 15
# URL: http://wuhongyi.cn 

filename="root_v6.24.02"
pathinstall="/opt/ROOT"

# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

name=`expr $filename | sed 's/_v//g' | sed 's/\.//g'` #去除_v .
filename2=`expr $filename | sed 's/_v/-/g'`
buildname="build$name"

rm -f ${filename}.source.tar.gz
wget https://root.cern.ch/download/${filename}.source.tar.gz

if [ ! -f "${filename}.source.tar.gz" ]; then
    echo "文件 ${filename}.source.tar.gz 未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${filename}.source.tar.gz
mkdir $buildname
cd $buildname

# clad    requires network(github)
# sed -i "s/https:\/\/github.com\//git@github.com:/g" `grep "https://github.com/" -rl ../$filename2/interpreter/cling/tools/plugins/clad/`

#https://root.cern/install/build_from_source/

cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -Dqt5web=ON -Dwebgui=ON -Droot7=ON -Dfcgi=ON -Dgviz=ON -Dminuit2=ON  ../$filename2


make -j$num
make install
cd ../
rm -rf $buildname
rm -rf $filename2


echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本ROOT请将 source ${pathinstall}/$name/bin/thisroot.sh  添加进 .bashrc "

# 
# autoinstallroot624.sh ends here
