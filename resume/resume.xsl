<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output method="html" doctype-system="" version="5.0" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*" />

<xsl:template name='show-time'>
	<xsl:param name="year"/>
	<xsl:param name="month"/>
	<xsl:param name="year2"/>
	<xsl:param name="month2"/>
	<xsl:value-of select="$year"/>年<xsl:value-of select="$month"/>月<!--
	--><xsl:choose>
		<xsl:when test="$year2 != '' and $month2 != ''"> - <xsl:value-of select="$year2"/>年<xsl:value-of select="$month2"/>月</xsl:when>
		<xsl:otherwise> 至今</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match='/'>
<html>
	<head>
		<meta charset='UTF-8'/>
		<title><xsl:value-of select='/resume/main/name'/>　<xsl:value-of select='/resume/main/direction'/>　<xsl:value-of select='/resume/main/years'/>年</title>
		<link rel='stylesheet' type='text/css' href='resume.css'/>
	</head>
	<body>
		<h1><xsl:value-of select='/resume/main/name'/>　<xsl:value-of select='/resume/main/direction'/>　<xsl:value-of select='/resume/main/years'/>年</h1>

		<h2>基本信息</h2>
		<table class='maininfo'>
			<tr>
				<th>性别</th><td>
					<xsl:choose>
						<xsl:when test='/resume/main/gender = 0'>男</xsl:when>
						<xsl:when test='/resume/main/gender = 1'>女</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</td>
				<th>手机</th><td><xsl:value-of select='/resume/main/mobile'/></td>
			</tr>
			<tr>
				<th>邮箱</th><td><xsl:value-of select='/resume/main/email'/></td>
				<th>英语水平</th><td><xsl:value-of select='/resume/main/englishSkill'/></td>
			</tr>
			<tr>
				<th>个人主页</th><td><xsl:value-of select='/resume/main/homepage'/></td>
				<th>GitHub</th><td><xsl:value-of select='/resume/main/github'/></td>
			</tr>
		</table>

		<h2>自我评价</h2>
		<p><xsl:value-of select='/resume/self-assessment'/></p>

		<h2>项目经验</h2>
		<ul>
		<xsl:for-each select='/resume/projects/project'>
			<xsl:sort select="time/from/year" data-type="number" order="descending"/>
			<xsl:sort select="time/from/month" data-type="number" order="descending"/>
			<li class='project-experience'>
				<h3><xsl:value-of select='name'/></h3>
				<p>时间：<!--
					--><xsl:call-template name="show-time">
						<xsl:with-param name="year" select="time/from/year"/>
						<xsl:with-param name="month" select="time/from/month"/>
						<xsl:with-param name="year2" select="time/to/year"/>
						<xsl:with-param name="month2" select="time/to/month"/>
					</xsl:call-template><!--
				--></p>
				<p><xsl:value-of select='desc'/></p>
			</li>
		</xsl:for-each>
		</ul>

		<h2>工作经历</h2>
		<table>
			<tr>
				<th>时间</th>
				<th>公司名称</th>
				<th>职位</th>
				<th>工作描述</th>
			</tr>
			<xsl:for-each select='/resume/companies/company'>
				<xsl:sort select="time/from/year" data-type="number" order="descending"/>
				<xsl:sort select="time/from/month" data-type="number" order="descending"/>
				<tr>
					<td>
						<xsl:call-template name="show-time">
							<xsl:with-param name="year" select="time/from/year"/>
							<xsl:with-param name="month" select="time/from/month"/>
							<xsl:with-param name="year2" select="time/to/year"/>
							<xsl:with-param name="month2" select="time/to/month"/>
						</xsl:call-template>
					</td>
					<td><xsl:value-of select='name'/></td>
					<td><xsl:value-of select='title'/></td>
					<td class='warpline'><xsl:value-of select='desc'/></td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>教育背景</h2>
		<table>
			<tr>
				<th>时间</th>
				<th>院校</th>
				<th>专业</th>
				<th>学历</th>
			</tr>
			<xsl:for-each select='/resume/education-experience/education'>
				<tr>
					<td>
						<xsl:call-template name="show-time">
							<xsl:with-param name="year" select="time/from/year"/>
							<xsl:with-param name="month" select="time/from/month"/>
							<xsl:with-param name="year2" select="time/to/year"/>
							<xsl:with-param name="month2" select="time/to/month"/>
						</xsl:call-template>
					</td>
					<td><xsl:value-of select='college'/></td>
					<td><xsl:value-of select='major'/></td>
					<td><xsl:value-of select='degree'/></td>
				</tr>
			</xsl:for-each>
		</table>

		<h2>其它</h2>
		<p><xsl:value-of select='resume/about'/></p>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>
