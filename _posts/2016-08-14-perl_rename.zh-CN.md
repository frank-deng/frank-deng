---
layout: post
title: 如何使用Perl的rename工具进行批量重命名
tags: [Shell]
---

去除`.bak`扩展名：

	prename 's/\.bak$//' *

将文件名转换成小写：

	prename 'y/A-Z/a-z/' *

为`.txt`文件加前缀：

	prename 's/(.*).txt$/prefix_$1.txt/' *.txt

ArchLinux上需要安装`perl-rename`包来获得该工具。
