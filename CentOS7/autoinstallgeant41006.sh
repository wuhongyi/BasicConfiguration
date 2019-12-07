# autoinstallgeant41006.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 六 12月  7 12:28:37 2019 (+0800)
# Last-Updated: 六 12月  7 13:08:27 2019 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 5
# URL: http://wuhongyi.cn 

pathinstall="/opt/Geant4"
filename="geant4.10.06"

# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

wget http://cern.ch/geant4/support/source/${filename}.tar.gz

wget http://geant4.cern.ch/support/source/G4NDL.4.6.tar.gz
wget http://geant4.cern.ch/support/source/G4EMLOW.7.9.tar.gz
wget http://geant4.cern.ch/support/source/G4PhotonEvaporation.5.5.tar.gz
wget http://geant4.cern.ch/support/source/G4RadioactiveDecay.5.4.tar.gz
wget http://geant4.cern.ch/support/source/G4SAIDDATA.2.0.tar.gz
wget http://geant4.cern.ch/support/source/G4PARTICLEXS.2.1.tar.gz
wget http://geant4.cern.ch/support/source/G4ABLA.3.1.tar.gz
wget http://geant4.cern.ch/support/source/G4INCL.1.0.tar.gz
wget http://geant4.cern.ch/support/source/G4PII.1.3.tar.gz
wget http://geant4.cern.ch/support/source/G4ENSDFSTATE.2.2.tar.gz
wget http://geant4.cern.ch/support/source/G4RealSurface.2.1.1.tar.gz
wget http://geant4.cern.ch/support/source/G4TENDL.1.3.2.tar.gz

# wget ftp://gdo-nuclear.ucllnl.org/LEND_GND1.3/LEND_GND1.3_ENDF.BVII.1.tar.gz

if [ ! -f "${filename}.tar.gz" ]; then
    echo "文件 ${filename}.tar.gz 未下载成功"
    exit 1
fi

name=`expr $filename | sed 's/\.//g'` #去除.
buildname="build$name"
datafilename=`expr $filename | sed 's/geant4./Geant4-/g' | sed 's/\.0/./g' | sed 's/6/6.0/g'`
datadir="${pathinstall}/${name}/share/${datafilename}/data"


num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -xvf ${filename}.tar.gz
mkdir $buildname
cd $buildname

# Release/Debug
cmake -DCMAKE_INSTALL_PREFIX=${pathinstall}/$name -DCMAKE_BUILD_TYPE=Release  -DGEANT4_USE_SYSTEM_CLHEP=OFF -DGEANT4_USE_SYSTEM_ZLIB=OFF -DGEANT4_USE_SYSTEM_EXPAT=OFF -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_BUILD_MULTITHREADED=ON -DGEANT4_USE_GDML=ON  -DGEANT4_USE_XM=ON -DGEANT4_BUILD_TLS_MODEL=global-dynamic -DGEANT4_USE_FREETYPE=ON  ../${filename}
make -j$num
make install
cd ../
rm -rf $filename
rm -rf $buildname

mkdir ${datadir}
tar -xvf G4NDL.4.6.tar.gz  -C ${datadir}
tar -xvf G4EMLOW.7.9.tar.gz -C  ${datadir}
tar -xvf G4PhotonEvaporation.5.5.tar.gz -C  ${datadir}
tar -xvf G4RadioactiveDecay.5.4.tar.gz -C  ${datadir}
tar -xvf G4SAIDDATA.2.0.tar.gz -C  ${datadir}
tar -xvf G4PARTICLEXS.2.1.tar.gz -C  ${datadir}
tar -xvf G4ABLA.3.1.tar.gz -C  ${datadir}
tar -xvf G4INCL.1.0.tar.gz -C  ${datadir}
tar -xvf G4PII.1.3.tar.gz -C  ${datadir}
tar -xvf G4ENSDFSTATE.2.2.tar.gz -C  ${datadir}
tar -xvf G4RealSurface.2.1.1.tar.gz -C  ${datadir}
tar -xvf G4TENDL.1.3.2.tar.gz -C  ${datadir}

# tar -zxvf LEND_GND1.3_ENDF.BVII.1.tar.gz -C  ${datadir}

echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本Geant4请将 source ${pathinstall}/$name/bin/geant4.sh  添加进 .bashrc "

# 在 geant4.sh 中添加以下环境变量设置
# export G4LENDDATA="`cd $geant4_envbindir/../share/Geant4-10.5.1/data/LEND_GND1.3_ENDF.BVII.1 > /dev/null ; pwd`"


# 
# autoinstallgeant41006.sh ends here
