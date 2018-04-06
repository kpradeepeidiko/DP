<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:str="http://exslt.org/strings"
    xmlns:dp="http://www.datapower.com/extensions"
    extension-element-prefixes="dp"
    exclude-result-prefixes="dp"
    version="1.0">
    <xsl:output method="text" media-type="application/json"/>
    
    <xsl:variable name="at">
       <xsl:value-of select="'NDgzN2M5MDYtY2VkNi00N2EwLWIwYjctZDQxODQ0Nzg2YTkwMmRjYTAxYzMtZmVk'"/>
    </xsl:variable>   
 
    <xsl:template match="/">


    <xsl:variable name="userurl">
       <xsl:value-of select="'https://api.ciscospark.com/v1/rooms'"/>
    </xsl:variable>

    <xsl:variable name="headerValues">
		<header name="Authorization">
			<xsl:value-of select="concat('Bearer ',$at)"/>
		</header>
    </xsl:variable>

	<xsl:variable name="resp">
      <dp:url-open target="{$userurl}" response="binaryNode" http-headers="$headerValues" http_method="get" ssl-proxy="client:Spark_SSL" /> 
	</xsl:variable>   

	<dp:set-http-request-header name="Content-Type" value="application/json"/>

	<xsl:variable name="json"> 
		<xsl:value-of select="dp:decode(dp:binary-encode($resp/result/binary/node()),'base-64')"/> 
	</xsl:variable>
        
	<xsl:value-of select="$json"/>
		<xsl:message dp:priority="error">
			..........ERROR..JSON..DATA........... 
		</xsl:message>


    </xsl:template>
</xsl:stylesheet>
   

