#!/bin/bash
# autoinstallgeant41101p03.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 六 3月 25 20:44:34 2023 (+0800)
# Last-Updated: 六 4月 20 21:30:58 2024 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 8
# URL: http://wuhongyi.cn 

pathinstall="/opt/Geant4"
filename="geant4-v11.1.3"

urllink="https://gitlab.cern.ch/geant4/geant4/-/archive/v11.1.3/"
urllinkdata="https://geant4-data.web.cern.ch/datasets/"

# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

wget ${urllink}${filename}.tar.gz

wget ${urllinkdata}G4NDL.4.7.tar.gz
wget ${urllinkdata}G4EMLOW.8.2.tar.gz
wget ${urllinkdata}G4PhotonEvaporation.5.7.tar.gz
wget ${urllinkdata}G4RadioactiveDecay.5.6.tar.gz
wget ${urllinkdata}G4SAIDDATA.2.0.tar.gz
wget ${urllinkdata}G4PARTICLEXS.4.0.tar.gz
wget ${urllinkdata}G4ABLA.3.1.tar.gz
wget ${urllinkdata}G4INCL.1.0.tar.gz
wget ${urllinkdata}G4PII.1.3.tar.gz
wget ${urllinkdata}G4ENSDFSTATE.2.3.tar.gz
wget ${urllinkdata}G4RealSurface.2.2.tar.gz
wget ${urllinkdata}G4TENDL.1.4.tar.gz

# wget ftp://gdo-nuclear.ucllnl.org/LEND_GND1.3/LEND_GND1.3_ENDF.BVII.1.tar.gz

if [ ! -f "${filename}.tar.gz" ]; then
    echo "文件 ${filename}.tar.gz 未下载成功"
    exit 1
fi

name=`expr $filename | sed 's/\.//g'` #去除.
buildname="build$name"
datafilename=`expr $filename | sed 's/geant4./Geant4-/g' | sed 's/\.0/./g' | sed 's/p0//g'`
datadir="${pathinstall}/${name}/share/data"


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
tar -zxvf G4NDL.4.7.tar.gz  -C ${datadir}
tar -zxvf G4EMLOW.8.2.tar.gz -C  ${datadir}
tar -zxvf G4PhotonEvaporation.5.7.tar.gz -C  ${datadir}
tar -zxvf G4RadioactiveDecay.5.6.tar.gz -C  ${datadir}
tar -zxvf G4SAIDDATA.2.0.tar.gz -C  ${datadir}
tar -zxvf G4PARTICLEXS.4.0.tar.gz -C  ${datadir}
tar -zxvf G4ABLA.3.1.tar.gz -C  ${datadir}
tar -zxvf G4INCL.1.0.tar.gz -C  ${datadir}
tar -zxvf G4PII.1.3.tar.gz -C  ${datadir}
tar -zxvf G4ENSDFSTATE.2.3.tar.gz -C  ${datadir}
tar -zxvf G4RealSurface.2.2.tar.gz -C  ${datadir}
tar -zxvf G4TENDL.1.4.tar.gz -C  ${datadir}

# tar -zxvf LEND_GND1.3_ENDF.BVII.1.tar.gz -C  ${datadir}

echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本Geant4请将 source ${pathinstall}/$name/bin/geant4.sh  添加进 .bashrc "


# 
# autoinstallgeant41101p03.sh ends here
