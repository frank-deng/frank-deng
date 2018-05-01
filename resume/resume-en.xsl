<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output method="html" doctype-system="" version="5.0" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*" />


<xsl:template name='show-month'>
	<xsl:param name="month"/>
	<xsl:choose>
		<xsl:when test="$month = 1">January</xsl:when>
		<xsl:when test="$month = 2">February</xsl:when>
		<xsl:when test="$month = 3">March</xsl:when>
		<xsl:when test="$month = 4">April</xsl:when>
		<xsl:when test="$month = 5">May</xsl:when>
		<xsl:when test="$month = 6">June</xsl:when>
		<xsl:when test="$month = 7">July</xsl:when>
		<xsl:when test="$month = 8">August</xsl:when>
		<xsl:when test="$month = 9">September</xsl:when>
		<xsl:when test="$month = 10">October</xsl:when>
		<xsl:when test="$month = 11">November</xsl:when>
		<xsl:when test="$month = 12">December</xsl:when>
	</xsl:choose>
</xsl:template>
<xsl:template name='show-time'>
	<xsl:param name="year"/>
	<xsl:param name="month"/>
	<xsl:param name="year2"/>
	<xsl:param name="month2"/>

	<xsl:call-template name="show-month">
		<xsl:with-param name="month" select="$month"/>
	</xsl:call-template>&#160;<xsl:value-of select="$year"/>
	<xsl:choose>
		<xsl:when test="$year2 != '' and $month2 != ''"> - <!--
			--><xsl:call-template name="show-month">
				<xsl:with-param name="month" select="$month2"/>
			</xsl:call-template>&#160;<xsl:value-of select="$year2"/>
		</xsl:when>
		<xsl:otherwise> - Now</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match='/'>
<html>
	<head>
		<meta charset='UTF-8'/>
		<title><xsl:value-of select='/resume/main/name'/> - <xsl:value-of select='/resume/main/direction'/> - <xsl:value-of select='/resume/main/years'/> Years</title>
		<link rel='stylesheet' type='text/css' href='resume.css'/>
	</head>
	<body>
		<h1><xsl:value-of select='/resume/main/name'/> - <xsl:value-of select='/resume/main/direction'/> - <xsl:value-of select='/resume/main/years'/> Years</h1>

		<h2>Basic Information</h2>
		<table class='maininfo'>
			<tr>
				<th>Gender</th><td>
					<xsl:choose>
						<xsl:when test='/resume/main/gender = 0'>Male</xsl:when>
						<xsl:when test='/resume/main/gender = 1'>Female</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</td>
				<th>Mobile</th><td><xsl:value-of select='/resume/main/mobile'/></td>
			</tr>
			<tr>
				<th>E-mail</th><td><xsl:value-of select='/resume/main/email'/></td>
				<th>English Skill</th><td><xsl:value-of select='/resume/main/englishSkill'/></td>
			</tr>
			<tr>
				<th>Homepage</th><td><xsl:value-of select='/resume/main/homepage'/></td>
				<th>GitHub</th><td><xsl:value-of select='/resume/main/github'/></td>
			</tr>
		</table>

		<h2>Self Assessment</h2>
		<p><xsl:value-of select='/resume/self-assessment'/></p>

		<h2>Project Experience</h2>
		<ul>
		<xsl:for-each select='/resume/projects/project'>
			<xsl:sort select="time/from/year" data-type="number" order="descending"/>
			<xsl:sort select="time/from/month" data-type="number" order="descending"/>
			<li class='project-experience'>
				<h3><xsl:value-of select='name'/></h3>
				<p>Date: <!--
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

		<h2>Work Experience</h2>
		<table>
			<tr>
				<th>Date</th>
				<th>Company</th>
				<th>Job Title</th>
				<th>Description</th>
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

		<h2>Education Background</h2>
		<table>
			<tr>
				<th>Date</th>
				<th>School</th>
				<th>Major</th>
				<th>Degree</th>
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

		<h2>Miscellaneous</h2>
		<p><xsl:value-of select='resume/about'/></p>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>
