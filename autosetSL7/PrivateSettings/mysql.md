<!-- mysql.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 5月 19 11:20:26 2019 (+0800)
;; Last-Updated: 二 5月 21 22:43:26 2019 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# MYSQL 安装

```bash
# CentOS 7
yum remove akonadi-mysql.x86_64
```


## 依赖

MySQL 依赖 libaio，所以先要安装 libaio

```bash
yum search libaio  # 检索相关信息
yum install libaio # 安装依赖包
```

检查 MySQL 是否已安装

```bash
yum list installed | grep mysql
```

## 下载

下载 MySQL Yum Repository

```bash
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
```

## 安装

添加 MySQL Yum Repository

```bash
yum localinstall mysql-community-release-el7-5.noarch.rpm
```

验证下是否添加成功

```bash
yum repolist enabled | grep "mysql.*-community.*"
```

选择要启用 MySQL 版本

查看 MySQL 版本，执行
```bash
yum repolist all | grep mysql
```
可以看到 5.5， 5.7 版本是默认禁用的，因为现在最新的稳定版是 5.6

可以通过类似下面的语句来启动某些版本
```bash
yum-config-manager --disable mysql56-community
yum-config-manager --enable mysql57-community-dmr
```
查看当前的启动的 MySQL 版本
```bash
yum repolist enabled | grep mysql
```

通过 Yum 来安装 MySQL
```bash
yum install mysql-community-server 
```

查看 MySQL 的安装目录
```bash
whereis mysql
```

## 启动和关闭 MySQL Server

启动 MySQL Server
```bash
systemctl start  mysqld
```

查看 MySQL Server 状态
```bash
systemctl status  mysqld
```

关闭 MySQL Server
```bash
systemctl stop mysqld
```

## 测试是否安装成功

进入 mysql 命令行界面
```bash
mysql
```

## 防火墙设置

远程访问 MySQL， 需开放默认端口号 3306.

- 方式1：iptables（CentOS 7.x版本之前用法，不推荐）

打开 iptables 的配置文件：
```bash
vi /etc/sysconfig/iptables
```
修改
```
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
```
在里面加入这2行：
```
-A RH-Firewall-1-INPUT -m state –state NEW -m tcp -p tcp –dport 3306 -j ACCEPT
-A RH-Firewall-1-INPUT -m state –state NEW -m udp -p udp –dport 3306 -j ACCEPT
```

如果该 iptables 配置文件 不存在，先执行 yum install iptables-services 安装

执行 iptables 重启生效
```bash
service iptables restart
```

- 方式2：firewall-cmd（推荐）

执行
```bash
firewall-cmd --permanent --zone=public --add-port=3306/tcp
firewall-cmd --permanent --zone=public --add-port=3306/udp
```
这样就开放了相应的端口。

执行
```bash
firewall-cmd --reload 
```
使最新的防火墙设置规则生效。

## MySQL 安全设置

服务器启动后，可以执行
```bash
mysql_secure_installation
```
此时输入 root 原始密码（初始化安装的话为空），接下来，为了安全，MySQL 会提示你重置 root 密码，移除其他用户账号，禁用 root 远程登录，移除 test 数据库，重新加载 privilege 表格等，你只需输入 y 继续执行即可。

至此，整个 MySQL 安装完成。

## 远程访问设置

创建一个普通用户 sa ，密码是 some_pass
```
CREATE USER 'sa'@'%' IDENTIFIED BY 'some_pass';
```

给这个用户授予 SELECT,INSERT,UPDATE,DELETE 的远程访问的权限，这个账号一般用于提供给实施的系统访问
```
GRANT SELECT,INSERT,UPDATE,DELETE  ON *.* TO 'sa'@'%';
```

创建一个管理员用户 admin 账号 ，密码是 some_pass
```
CREATE USER 'admin'@'%' IDENTIFIED BY 'some_pass';
```

给这个用户授予所有的远程访问的权限。这个用户主要用于管理整个数据库、备份、还原等操作。
```
GRANT ALL  ON *.* TO 'admin'@'%';
```

使授权立刻生效
```
flush privileges;
```

## 更改数据存放目录

创建数据存放目录

在 home 目录下建立 data 目录
```bash
mkdir /home/data
```

把 MySQL 服务进程停掉

如果 MySQL 是启动的，要先关闭
```bash
mysqladmin -u root -p shutdown
```

移动数据到数据存放目录

/var/lib/mysql 整个目录移到 /home/data，执行
```bash
mv /var/lib/mysql /home/data
```

这样就把 MySQL 的数据文件移动到了 /home/data/mysql 下

修改 /etc/my.cnf 文件，
```
[mysqld] 
datadir=/home/data/mysql
socket=/home/data/mysql/mysql.sock

[mysql] 
socket=/home/data/mysql/mysql.sock
```

修改权限
```bash
chown -R mysql:mysql /home/data/mysql
```
重启后，如果不能启动 MySQL 服务，执行
```bash
vi  /etc/sysconfig/selinux
```
调整
```
SELINUX=permissive
```
保存设置，执行 reboot 重启生效

## 开机自起

查看 MySQL 服务是否开机启动
```bash
systemctl is-enabled mysql.service;echo $?
```
如果是 enabled 则说明是开机自动，如果不是，执行
```bash
chkconfig --levels 235 mysqld on
```

## 设置字符集

一般的，为了支持中文，我们应该讲字符集设为 UTF-8， 执行
```
SHOW VARIABLES LIKE 'character%';
```
查看当前 MySQL 字符集

可以看到默认服务器的字符器是 latin1 ，对中文不友好。  
修改 /etc/my.cnf 文件，添加字符集的设置
```
[mysqld]   
character_set_server = utf8

[mysql]
default-character-set = utf8
```

## 备份、还原

备份
```bash
mysqldump --socket=/home/data/mysql/mysql.sock --single-transaction=TRUE  -u root -p emsc > emsc.sql

```

还原
```bash
mysql --socket=/home/data/mysql/mysql.sock  -u root -p emsc < emsc.sql
```



----


## 额外安装 

```bash
yum install mysql-connector-c++.x86_64 mysql-connector-c++-devel.x86_64 mysql-connector-python.x86_64
```


----

> https://www.cnblogs.com/adjk/p/6660453.html

<!-- mysql.md ends here -->
