#!/bin/bash
# autoinstallroot6_py3root7.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 四 4月 19 19:41:34 2018 (+0800)
# Last-Updated: 六 7月  6 20:52:12 2019 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 6
# URL: http://wuhongyi.cn 

filename="root-master"
pathinstall="/opt"

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
## ROOT版本小于6.18
cmake -DCMAKE_INSTALL_PREFIX=/opt/rootmaster -DCMAKE_CXX_FLAGS=-D_GLIBCXX_USE_CXX11_ABI=0 -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib64/libpython3.6m.so -DCMAKE_CXX_STANDARD=14  -Dqt5web=ON  -Droot7=ON ../root-master
## ROOT版本大于等于6.18
# cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -DPYTHON_LIBRARY=/usr/lib64/libpython3.6m.so  -Dall=ON  ../$filename2
make -j$num
make install
cd ../
rm -rf $buildname
rm -rf $filename2


echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本ROOT请将 source ${pathinstall}/$name/bin/thisroot.sh  添加进 .bashrc "



# 
# autoinstallroot6_py3root7.sh ends here
