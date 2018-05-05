---
layout: post
title: 通过User Agent获取浏览器类型
tags: [HTML, JavaScript]
---

	function deviceType() {
		var ua = window.navigator.userAgent;
		if (/iphone|android.*mobile/i.test(ua)) {
			return 'mobile';
		} else if (/ipad|android/i.test(ua)) {
			return 'pad';
		}
		return undefined;
	}

手机浏览器返回`mobile`，平板浏览器返回`pad`，PC浏览器和其它类型的浏览器返回`undefined`。

