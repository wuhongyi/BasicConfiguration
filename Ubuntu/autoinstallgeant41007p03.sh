#!/bin/bash
# autoinstallgeant41007p03.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 三 7月 14 14:48:47 2021 (+0800)
# Last-Updated: 四 3月  3 10:52:03 2022 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 4
# URL: http://wuhongyi.cn 

pathinstall="/opt/Geant4"
filename="geant4.10.07.p03"

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

wget ${urllinkdata}G4NDL.4.6.tar.gz
wget ${urllinkdata}G4EMLOW.7.13.tar.gz
wget ${urllinkdata}G4PhotonEvaporation.5.7.tar.gz
wget ${urllinkdata}G4RadioactiveDecay.5.6.tar.gz
wget ${urllinkdata}G4SAIDDATA.2.0.tar.gz
wget ${urllinkdata}G4PARTICLEXS.3.1.1.tar.gz
wget ${urllinkdata}G4ABLA.3.1.tar.gz
wget ${urllinkdata}G4INCL.1.0.tar.gz
wget ${urllinkdata}G4PII.1.3.tar.gz
wget ${urllinkdata}G4ENSDFSTATE.2.3.tar.gz
wget ${urllinkdata}G4RealSurface.2.2.tar.gz
wget ${urllinkdata}G4TENDL.1.3.2.tar.gz

# wget ftp://gdo-nuclear.ucllnl.org/LEND_GND1.3/LEND_GND1.3_ENDF.BVII.1.tar.gz

if [ ! -f "${filename}.tar.gz" ]; then
    echo "文件 ${filename}.tar.gz 未下载成功"
    exit 1
fi

name=`expr $filename | sed 's/\.//g'` #去除.
buildname="build$name"
datafilename=`expr $filename | sed 's/geant4./Geant4-/g' | sed 's/\.0/./g' | sed 's/p0//g'`
datadir="${pathinstall}/${name}/share/${datafilename}/data"


num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -xvf ${filename}.tar.gz
mkdir $buildname
cd $buildname

# Release/Debug
cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/$name -DCMAKE_BUILD_TYPE=Release  -DGEANT4_USE_SYSTEM_CLHEP=OFF -DGEANT4_USE_SYSTEM_ZLIB=OFF -DGEANT4_USE_SYSTEM_EXPAT=OFF -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_GDML=ON  -DGEANT4_USE_XM=ON -DGEANT4_BUILD_TLS_MODEL=global-dynamic -DGEANT4_USE_FREETYPE=ON -DGEANT4_BUILD_PHP_AS_HP=ON -DGEANT4_USE_SMARTSTACK=ON  ../${filename}
# -DGEANT4_USE_PYTHON=ON
make -j$num
make install
cd ../
rm -rf $filename
rm -rf $buildname

mkdir ${datadir}
tar -zxvf G4NDL.4.6.tar.gz  -C ${datadir}
tar -zxvf G4EMLOW.7.13.tar.gz -C  ${datadir}
tar -zxvf G4PhotonEvaporation.5.7.tar.gz -C  ${datadir}
tar -zxvf G4RadioactiveDecay.5.6.tar.gz -C  ${datadir}
tar -zxvf G4SAIDDATA.2.0.tar.gz -C  ${datadir}
tar -zxvf G4PARTICLEXS.3.1.1.tar.gz -C  ${datadir}
tar -zxvf G4ABLA.3.1.tar.gz -C  ${datadir}
tar -zxvf G4INCL.1.0.tar.gz -C  ${datadir}
tar -zxvf G4PII.1.3.tar.gz -C  ${datadir}
tar -zxvf G4ENSDFSTATE.2.3.tar.gz -C  ${datadir}
tar -zxvf G4RealSurface.2.2.tar.gz -C  ${datadir}
tar -zxvf G4TENDL.1.3.2.tar.gz -C  ${datadir}

# tar -zxvf LEND_GND1.3_ENDF.BVII.1.tar.gz -C  ${datadir}

echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本Geant4请将 source ${pathinstall}/$name/bin/geant4.sh  添加进 .bashrc "

# 在 geant4.sh 中添加以下环境变量设置
# export G4LENDDATA="`cd $geant4_envbindir/../share/Geant4-10.7.2/data/LEND_GND1.3_ENDF.BVII.1 > /dev/null ; pwd`"


# 
# autoinstallgeant41007p03.sh ends here
