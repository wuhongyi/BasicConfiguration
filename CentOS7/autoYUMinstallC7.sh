#!/bin/bash
# autoYUMinstallC7.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 二 5月 21 21:00:35 2019 (+0800)
# Last-Updated: 三 8月 19 09:07:32 2020 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 48
# URL: http://wuhongyi.cn 

if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

#升级所有可升级的软件，但是升级后会覆盖我们安装在/usr/bin中的软件。升级后需要重新安装被覆盖的软件
#yum -y update  --skip-broken  #建议明白的人开启，升级需要较长的事件

#EPEL提供的一个yum插件。使用该插件后用yum安装软件时可以并行下载，大大提高了软件的下载速度，减少了下载的等待时间。安装该插件的同时会安装另一个软件axel。axel是一个并行下载工具，在下载http、ftp等简单协议的文件时非常好用。
#yum -y install yum-axelget
      
#加快yun速度
#yum -y install yum-plugin-fastestmirror

#scl发布源
###https://blog.csdn.net/chenxin2tj/article/details/83578138
yum -y install centos-release-scl-rh.noarch

#安装iptables-services软件包
yum -y install iptables-services

#dnf
yum -y install dnf

#emacs
yum -y install giflib-devel.x86_64  giflib-utils.x86_64

#gcc
yum -y install glibc-static libstdc++-static
yum -y install glibc-devel.i686 glibc-static.i686
yum -y install libstdc++-devel.i686 libstdc++-static.i686

## -----------------------------------------------------------------------------

## 常用必需

#modbus
yum -y install libmodbus.x86_64 libmodbus-devel.x86_64

#usb64/32
yum -y install libusb-devel.x86_64 libusb-static.x86_64 libusb.i686 libusb-devel.i686 libusb-static.i686 libusbx.i686 libusbx-devel.i686


#多机并行（有空再测试G4的多机并行）
yum -y install mpich.x86_64 mpich-devel.x86_64
yum -y install mpich-3.0.x86_64 mpich-3.0-devel.x86_64 mpich-3.2.x86_64 mpich-3.2-devel.x86_64

#汉化包，缺少将导致有些软件为英文界面，例如kate
yum -y install kde-l10n-Chinese.noarch  kde-l10n-Chinese-Traditional.noarch

#screen
yum -y install screen.x86_64

# 读取写入json格式数据
yum -y install jsoncpp.x86_64 jsoncpp-devel.x86_64 

#压缩解压缩.rar文件
yum -y install rar.x86_64

#打开ntfs/exfat格式硬盘
yum -y install findntfs.x86_64 ntfs-3g.x86_64 ntfs-3g-devel.x86_64
yum -y install fuse-exfat.x86_64 exfat-utils.x86_64

#gnuplot
#rm -f /usr/bin/gnuplot
yum -y install gnuplot.x86_64 gnuplot-common.x86_64 gnuplot-minimal.x86_64 gnuplot-latex.noarch


#flash播放
yum -y install flash-plugin.x86_64

#minicom超级终端
yum -y install minicom.x86_64

# nfs文件共享
yum -y install -y nfs-utils rpcbind

#hdf5
#yum -y install hdf5.x86_64  hdf5-devel.x86_64 hdf5-mpich.x86_64 hdf5-mpich-devel.x86_64  hdf5-openmpi.x86_64 hdf5-openmpi-devel.x86_64

#数据恢复
#yum -y install extundelete.x86_64

#自动输入密码
yum -y install sshpass.x86_64

# qwt
yum -y install qwt.x86_64 qwt-devel.x86_64 qwt5-qt4.x86_64 qwt5-qt4-devel.x86_64 
yum -y install quazip.x86_64 quazip-devel.x86_64 quazip-qt5.x86_64 quazip-qt5-devel.x86_64

#lighttpd
yum -y install lighttpd.x86_64 lighttpd-fastcgi.x86_64 lighttpd-mod_authn_gssapi.x86_64 lighttpd-mod_authn_mysql.x86_64 lighttpd-mod_geoip.x86_64 lighttpd-mod_mysql_vhost.x86_64

#ZeroMQ
yum -y install zeromq.x86_64 zeromq-devel.x86_64
yum -y install cppzmq-devel.x86_64
yum -y install czmq.x86_64 czmq-devel.x86_64

#UnitTest++
yum -y install unittest-cpp.x86_64 unittest-cpp-devel.x86_64

#python
yum -y install tkinter.x86_64

#python3  这里有些版本依赖，使用时候需要注意是否一致
yum -y install python3.x86_64 python3-devel.x86_64 python3-libs.x86_64 python36.x86_64 python36-devel.x86_64 python36-libs.x86_64 python36-tkinter.x86_64 python36-pip.noarch python36-cffi.x86_64 python36-cryptography.x86_64 python36-cryptography-vectors.noarch python36-decorator.noarch python36-idna.noarch python36-ipython_genutils.noarch python36-ply.noarch python36-pyasn1.noarch python36-pycparser.noarch python36-six.noarch python36-traitlets.noarch python36-mysql.x86_64 python36-jinja2.noarch

#Qt
yum -y update qt*
yum install qtwebkit.x86_64 qtwebkit-devel.x86_64

#chrome
yum -y install libappindicator.x86_64 libappindicator-devel.x86_64 libappindicator-gtk3.x86_64 libappindicator-gtk3-devel.x86_64
yum -y install liberation-fonts.noarch liberation-narrow-fonts.noarch
# download from https://www.google.cn/intl/zh-CN/chrome/
#rpm -i google-chrome-stable_current_x86_64.rpm


## -----------------------------------------------------------------------------

## 额外功能（根据需要选择安装）

