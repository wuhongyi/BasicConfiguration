<!-- firewalld.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 三 7月  3 21:50:28 2019 (+0800)
;; Last-Updated: 三 7月  3 22:00:21 2019 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# firewalld

```bash
# 取消firewalld的锁定

systemctl unmask firewalld

## 使用systemctl start firewalld命令开启防火墙的时候，却开不成功，出现Failed to start firewalld.service: Unit is masked的错误，是firewalld服务被锁定了
```

```bash
# 查看firewalld状态

systemctl status firewalld
```

```bash
# 开启防火墙

systemctl start firewalld

##没有任何提示即开启成功
```

```bash
# 关闭防火墙

systemctl stop firewalld
```

```bash
# 重启防火墙

firewall-cmd --reload
```


```bash
# 查询TCP/UDP的80端口占用情况

firewall-cmd --query-port=80/tcp
firewall-cmd --query-port=80/udp

## 如果返回结果为“no”，则表示该端口尚未开放
```



```bash
# 永久开放TCP/UDP的端口

firewall-cmd --permanent --zone=public --add-port=3306/tcp

firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=80/udp


## 提示FirewallD is not running，则防火墙没开启
```


```bash
# 启动 Apache
systemctl start httpd

# 重启http服务
systemctl restart httpd

##查询状态
systemctl status httpd

##  默认监听80端口 /var/www/html
```



<!-- firewalld.md ends here -->
