# autoinstallradware053.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 日 6月 18 13:44:02 2017 (+0800)
# Last-Updated: 四 8月 19 15:37:42 2021 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 28
# URL: http://wuhongyi.cn 

#以下两个路径需要同时修改，其中第一个的/ 前都需要加上 \
pathinstall="\/opt"  # / 前都需要加上 \
pathinstall2="/opt"
# ------------------------------------------------------------------------------

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

filename="rw05.3"
filename2="rw05"
name="RadWare053"

rm -f ${filename}.tgz
wget  https://radware.phy.ornl.gov/ftp/radware/unix/${filename}.tgz

if [ ! -f "${filename}.tgz" ]; then
    echo "文件 ${filename}.tgz 未下载成功"
    exit 1
fi

num=`cat /proc/cpuinfo | grep processor | wc -l`

tar -zxvf ${filename}.tgz
cd ${filename2}/src

chazhaotihuan="s/\${HOME}\/rw_current/${pathinstall}\/${name}/"
# echo $chazhaotihuan
sed -i ${chazhaotihuan} Makefile.linux
chazhaotihuan="s/radfordd/${USERNAME}/g"
sed -i ${chazhaotihuan} Makefile.linux
sed -i "s/Makefile.install_ucb/Makefile.install_cp/g" Makefile.linux

cp Makefile.linux Makefile
make all -j$num
make install

chazhaotihuan="s/\${RADWARE_HOME:-\$HOM\E/rw_current}/${pathinstall}\/${name}/"
# echo $chazhaotihuan
sed -i ${chazhaotihuan} Makefile.linux
chazhaotihuan="s/radfordd/${USERNAME}/g"
sed -i ${chazhaotihuan} Makefile.linux
sed -i "s/Makefile.install_ucb/Makefile.install_cp/g" Makefile.linux

cp Makefile.linux Makefile
make all -j$num
make install

chazhaotihuan="s/\${RADWARE_HOME:-\$HOME\/rw_current}/${pathinstall}\/${name}/"
bashrcfile=${pathinstall2}"/"${name}"/.radware.bashrc"
sed -i ${chazhaotihuan} ${bashrcfile}

cd ../../
rm -rf ${filename2}

echo ""
echo "==========吴鸿毅 提示=========="
echo "如欲启用该版本RadWare请将 "
echo "source ${pathinstall2}/${name}/.radware.bashrc"
echo "export PATH=\$PATH:${pathinstall2}/${name}/bin"
echo "添加进 .bashrc "

# 
# autoinstallradware053.sh ends here
