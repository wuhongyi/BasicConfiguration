<!-- glances.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 1月 26 21:47:03 2021 (+0800)
;; Last-Updated: 二 1月 26 21:54:56 2021 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# glances

glances是一款由python开发的系统监控工具，可以实时查看CPU、内存、网络、IO、进程、磁盘空间使用率的使用情况，并且支持三种运行模式

## 安装

```bash
pip3 install glances
pip3 install bottle
```

## glances运行模式

- Standalone
	- 在终端输入 glances 然后运行
- Client/Server
	- Server端：glances -s -B 192.168.1.1
	- Client端：glances -c 192.168.1.1
	- 无须去指定服务器上运行，通过Client/Server端模式快速查看。-B：指定绑定的IP地址，如果不指定Server端运行端口默认端口为：61209，如果使用默认端口则用-c指定客户端时不需要额外使用-P参数来指定Server端的端口号。需要注意的是防火墙设置，确认两台主机之间端口可通。
- Web server
	- glances -w
	- 默认端口 61208

## 配置文件

glances 是支持设置配置文件的，但是不一定要有配置文件才能使用glances，Linux中配置文件可以新建位置到 /etc/glances/glances.conf，窗口中的不同颜色是由阈值来设定的，我们可以在配置文件中修改各监控项的阈值来实现不同级别不同颜色的展示情况。

颜色级别定义

- 绿色：正常(OK)
- 蓝色：小心(CAREFUL)，需要注意
- 紫色：警告（WARNING）
- 红色：问题严重（CRITICAL）

配置文件示例 /etc/glances/glances.conf

```
[quicklook]
cpu_careful=50
cpu_warning=70
cpu_critical=1
mem_careful=50
mem_warning=1
mem_critical=90
swap_careful=1
swap_warning=70
swap_critical=90
```



> https://www.cnblogs.com/Cherry-Linux/p/11721099.html


<!-- glances.md ends here -->