#PKUVMEDAQ
# yum -y install ncurses.x86_64 ncurses-base.noarch ncurses-devel.x86_64 ncurses-libs.x86_64

#altra Quartus Modelsim
###https://wiki.archlinux.org/index.php/Altera_Design_Software#ModelSim-Altera_Edition
# yum -y install libX11.x86_64 libX11-common.noarch libX11-devel.x86_64 libX11.i686 libX11-devel.i686
# yum -y install libXext.x86_64 libXext-devel.x86_64 libXext.i686 libXext-devel.i686
# yum -y install libXft.x86_64 libXft-devel.x86_64 libXft.i686 libXft-devel.i686
# yum -y install ncurses-devel.i686 ncurses-libs.i686
# yum -y install freetype.i686   freetype-devel.i686
# yum -y install freetype-freeworld.i686 


#TeamViewer
yum -y install qt5-qtwebkit.x86_64 qt5-qtwebkit-devel.x86_64 qt5-qtquickcontrols.x86_64 qt5-qtx11extras.x86_64 qt5-qtx11extras-devel.x86_64
yum -y install harfbuzz.x86_64 harfbuzz-devel.x86_64 harfbuzz-icu.x86_64
yum -y install freetype.x86_64 freetype-devel.x86_64

#elog
# yum -y install elog.x86_64

#kate编辑器
# yum -y install kate.x86_64 kate-devel.x86_64 kate-libs.x86_64 kate-part.x86_64 ghc-highlighting-kate-devel.x86_64 ghc-highlighting-kate.x86_64

#Code::Blocks IDE
# yum -y install codeblocks*

#桌面录制
# yum -y install recordmydesktop.x86_64 gtk-recordmydesktop.noarch

#mp3格式文件转wav格式
# yum -y install mpg123.x86_64 mpg123-devel.x86_64 perl-Audio-Play-MPG123.noarch

#播放mp3
# yum -y install libmad.x86_64 libmad-devel.x86_64

#clang编译器
yum -y install clang.x86_64 clang-devel.x86_64

#shell脚本加密
yum -y install shc.x86_64

#htop 
yum -y install htop.x86_64

#iftop
yum -y install iftop.x86_64

#linux系统性能监控
# yum -y install glances.noarch
# glances -o HTML -f /var/www/html
# 浏览器输入网址: http://localhost/glances.html

#npm  用于jekyll/hexo、gitbook    https://gems.ruby-china.com/
yum -y install npm.noarch  nodejs.x86_64  nodejs-devel.x86_64
yum -y install rubygems-devel.noarch
yum -y install mingw64-libffi.noarch mingw64-libffi-static.noarch
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
gem update --system
# npm install -g gitbook-cli
# npm install -g hexo


#加快显示网页的latex数学公式
yum -y install mathjax.noarch

#markdown转pdf
yum -y install pandoc.x86_64


#翻译软件，配置后可选词翻译
# yum -y install goldendict.x86_64 goldendict-docs.noarch

#okular pdf阅读器(基于KDE) 感觉没有默认的evince好
# yum -y install okular.x86_64

#文件编码转换
# yum -y install convmv.noarch

#HP打印机驱动
# yum -y install hplip.x86_64

#群辉NAS
# yum -y install libappindicator.x86_64 libappindicator-devel.x86_64

#texlive
yum -y install texlive-* latex2html.noarch latex2rtf.x86_64  latexmk.noarch

## jupyter-notebook
pip3 install  -i http://pypi.douban.com/simple --trusted-host pypi.douban.com --upgrade pip
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com jupyter metakernel zmq
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com Markdown

#python 额外库
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com serial modbus_tk pyserial
#python 额外库
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com shell
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com qdarkstyle
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com pandas pandas-datareader BeautifulSoup4 selenium
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com sphinx sphinx-intl sphinx-autobuild recommonmark sphinx_rtd_theme mkdocs  #Read the Docs
# pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com  Django  #2.2.1 required SQLite3.8
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com Django==2.1.0



#gitbook 使用calibre插件生成PDF
# wget https://download.calibre-ebook.com/linux-installer.sh
# sh linux-installer.sh

## -----------------------------------------------------------------------------

#ROOT
yum -y install lz4.x86_64 lz4-devel.x86_64 fftw.x86_64 fftw-devel.x86_64 fftw-libs.x86_64 gsl.x86_64 gsl-devel.x86_64 graphviz.x86_64 graphviz-devel.x86_64 ruby.x86_64 ruby-devel.x86_64 ruby-libs.x86_64 expect.x86_64 expect-devel.x86_64 davix.x86_64 davix-devel.x86_64 unuran.x86_64 unuran-devel.x86_64 avahi-compat-libdns_sd.x86_64 avahi-compat-libdns_sd-devel.x86_64 ftgl.x86_64 ftgl-devel.x86_64 glew.x86_64 glew-devel.x86_64 mysql++.x86_64 mysql++-devel.x86_64 cfitsio.x86_64 cfitsio-devel.x86_64 libxml2* binutils-devel.x86_64 pythia8.x86_64 pythia8-devel.x86_64 redhat-lsb.x86_64 R.x86_64 R-RInside.x86_64 R-RInside-devel.x86_64 R-Rcpp.x86_64 R-Rcpp-devel.x86_64 gfal2.x86_64 gfal2-devel.x86_64 gfal2-all.x86_64 xrootd.x86_64 xrootd-devel.x86_64 xrootd-client.x86_64 xrootd-client-devel.x86_64

#Geant4
yum -y install xerces-c.x86_64  xerces-c-devel.x86_64



# 
# autoYUMinstallC7.sh ends here
