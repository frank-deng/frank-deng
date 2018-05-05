---
layout: post
title: Linux命令行下配置Wifi
tags: [Linux]
---

###前期准备

使用`ifconfig -a`命令获取所有可用的网络设备。

###方案1（只需连1个路由器）

将以下配置加入到`/etc/network/interfaces`中：

	auto wlan0
	iface wlan0 inet dhcp
		wpa-ssid "WLAN_SSID"
		wpa-psk "12345678"

其中`wlan0`需要换成需要使用的Wifi设备。

###方案2（根据信号强度连接不同路由器）

**第1步：**创建`/etc/network/wpa_supplicant.conf`，并添加以下配置：

	network={
		ssid="WLAN_SSID_1"
		key_mgmt=WPA-PSK
		psk="WLAN_AP_PSK_1"
		priority=1
	}
	network={
		ssid="WLAN_SSID_2"
		key_mgmt=WPA-PSK
		psk="WLAN_AP_PSK_2"
		priority=2
	}

**第2步：**将以下配置加入到`/etc/network/interfaces`中：

	auto wlan0
	iface wlan0 inet dhcp
		wpa-conf /etc/network/wpa_supplicant.conf

其中`wlan0`需要换成需要使用的Wifi设备。
