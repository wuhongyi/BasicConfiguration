#!/bin/bash
# autoinstallgeant496p04.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月 15 09:21:05 2018 (+0800)
# Last-Updated: 五 6月 15 09:33:08 2018 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 2
# URL: http://wuhongyi.cn 

pathinstall="/opt/Geant4"
filename="geant4.9.6.p04"

# ------------------------------------------------------------------------------

# if [ `whoami` = "root" ];then 
#     echo "当前为root用户，能够执行此脚本！" 
# else 
#     echo "请在ROOT权限下执行此脚本！！！"
#     exit 1
# fi

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

# if [ ! -f "${filename}.tar.gz" ]; then
#     echo "文件 ${filename}.tar.gz 未下载成功"
#     exit 1
# fi





# 
# autoinstallgeant496p04.sh ends here
