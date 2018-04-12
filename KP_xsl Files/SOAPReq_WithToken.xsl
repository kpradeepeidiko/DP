<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dp="http://www.datapower.com/extensions"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:dpconfig="http://www.datapower.com/param/config"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:json="http://www.ibm.com/xmlns/prod/2009/jsonx"
    extension-element-prefixes="dp dpconfig">
    
    <xsl:template match="/">
        <xsl:variable name="PinNumber" select="//request/args/arg[@name='PinNumber']/text()"/>
        <xsl:variable name="ApplicationCode" select="//request/args/arg[@name='ApplicationCode']/text()"/>
        
        
        <xsl:variable name="body">
            <soapenv:Envelope xmlns="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                xmlns:add="http://addressvalidation.webservice.opi.detco.com">
                <soapenv:Header/>
                <soapenv:Body>
                    <add:getValidIntersections soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
                        <PinNumber><xsl:value-of select="$PinNumber"/></PinNumber> 
                        <ApplicationCode><xsl:value-of select="$ApplicationCode"/></ApplicationCode>
                    </add:getValidIntersections>
                </soapenv:Body>
            </soapenv:Envelope>
        </xsl:variable>
        <dp:set-variable name="'var://context/input/PinNumber'" value="$PinNumber"/>
        <dp:set-variable name="'var://context/input/ApplicationCode'" value="$ApplicationCode"/>
        
        <xsl:variable name="routing-url" select="'http://192.168.1.59:8005'"/>
        <dp:set-variable name="'var://service/routing-url'" value="$routing-url"/>
       <xsl:copy-of select="$body"/>
    </xsl:template>