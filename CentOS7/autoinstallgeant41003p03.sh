#!/bin/bash
# autoinstallgeant41003p03.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 四 12月 21 16:28:12 2017 (+0800)
# Last-Updated: 三 7月 14 18:36:31 2021 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 3
# URL: http://wuhongyi.cn 

pathinstall="/opt/Geant4"
filename="geant4.10.03.p03"

urllink="http://cern.ch/geant4-data/releases/"
urllinkdata="http://cern.ch/geant4-data/datasets/"

# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

wget ${urllink}${filename}.tar.gz

wget ${urllinkdata}G4NDL.4.5.tar.gz
wget ${urllinkdata}G4EMLOW.6.50.tar.gz
wget ${urllinkdata}G4PhotonEvaporation.4.3.2.tar.gz
wget ${urllinkdata}G4RadioactiveDecay.5.1.1.tar.gz
wget ${urllinkdata}G4SAIDDATA.1.1.tar.gz
wget ${urllinkdata}G4NEUTRONXS.1.4.tar.gz
wget ${urllinkdata}G4ABLA.3.0.tar.gz
wget ${urllinkdata}G4PII.1.3.tar.gz
wget ${urllinkdata}RealSurface.1.0.tar.gz
wget ${urllinkdata}G4ENSDFSTATE.2.1.tar.gz
wget ${urllinkdata}G4TENDL.1.3.tar.gz

if [ ! -f "${filename}.tar.gz" ]; then
    echo "文件 ${filename}.tar.gz 未下载成功"
    exit 1
fi

#yum -y remove qt5*

name=`expr $filename | sed 's/\.//g'` #去除.
buildname="build$name"
datafilename=`expr $filename | sed 's/geant4./Geant4-/g' | sed 's/\.0/./g' | sed 's/p0//g'`
datadir="${pathinstall}/${name}/share/${datafilename}/data"

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${filename}.tar.gz
mkdir $buildname
cd $buildname

# Release/Debug
cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/$name -DCMAKE_BUILD_TYPE=Release  -DGEANT4_FORCE_QT4=ON -DGEANT4_USE_SYSTEM_CLHEP=OFF -DGEANT4_USE_SYSTEM_ZLIB=OFF -DGEANT4_USE_SYSTEM_EXPAT=OFF -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_GDML=ON  -DGEANT4_USE_XM=ON -DGEANT4_BUILD_TLS_MODEL=global-dynamic -DGEANT4_USE_FREETYPE=ON  ../${filename}
make -j$num
make install
cd ../
rm -rf $filename
rm -rf $buildname

mkdir ${datadir}
tar -zxvf G4NDL.4.5.tar.gz  -C ${datadir}
tar -zxvf G4EMLOW.6.50.tar.gz -C  ${datadir}
tar -zxvf G4PhotonEvaporation.4.3.2.tar.gz -C  ${datadir}
tar -zxvf G4RadioactiveDecay.5.1.1.tar.gz -C  ${datadir}
tar -zxvf G4SAIDDATA.1.1.tar.gz -C  ${datadir}
tar -zxvf G4NEUTRONXS.1.4.tar.gz -C  ${datadir}
tar -zxvf G4ABLA.3.0.tar.gz -C  ${datadir}
tar -zxvf G4PII.1.3.tar.gz -C  ${datadir}
tar -zxvf RealSurface.1.0.tar.gz -C  ${datadir}
tar -zxvf G4ENSDFSTATE.2.1.tar.gz -C  ${datadir}
tar -zxvf G4TENDL.1.3.tar.gz -C  ${datadir}


echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本Geant4请将 source ${pathinstall}/$name/bin/geant4.sh  添加进 .bashrc "


# 
# autoinstallgeant41003p03.sh ends here
