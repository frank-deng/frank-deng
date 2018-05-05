---
layout: post
title: Linux命令行下捕获系统声音
tags: [Linux]
---

当pulseaudio被用于管理系统声音时，可以在命令行环境下使用`pacat`命令捕获系统声音。

###步骤1：找到用于捕获系统声音的设备

使用以下命令找到用于捕获系统声音的设备：

	pacmd list | grep "\.monitor"
	
当看到如下输出时：

		name: <alsa_output.pci-0000_00_1b.0.analog-stereo.monitor>
		alsa_output.pci-0000_00_1b.0.analog-stereo.monitor/#0: Monitor of Built-in Audio Analog Stereo
		
就可以找到用于捕获系统声音的设备了。在上述输出内容中，可以找到设备名如下：

	alsa_output.pci-0000_00_1b.0.analog-stereo.monitor

###步骤2：开始捕获系统声音

以下例子描述了如何将系统声音拷贝到`.wav`文件中，并使用CD音质。

使用`sox`的命令:

	pacat --record -d alsa_output.pci-0000_00_1b.0.analog-stereo.monitor | sox -t raw -r 44100 -s -L -b 16 -c 2 - output.wav
	
使用`ffmpeg`的命令:
	
	pacat --record -d alsa_output.pci-0000_00_1b.0.analog-stereo.monitor | ffmpeg -f s16le -ar 44.1k -ac 2 -i pipe:0 record.wav
