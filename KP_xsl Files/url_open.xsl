<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:str="http://exslt.org/strings"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp"
exclude-result-prefixes="dp"
version="1.0">
<xsl:template match="/">

<xsl:variable name="body">
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://www.webserviceX.NET">
   <soapenv:Header/>
   <soapenv:Body>
      <web:GetCitiesByCountry>
         <!--Optional:-->
         <web:CountryName>india</web:CountryName>
      </web:GetCitiesByCountry>
   </soapenv:Body>
</soapenv:Envelope>
</xsl:variable>

<xsl:variable name="httpHeaders">
  <header name="SOAPAction">http://www.webserviceX.NET/GetCitiesByCountry</header>
  <header name="Content-Type">text/xml</header>
</xsl:variable>

<xsl:variable name="response">
  <dp:url-open target="http://www.webservicex.com/globalweather.asmx" http-headers="$httpHeaders" http-method="post">
    <xsl:copy-of select="$body"/>
  </dp:url-open>
</xsl:variable>

<xsl:copy-of select="$response"/>
</xsl:template>

</xsl:stylesheet>