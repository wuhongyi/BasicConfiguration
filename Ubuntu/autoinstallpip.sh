#!/bin/bash
## autoinstallpip.sh --- 
## 
## Description: 
## Author: Hongyi Wu(吴鸿毅)
## Email: wuhongyi@qq.com 
## Created: 四 9月 16 15:09:11 2021 (+0800)
## Last-Updated: 四 9月 16 15:15:46 2021 (+0800)
##           By: Hongyi Wu(吴鸿毅)
##     Update #: 2
## URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi


## ROOT jupyter 依赖版本
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com ipykernel==6.4.1
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com ipython==7.27.0
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter-client==7.0.2
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter-console==6.4.0
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter-core==4.7.1
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com notebook==6.4.4
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com voila==0.2.13



## 
## autoinstallpip.sh ends here
