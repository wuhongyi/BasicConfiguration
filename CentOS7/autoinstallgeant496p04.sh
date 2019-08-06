#!/bin/bash
# autoinstallgeant496p04.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月 15 09:21:05 2018 (+0800)
# Last-Updated: 二 8月  6 19:48:27 2019 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 5
# URL: http://wuhongyi.cn 

pathinstall="/opt/Geant4"
filename="geant4.9.6.p04"

# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

wget http://cern.ch/geant4/support/source/${filename}.tar.gz


wget http://cern.ch/geant4-data/datasets/G4NDL.4.2.tar.gz
#wget http://cern.ch/geant4-data/datasets/G4NDL4.2.TS.tar.gz
wget http://cern.ch/geant4-data/datasets/G4EMLOW.6.32_permissions.tar.gz
wget http://cern.ch/geant4-data/datasets/G4PhotonEvaporation.2.3.tar.gz
wget http://cern.ch/geant4-data/datasets/G4RadioactiveDecay.3.6.tar.gz
wget http://cern.ch/geant4-data/datasets/G4SAIDDATA.1.1.tar.gz
wget http://cern.ch/geant4-data/datasets/G4NEUTRONXS.1.2.tar.gz
wget http://cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz
wget http://cern.ch/geant4-data/datasets/RealSurface.1.0.tar.gz

if [ ! -f "${filename}.tar.gz" ]; then
    echo "文件 ${filename}.tar.gz 未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${filename}.tar.gz
mkdir buildgeant496p04
cd buildgeant496p04
cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/geant496p04  -DGEANT4_FORCE_QT4=ON -DGEANT4_USE_SYSTEM_EXPAT=OFF -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_GDML:BOOL=ON  -DGEANT4_BUILD_TLS_MODEL=global-dynamic ../geant4.9.6.p04
make -j$num
make install
cd ../
rm -rf buildgeant496p04
rm -rf geant4.9.6.p04

mkdir ${pathinstall}/geant496p04/share/Geant4-9.6.4/data

tar -zxvf G4NDL.4.2.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf G4EMLOW.6.32_permissions.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf G4PhotonEvaporation.2.3.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf G4RadioactiveDecay.3.6.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf G4SAIDDATA.1.1.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf G4NEUTRONXS.1.2.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf G4PII.1.3.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data
tar -zxvf RealSurface.1.0.tar.gz  -C ${pathinstall}/geant496p04/share/Geant4-9.6.4/data


echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本Geant4请将 source ${pathinstall}/geant496p04/bin/geant4.sh  添加进 .bashrc "


# 
# autoinstallgeant496p04.sh ends here
