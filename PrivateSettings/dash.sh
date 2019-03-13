#!/bin/bash
# dash.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 六 2月  9 17:16:27 2019 (+0800)
# Last-Updated: 三 3月 13 12:24:09 2019 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 7
# URL: http://wuhongyi.cn 


if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

yum -y install nodejs.x86_64  ##update to >= 8.0, yarn require

curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
yum -y install yarn


## https://dash.plot.ly/installation

pip install --upgrade pip
pip install dash==0.36.0
pip install dash-html-components==0.13.5
pip install dash-core-components==0.43.0
pip install dash-table==3.1.11
pip install dash-daq==0.1.4
#pip install Phidget22

# 
# dash.sh ends here
