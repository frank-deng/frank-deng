---
layout: post
title: Bash Shell按行遍历标准输出
tags: [Shell]
---

	IFS=$'\n';
	for LINE in `ls`; do
		#Do some works on "${LINE}"
	done;
