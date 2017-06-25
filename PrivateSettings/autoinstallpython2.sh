# autoinstallpython2.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 六 6月 24 13:53:14 2017 (+0800)
# Last-Updated: 日 6月 25 11:03:39 2017 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 5
# URL: http://wuhongyi.cn 

filename="Python-2.7.13"

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

rm -f ${emacsfilename}.tgz

version=`expr $filename | sed 's/Python-//g'`
wget https://www.python.org/ftp/python/${version}/${filename}.tgz

if [ ! -f "${filename}.tgz" ]; then
    echo "文件 ${filename}.tgz 未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${filename}.tgz
cd ${filename}
./configure #--prefix=/usr
make -j$num
make install
cd ..
rm -rf ${filename}





# 
# autoinstallpython2.sh ends here
