---
layout: post
title: 如何在浏览器中捕获JS的语法错误
tags: [HTML, JavaScript]
---

在`<head>`标签中添加以下代码：

	<script type='text/javascript'>
	    window.addEventListener('error',function(e){
	        alert(e.filename+'\nLine '+e.lineno+'\n'+e.message);
	    });
	</script>

