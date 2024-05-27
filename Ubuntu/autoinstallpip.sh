#!/bin/bash
## autoinstallpip.sh --- 
## 
## Description: 
## Author: Hongyi Wu(吴鸿毅)
## Email: wuhongyi@qq.com 
## Created: 四 9月 16 15:09:11 2021 (+0800)
## Last-Updated: 一 5月 27 10:25:52 2024 (+0800)
##           By: Hongyi Wu(吴鸿毅)
##     Update #: 9
## URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi


## ROOT jupyter 依赖版本

VERSION=`lsb_release -r`
echo "$VERSION"
if [ "$VERSION" = "Release:	20.04" ] ; then 
    echo "当前为Ubuntu 20.04"
    ## Ubuntu2004
    pip3 install  jinja2==3.1.3
    pip3 install  nbformat==5.10.4
    pip3 install  ipykernel==6.29.4
    pip3 install  ipython==7.13.0
    pip3 install  jupyter-console==6.6.3
    pip3 install  jupyter-core==5.7.2
    pip3 install  notebook==7.1.3
    pip3 install  voila==0.5.6
    pip3 install  jupyter-client==8.6.1
    pip3 install  jupyter-server==2.14.0
    pip3 install  traitlets==5.14.3
elif [ "$VERSION" = "Release:	18.04" ] ; then
    echo "当前为Ubuntu 18.04"
    ## Ubuntu1804
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com ipykernel==5.5.5
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com ipython==7.16.1
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter-client==7.0.2
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter-console==6.4.0
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter-core==4.7.1
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com notebook==6.4.4
    pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com voila==0.2.13
else 
    echo "暂时不支持当前版本Ubuntu，请联系吴鸿毅。"
    exit 1
fi


## 
## autoinstallpip.sh ends here
