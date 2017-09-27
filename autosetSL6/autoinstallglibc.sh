# autoinstallglibc.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 三 9月 27 22:08:01 2017 (+0800)
# Last-Updated: 三 9月 27 22:18:04 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 2
# URL: http://wuhongyi.cn 

glibcfilename="glibc-2.17"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${glibcfilename}.tar.gz
wget http://mirrors.ustc.edu.cn/gnu/libc/${glibcfilename}.tar.gz



if [ ! -f "${glibcfilename}.tar.gz" ]; then
    echo "文件 ${glibcfilename}.tar.gz 未下载成功"
    exit 1
fi


num=`cat /proc/cpuinfo | grep processor | wc -l`


tar -zxvf ${glibcfilename}.tar.gz
cd ${glibcfilename}
mkdir build
cd build
../configure --prefix=/usr 
make -j$num
make install
cd ../..
rm -rf ${glibcfilename}

# 
# autoinstallglibc.sh ends here
