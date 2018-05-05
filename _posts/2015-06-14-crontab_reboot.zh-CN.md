---
layout: post
title: 使用crontab实现开机自动运行脚本
tags: [Linux]
---

将以下内容加入到`/etc/crontab`中：

	@reboot    username    /path/to/script arguments

