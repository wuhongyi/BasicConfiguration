<!-- README.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 6月  2 11:10:09 2017 (+0800)
;; Last-Updated: 五 6月  2 12:17:33 2017 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# 系统配置以及环境设置

本教程包含Scientific Linux 系统一些常用软件的配置脚本。

Scientific Linux7 安装方法见 http://wuhongyi.cn/CodeProject/ScientisicLinux72.html  **如要使用本自动化脚本，务必按照安装教程安装系统！！！**


----

## Auto Set SL7

安装好系统之后，进入文件夹 *autosetSL7* 

首先在ROOT权限下执行脚本安装升级一些依赖软件
```bash
sh autoYUMinstallSL7.sh
```

然后执行脚本自动下载常用软件
```bash
sh autoinstallsoftware.sh
```

升级cmake gcc 软件
```bash
autoinstallcmake.sh
autoinstallgcc.sh
```

以下软件的升级非必须，根据需要升级
```bash
autoinstallemacs.sh
autoinstallgdb.sh
```



<!-- README.md ends here -->
