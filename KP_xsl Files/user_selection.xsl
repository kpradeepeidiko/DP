<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
xmlns:dp="http://www.datapower.com/extensions"
extension-element-prefixes="dp "
exclude-result-prefixes="dp">
<xsl:template match = "/">
<xsl:variable name="query">select * from db2inst1.cs4</xsl:variable>
<xsl:variable name="data" select="dp:sql-execute('akhil',$query)"/>
<!--
<xsl:for-each select="$data/sql/row">
				<tr>
				<td> <xsl:value-of select="column[name='ROLLNO']/value"/> </td>
				<td> <xsl:value-of select="column[name='STDNAME']/value"/> </td>
				<td> <xsl:value-of select="date:date()"/> </td>
<td><button type="submit">Delete</button></td>
				</tr>
				</xsl:for-each>
-->
<html>
<body>
<p><xsl:value-of select="$data/sql/row/column[name='USER_NAME']/value"/></p>
<div id='sendDev' align="center">
<select id='user'>

<option value='0'>Select</option>
<xsl:for-each select='$data/sql/row'>
				<option>
				<xsl:attribute name="value">
					<xsl:value-of select="column[name='USER_NAME']/value"/>
				</xsl:attribute>
				
				<xsl:value-of select="column[name='USER_NAME']/value"/>
				
				</option>
				
				
</xsl:for-each>
</select><br/>
</div>
<input type='button' value='Get Rooms' id='send' onclick='getrooms()'/>
<script>
function getrooms() {



console.log('IN load DOC');
  var xhttp = new XMLHttpRequest();
var x = document.getElementById("user").value;
console.log('X Value'+x);
window.location.href="http://192.168.3.5:2116/user?username="+x+"";

}
</script>

</body>
</html>



</xsl:template>
</xsl:stylesheet>