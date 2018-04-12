<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	xmlns:dp="http://www.datapower.com/extensions"
	extension-element-prefixes="dp "
	exclude-result-prefixes="dp">

	
        <xsl:template match="/">
		<xsl:variable name="qcode">
			<xsl:value-of select="//request/args/arg[@name='code']"/>
		</xsl:variable>
		<html>
		<body>
		<p>
			<xsl:variable name="code" select="concat('Given Code Value=',$qcode)"/>
			<xsl:value-of select="$code"/>
		</p>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>