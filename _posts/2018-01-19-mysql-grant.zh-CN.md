---
layout: post
title: 如何解决赋予/收回用户权限时发生Access Denied的情况
tags: [MySQL]
---

1. 停止MySQL服务。
2. 使用命令`mysqld_safe --skip-grant-table`启动MySQL数据库服务。
3. 进行用户权限的赋予、收回操作。
4. 将第2步启动的`mysqld_safe`进程杀掉。
5. 重启MySQL服务。

