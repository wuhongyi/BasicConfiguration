# autoinstalltypora.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 六 6月  9 03:07:01 2018 (+0800)
# Last-Updated: 六 6月  9 03:16:12 2018 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 3
# URL: http://wuhongyi.cn 

filename="Typora-linux-x64"
# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

wget https://typora.io/linux/${filename}.tar.gz

rm -rf /opt/${filename}

tar -zxvf ${filename}.tar.gz -C /opt

ln -sf /opt/Typora-linux-x64/Typora /usr/bin/Typora

# 
# autoinstalltypora.sh ends here
