#!/bin/bash
# autoinstallroot630.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 四 4月 19 19:41:34 2018 (+0800)
# Last-Updated: 日 9月  8 14:35:04 2024 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 26
# URL: http://wuhongyi.cn 

filename="root_v6.32.04"
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


VERSION=`lsb_release -r`
echo "$VERSION"
if [ "$VERSION" = "Release:	20.04" ] ; then 
    echo "当前为Ubuntu 20.04"
    cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 -Dmathmore=ON -Dqt5web=ON -Dwebgui=ON -DCMAKE_CXX_STANDARD=17 -Dbuiltin_pcre=ON -Droot7=ON -Dfftw3=ON -Dmathmore=ON -Dfcgi=ON -Dgviz=ON  -Dxrootd=OFF ../$filename2
elif [ "$VERSION" = "Release:	22.04" ] ; then
    echo "当前为Ubuntu 22.04"
    cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.10 -Dmathmore=ON -Dqt5web=ON -Dwebgui=ON -DCMAKE_CXX_STANDARD=17 -Dbuiltin_pcre=ON -Droot7=ON -Dfftw3=ON -Dmathmore=ON -Dfcgi=ON -Dgviz=ON  -Dxrootd=OFF ../$filename2
elif [ "$VERSION" = "Release:	24.04" ] ; then
    echo "当前为Ubuntu 24.04"
    cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.12 -Dmathmore=ON -Dqt5web=ON -Dwebgui=ON -DCMAKE_CXX_STANDARD=17 -Dbuiltin_pcre=ON -Droot7=ON -Dfftw3=ON -Dmathmore=ON -Dfcgi=ON -Dgviz=ON  -Dxrootd=OFF ../$filename2    
elif [ "$VERSION" = "Release:	18.04" ] ; then
    echo "当前为Ubuntu 18.04"
    cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/${name} -DPYTHON_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m -Dmathmore=ON -Dqt5web=ON -Dwebgui=ON -DCMAKE_CXX_STANDARD=17 -Dbuiltin_pcre=ON -Droot7=ON -Dfftw3=ON -Dmathmore=ON -Dfcgi=ON -Dgviz=ON  -Dxrootd=OFF ../$filename2
else 
    echo "暂时不支持当前版本Ubuntu，请联系吴鸿毅。"
    exit 1
fi


make -j$num
make install
cd ../
rm -rf $buildname
rm -rf $filename2


echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本ROOT请将 source ${pathinstall}/$name/bin/thisroot.sh  添加进 .bashrc "



# 
# autoinstallroot630.sh ends here
