---
layout: post
title: htmlspecialchars()的JavaScript实现
tags: [HTML, JavaScript]
---

	function htmlspecialchars(s){
		var M={'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#039;'};
		return s.replace(/[&<>"']/g,function(m){return M[m]});
	}

