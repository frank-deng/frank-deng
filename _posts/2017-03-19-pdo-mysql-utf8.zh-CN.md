---
layout: post
title: 如何解决PDO-MySQL的乱码问题
tags: [PHP, MySQL]
---

使用如下DSN初始化PDO-MySQL连接：

	$dsn='mysql:dbname=sausagedb;host=127.0.0.1;charset=utf8'
	$dbconn = new PDO($dsn, $user, $password);

上面的DSN中包含`charset=utf8`，用于指定MySQL所使用的字符集为UTF-8。

如果连接数据库时不设置字符集，即使MySQL表的字符集是UTF-8，插入到MySQL表中的内容也将变为乱码。
