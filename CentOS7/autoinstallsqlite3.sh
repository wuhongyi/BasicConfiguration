# autoinstallsqlite3.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月 28 15:59:37 2019 (+0800)
# Last-Updated: 五 6月 28 16:08:06 2019 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 1
# URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

wget https://www.sqlite.org/2019/sqlite-autoconf-3280000.tar.gz
tar -zxvf sqlite-autoconf-3280000.tar.gz
cd sqlite-autoconf-3280000

./configure --prefix=/usr

num=`cat /proc/cpuinfo | grep processor | wc -l`
make -j$num
make install

cd ..
rm -rf sqlite-autoconf-3280000 sqlite-autoconf-3280000.tar.gz


# 
# autoinstallsqlite3.sh ends here
