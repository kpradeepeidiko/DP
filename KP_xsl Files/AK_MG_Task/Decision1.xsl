<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:dp="http://www.datapower.com/extensions"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:dpconfig="http://www.datapower.com/param/config"
    xmlns:SOAP="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:json="http://www.ibm.com/xmlns/prod/2009/jsonx"
    extension-element-prefixes="dp dpconfig"
    xmlns:n0="http://dteco.com/CustomerService/SelfService">
    <xsl:template match="/">
        <!-- <xsl:variable name="result" select="/*[namespace-uri()='http://schemas.xmlsoap.org/soap/envelope/' and local-name()='Envelope']/*[namespace-uri()='http://schemas.xmlsoap.org/soap/envelope/' and local-name()='Body']/*[namespace-uri()='http://dteco.com/CustomerService/SelfService' and local-name()='getValidatePinLoginResponse']/MessageReply/replyCode/text()"/>-->
        <xsl:variable name="result" select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/MessageReply/replyCode/text()"/>
        <xsl:variable name="PinNumber" select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/PinNumber/text()"/>
        <xsl:variable name="Timestamp" select="date:date-time()"/>
        <xsl:variable name="Token" select="dp:encode(concat($PinNumber,':',$Timestamp),'base-64')"/>
        <xsl:choose>
            <xsl:when test="$result='Success'">
                
                <json:object name="getValidatePinLoginResponse">
                    <json:string name="Token"><xsl:value-of select="$Token"/></json:string>
                    <json:string name="BusinessPartner"><xsl:value-of select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/BusinessPartner/text()"/></json:string>
                    <json:string name="PinNumber"><xsl:value-of select="$PinNumber"/></json:string>
                    <json:string name="ApplicationCode"><xsl:value-of select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/Type/text()"/></json:string>
                    <json:string name="AgencyName"><xsl:value-of select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/AgencyName/text()"/></json:string>
                    <json:string name="ContactName"><xsl:value-of select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/ContactName/text()"/></json:string>
                    <json:string name="PhoneNumber"><xsl:value-of select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/PhoneNumber/text()"/></json:string>
                    <json:string name="Status"><xsl:value-of select="//SOAP:Envelope/SOAP:Body/n0:getValidatePinLoginResponse/Status/text()"/></json:string>
                </json:object>  
              
            </xsl:when>
            <xsl:otherwise>
                
            </xsl:otherwise>
            
        </xsl:choose>       
    </xsl:template>
    
</xsl:stylesheet>