---
layout: post
title: 使用QPython测试WebView
tags: [Android, Python]
---

新建一个Python脚本，代码如下：

	#qpy:3
	#qpy:webapp:Title
	#qpy://127.0.0.1:8080

`#qpy:webapp:Title`用于设置WebView的标题。

`#qpy://127.0.0.1:8080`用于设置WebView中打开的URL。

在上述代码末尾添加`#qpy:fullscreen`可以使WebView以全屏方式打开。

