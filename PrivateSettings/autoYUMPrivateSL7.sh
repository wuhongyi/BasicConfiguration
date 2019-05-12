#!/bin/bash
# auto.sh --- 
# 
# Description: 
# Author: Hongyi Wu(吴鸿毅)
# Email: wuhongyi@qq.com 
# Created: 五 6月  2 10:06:13 2017 (+0800)
# Last-Updated: 日 5月 12 10:50:08 2019 (+0800)
#           By: Hongyi Wu(吴鸿毅)
#     Update #: 43
# URL: http://wuhongyi.cn 


if [ `whoami` = "root" ];then 
    echo "当前为root用户，能够执行此脚本！" 
else 
    echo "请在ROOT权限下执行此脚本！！！"
    exit 1
fi

## -----------------------------------------------------------------------------
## 额外功能（根据需要选择安装）

#elog
yum -y install elog.x86_64

#kate编辑器
yum -y install kate.x86_64 kate-devel.x86_64 kate-libs.x86_64 kate-part.x86_64 ghc-highlighting-kate-devel.x86_64 ghc-highlighting-kate.x86_64

#Code::Blocks IDE
yum -y install codeblocks*

#桌面录制
yum -y install recordmydesktop.x86_64 gtk-recordmydesktop.noarch

#mp3格式文件转wav格式
yum -y install mpg123.x86_64 mpg123-devel.x86_64 perl-Audio-Play-MPG123.noarch

#播放mp3
yum -y install libmad.x86_64 libmad-devel.x86_64

#clang编译器
yum -y install clang.x86_64 clang-devel.x86_64

#shell脚本加密
yum -y install shc.x86_64

#htop
yum -y install htop.x86_64

#iftop
yum -y install iftop.x86_64

#npm  用于jekyll/hexo、gitbook
yum -y install npm.noarch  nodejs.x86_64
yum -y install rubygems-devel.noarch
gem update --system

#加快显示网页的latex数学公式
yum -y install mathjax.noarch

#markdown转pdf
yum -y install pandoc.x86_64


#翻译软件，配置后可选词翻译
yum -y install goldendict.x86_64 goldendict-docs.noarch

#okular pdf阅读器(基于KDE) 感觉没有默认的evince好
yum -y install okular.x86_64

#文件编码转换
yum -y install convmv.noarch

#texlive
yum -y install texlive-*
yum -y install latex2html.noarch latex2rtf.x86_64  latexmk.noarch


## -----------------------------------------------------------------------------

# python 这个现在弃用 20180112
# wget http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
# sh setuptools-0.6c11-py2.7.egg
# cp setuptools-0.6c11-py2.7.egg /usr/lib/python2.7/site-packages/
# rm -f setuptools-0.6c11-py2.7.egg
# easy_install pip==9.0.1     #后面的==9.0.1是指定版本   
#https://pypi.python.org/pypi/pip


## jupyter-notebook 20180112 
yum -y install python2-pip.noarch
pip install --upgrade pip
pip install jupyter metakernel zmq
pip install Markdown


#python 额外库
pip install pandas
pip install pandas-datareader
pip install BeautifulSoup
pip install BeautifulSoup4
pip install selenium
pip install sphinx            #Read the Docs
pip install sphinx-autobuild  #Read the Docs
pip install recommonmark      #Read the Docs
pip install sphinx_rtd_theme  #Read the Docs
pip install pyserial

pip install serial
pip install modbus_tk

yum remove python34*
## python34                        
## python34-cffi                   
## python34-cryptography           
## python34-decorator              
## python34-devel                  
## python34-idna                   
## python34-ipython_genutils       
## python34-libs                   
## python34-pip                    
## python34-ply                    
## python34-pyasn1                 
## python34-pycparser              
## python34-setuptools             
## python34-six                    
## python34-traitlets              


yum -y update python36*
yum -y install python36-pip.noarch
yum -y install python36-cffi.x86_64 python36-cryptography.x86_64 python36-cryptography-vectors.noarch python36-decorator.noarch python36-idna.noarch python36-ipython_genutils.noarch python36-ply.noarch python36-pyasn1.noarch python36-pycparser.noarch python36-six.noarch python36-traitlets.noarch
yum -y install python36-mysql.x86_64


pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com  --upgrade pip
pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com  Django  #2.2.1 required SQLite3.8

pip3 install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com Django==2.1.0

#speed up
##pip install -i http://pypi.douban.com/simple --trusted-host pypi.douban.com   xxx

## -----------------------------------------------------------------------------

#jekyll
yum -y remove npm.x86_64
yum -y install nodejs npm
yum -y install mingw64-libffi.noarch mingw64-libffi-static.noarch
yum -y install rubygem* --skip-broken
gem install ffi --remote --platform=ruby
gem install bundler
gem install rb-inotify
gem install redcarpet
gem install jekyll-paginate
gem install jekyll
gem install jekyll-sitemap
gem install jekyll-gl jekyll-do jekyll-s3 jekyllkb
#Hexo个人网站制作
npm install -g hexo
#gitbook
npm install -g gitbook-cli


## -----------------------------------------------------------------------------
#Qt
yum -y update qt*
# yum -y install qt-creator.x86_64  打不开


## -----------------------------------------------------------------------------

# spectcl
# https://libgd.github.io/
# yum -y install gd.x86_64 gd-devel.x86_64

# yum install flex.x86_64 flex-devel.x86_64

# yum -y install gengetopt.x86_64


# ./configure   --with-motif-lib --with-tclconfig=/usr/lib64/tcl8.5 --with-tkconfig=/usr/lib64

# 
# auto.sh ends here
