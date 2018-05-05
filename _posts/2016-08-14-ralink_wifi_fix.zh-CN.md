---
layout: post
title: Debian/Ubuntu下修复华硕笔记本的Wifi
tags: [Linux]
---

如果华硕笔记本上的Wifi模块是Ralink的，安装完Debian/Ubuntu后会出现Wifi无法使用的情况。同时在终端运行`sudo rfkill list all`命令后会有如下输出：

	0: phy0: Wireless LAN
		Soft blocked: no
		Hard blocked: yes
	1: asus-wlan: Wireless LAN
		Soft blocked: no
		Hard blocked: no

###如何修复Wifi

创建`/etc/modprobe.d/asus.conf`，并在文件中添加如下内容：

	options asus_nb_wmi wapf=4

然后重启。
