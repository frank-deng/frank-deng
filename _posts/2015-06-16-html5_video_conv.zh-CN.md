---
layout: post
title: 将视频转换成兼容HTML5的格式
tags: [Shell]
---

	ffmpeg -i INPUT_FILE -c:v libx264 -crf 18 -c:a aac -q:a 100 -strict experimental OUTPUT.mp4

