<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 6月  2 11:10:09 2017 (+0800)
;; Last-Updated: 五 11月  3 16:09:28 2023 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 47
;; URL: http://wuhongyi.cn -->

# 系统配置以及环境设置

核物理实验中常用 Linux 包括了以下版本 [Ubuntu](https://ubuntu.com/) [CC7](http://linux.web.cern.ch/linux/centos.shtml) [SL](http://www.scientificlinux.org/)

- Ubuntu
	- 22.04 LTS https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/22.04/   ubuntu-22.04.x-desktop-amd64.iso
	- 20.04 LTS https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/20.04/   ubuntu-20.04.x-desktop-amd64.iso
    - 18.04 LTS https://mirrors.tuna.tsinghua.edu.cn/ubuntu-releases/18.04/   ubuntu-18.04.x-desktop-amd64.iso
	- 下载带有 desktop 的 iso 文件，其中 x 为子版本号
- CentOS7
	- CentOS 7
	- CERN 7(CC7)
- CentOS8
	- CentOS 8	
- Scientific Linux
	- CERN 6(SLC6)
	- CERN 5(SLC5)

**Ubuntu 是未来的大势所趋。。。建议优先选择 Ubuntu。**




**务必使本文件夹 BasicConfiguration 所在路径没有中文和特殊字符，建议将文件夹 BasicConfiguration 放置在个人用户目录下再运行自动化脚本！！！**

----

## Auto Install Ubuntu

**为了使得 / 目录下有足够大的空间，安装系统时，建议将 / 目录分配足够的空间，或者不为 /home 目录单独分配空间。**

安装好系统之后，进入文件夹 *Ubuntu*。以下脚本经过Ubuntu20.04和Ubuntu18.04测试。

- 首先在ROOT权限下执行脚本安装升级一些依赖软件（这个必须是第一步完成！！！），pip脚本指定jupyter依赖库版本。
  ```bash
  sudo sh autoaddsource.sh
  sudo sh autoinstallapt.sh
  sudo sh autoinstallpip.sh
  ```
  
- 安装ROOT软件
  ```bash
  # 6.24.02
  sudo sh autoinstallroot624.sh
  # 6.16.00
  sudo sh autoinstallroot616.sh
  # 6.12.06
  sudo sh autoinstallroot612.sh
  ```
- 安装Geant4
  ```bash
  # 4.10.07p03
  sudo sh autoinstallgeant41007p04.sh
  # 4.10.06p03
  sudo sh autoinstallgeant41006p03.sh
  # 4.10.05p01
  sudo sh autoinstallgeant41005p01.sh
  # 4.10.04p03
  sudo sh autoinstallgeant41004p03.sh
  ```
- 安装RadWare05.3(根据自己需要安装)
  ```bash
  sudo sh autoinstallradware053.sh
  ```


如果安装的是 WSL 还需要执行以下一行指令来修复 Qt 相关的问题，否则无法启动 GEANT4/Qt 图形界面

```bash
sudo strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
```


如果你选择使用 *module* 进行多版本控制，清参考文件夹 *modulefiles* 内的配置文件。在 *.bashrc* 文件中添加以下命令才能使用 module
```bash
source /usr/share/modules/init/sh
```

## Auto Install Scientific Linux（CentOS）

安装好系统之后，进入文件夹 *autosetSL7* 

- 首先在ROOT权限下执行脚本安装升级一些依赖软件（这个必须是第一步完成！！！对SL6系统，该脚本在文件夹 autosetSL6）
  ```bash
  sh autoYUMinstallSL7.sh  #只能在7下执行
  ```

- 升级cmake 软件
  ```bash
  sh autoinstallcmake.sh
  ```
- 升级 gcc 软件
  ```bash
  sh autoinstallgcc4.sh
  ```
- 以下软件的升级非必须(根据自己需要升级)
  ```bash
  sh autoinstallemacs.sh
  sh autoinstallgdb.sh
  ```
- 安装ROOT软件（升级 cmake gcc 之后）
  ```bash
  #ROOT 5/6 存在较大的差异，这里提供5/6两种的安装，可以同时安装多个版本，开启哪一个就在 .bashrc 中 source 添加该版本的环境变量
  #默认安装在/opt路径下，可自行修改脚本内的安装位置
  #ROOT5
  sh autoinstallroot5.sh
  ## ROOT6有以下两个可供选择，一个是python2一个是python3，用户根据需要自行选择一个安装即可
  #ROOT6 python2 默认选择
  sh autoinstallroot6.sh
  #ROOT6 python3 需要使用jupyter等功能
  sh autoinstallroot6_py3.sh
  ```
- 安装Geant4（升级 cmake gcc 之后）
  ```bash
  #Geant4版本更新也相对较快，新版本新功能不断完善
  #默认安装在/opt/Geant4路径下，可自行修改脚本内的安装位置
  #Geant4.10.04.p03
  sh autoinstallgeant41004p03.sh
  #Geant4.10.04.p02
  sh autoinstallgeant41004p02.sh
  #Geant4.10.05
  sh autoinstallgeant41005.sh
  #Geant4.10.03.p03
  sh autoinstallgeant41003p03.sh
  #Geant4.10.02.p03
  sh autoinstallgeant41002p03.sh
  #Geant4.10.01.p03
  sh autoinstallgeant41001p03.sh
  #Geant4.9.6.p04
  sh autoinstallgeant496p04.sh  
  ```
- 安装RadWare05.3(根据自己需要安装)
  ```bash
  sh autoinstallradware053.sh
  ```

- 其它软件(根据自己需要安装)
  ```bash
  # chrome
  chmod u+x install_chrome.sh
  ./install_chrome.sh -f
  # CGICC
  sh autoinstallcgicc.sh
  # Typora
  sh autoinstalltypora.sh
  ```

----


如果执行Centos脚本编译过程时候遇到以下问题

```bash
moc: Cannot open options file specified with @
Usage: moc [options] <header-file>
  -o<file>           write output to file rather than stdout
  -I<dir>            add dir to the include path for header files
  -E                 preprocess only; do not generate meta object code
  -D<macro>[=<def>]  define macro, with optional definition
  -U<macro>          undefine macro
  -i                 do not generate an #include statement
  -p<path>           path prefix for included file
  -f[<file>]         force #include, optional file name
  -nn                do not display notes
  -nw                do not display warnings
  @<file>            read additional options from file
  -v                 display version of moc
```

解决方法是：  
If there is an accented character in the path name to the source files you may get this error. Move the source directory to a directory so that there is no accented characters in the path name. Then restart the compilation.

**意思是文件夹不应该包含特殊字符，例如中文等。**


----

## 关于 .bashrc

该文件包含专用于你的 bash shell 的 bash 信息，当登录时以及每次打开新的 shell 时，该文件被读取。

----

## 64bit 系统编译 32bit软件

```bash
./configure  "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" 
```

----

## PrivateSettings

文件夹 *PrivateSettings* 内为吴鸿毅私人配置脚本，请勿随意执行文件夹内脚本以免造成冲突。


<!-- README.md ends here -->
