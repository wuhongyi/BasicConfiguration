<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 6月  2 11:10:09 2017 (+0800)
;; Last-Updated: 五 6月  2 16:24:07 2017 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 6
;; URL: http://wuhongyi.cn -->

# 系统配置以及环境设置

本教程包含Scientific Linux 系统一些常用软件的配置脚本。

Scientific Linux7 安装方法见 http://wuhongyi.cn/CodeProject/ScientisicLinux72.html  **如要使用本自动化脚本，务必按照安装教程安装系统！！！**


----

## Auto Set SL7

安装好系统之后，进入文件夹 *autosetSL7* 

- 首先在ROOT权限下执行脚本安装升级一些依赖软件（这个必须是第一步完成！！！）
  ```bash
  sh autoYUMinstallSL7.sh
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

----

## 关于 .bashrc

该文件包含专用于你的 bash shell 的 bash 信息，当登录时以及每次打开新的 shell 时，该文件被读取。




<!-- README.md ends here -->
