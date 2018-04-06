<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">


<xsl:template match="/">
      <xsl:call-template name="generateTable">
      </xsl:call-template>substring-after($code1,'code=')
</xsl:template>

<xsl:template name="generateTable">
<xsl:variable name="query">SELECT CLIENT_ID,CLIENT_SECRET,REDIRECT_URL FROM DB2INST1.CS</xsl:variable>

    <xsl:variable name="data" select="dp:sql-execute('akhil',$query)"/>

<xsl:variable name='clientid'>
            <xsl:value-of select='$data/sql/row/column[name="CLIENT_ID"]/value/text()'/>
        </xsl:variable>
        <xsl:variable name='clientsecret'>
            <xsl:value-of select='$data/sql/row/column[name="CLIENT_SECRET"]/value/text()'/>
        </xsl:variable>
        <xsl:variable name='redirecturl'>
            <xsl:value-of select='$data/sql/row/column[name="REDIRECT_URL"]/value/text()'/>
        </xsl:variable>
        
    
        <xsl:variable name="qcode" select="//request/args/arg[@name='code']"/>
        <xsl:variable name="code" select="concat('code=',$qcode)"/>
    <xsl:variable name="client_id" select="concat('client_id=',$clientid)"/>
    <xsl:variable name="client_secret" select="concat('client_secret=',$clientsecret)"/>
    <xsl:variable name="redirect_uri" select="concat('redirect_uri=',$redirecturl)"/>
   
    <xsl:variable name='access_token' select="'https://api.ciscospark.com/v1/access_token'"/>
        <xsl:variable name="grant_type" select="'grant_type=authorization_code'"/>



         
         <xsl:variable name="url">
            <xsl:value-of select="concat($access_token,'?',$grant_type,'&amp;',$client_id,'&amp;',$redirect_uri,'&amp;',$client_secret,'&amp;',$code)"/>
         </xsl:variable>
<xsl:message dp:priority="error">
    <xsl:value-of select="concat('StaticCode',$code)"/>
    </xsl:message>
    <xsl:message dp:priority="error">
    <xsl:value-of select="concat('URLFULL',$url)"/>
    </xsl:message>


    <dp:set-variable name="'var://service/routing-url'" value="$url"/>
    
    <xsl:message dp:priority="error">
    <xsl:value-of select="concat('StaticCode',$code)"/>
    </xsl:message>
    <xsl:message dp:priority="error">
    <xsl:value-of select="concat('URLFULL',$url)"/>
    </xsl:message>
</xsl:template>

</xsl:stylesheet>