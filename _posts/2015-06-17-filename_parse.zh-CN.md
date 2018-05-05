---
layout: post
title: Bash Shell从给定文件名中获取基本名和扩展名
tags: [Shell]
---

	BASENAME="${FILENAME%.*}";
	EXTENSION="${FILENAME##*.}";
