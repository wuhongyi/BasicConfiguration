<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 6月  2 11:10:09 2017 (+0800)
;; Last-Updated: 二 2月  6 17:00:56 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 11
;; URL: http://wuhongyi.cn -->

# 系统配置以及环境设置

Linux @ CERN 包括了以下版本 [CC7](http://linux.web.cern.ch/linux/centos.shtml) [SL](http://www.scientificlinux.org/)

- CentOS
	- CERN 7(CC7)
- Scientific Linux
	- CERN 6(SLC6)
	- CERN 5(SLC5)

它们都是基于 Red Hat Enterprise Linux 开发的。


本教程包含Scientific Linux 系统一些常用软件的配置脚本。本教程可通用于**CentOS**系统。

Scientific Linux 7 （CentOS 7）安装方法见 http://wuhongyi.cn/CodeProject/ScientisicLinux72.html  **如要使用本自动化脚本，务必按照安装教程安装系统！！！**

----

## Auto Set Scientific Linux（CentOS）

安装好系统之后，进入文件夹 *autosetSL7* 

- 首先在ROOT权限下执行脚本安装升级一些依赖软件（这个必须是第一步完成！！！对SL6系统，该脚本在文件夹 autosetSL7）
  ```bash
  sh autoYUMinstallSL7.sh  #只能在7下执行
  ```

- 升级cmake 软件
  ```bash
  sh autoinstallcmake.sh
  ```
- 升级 gcc 软件
  ```bash
  sh autoinstallgcc.sh
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
  #ROOT6
  sh autoinstallroot6.sh
  ```
- 安装Geant4（升级 cmake gcc 之后）
  ```bash
  #Geant4版本更新也相对较快，新版本新功能不断完善
  #默认安装在/opt/Geant4路径下，可自行修改脚本内的安装位置
  #Geant4.10.03.p01
  sh autoinstallgeant41003p01.sh
  #Geant4.10.02.p03
  sh autoinstallgeant41002p03.sh
  #Geant4.10.01.p03
  sh autoinstallgeant41001p03.sh
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
  ```

----


如果执行脚本编译过程时候遇到以下问题

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

## PrivateSettings

文件夹*PrivateSettings*内为吴鸿毅私人配置脚本，请勿随意执行文件夹内脚本以免造成冲突。


<!-- README.md ends here -->
