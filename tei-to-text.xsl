<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:template match="body">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="teiHeader"/>
  
  <xsl:template match="div1[@type='abstract']">
    <xsl:text>Page </xsl:text><xsl:value-of select="pb/@seq"/><xsl:text>&#10;&#10;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#10;&#10;</xsl:text>
  </xsl:template>
  
  <xsl:template match="div1[@type='letter']">
    <!-- 
      adapted the following from an example Syd Bauman shared on the TEI Listserv
      
      convert 
        <pb ref="a1"><p>things in an example<del>s</del> to <date>2020-03-30</date>
        some other stuff.</p><p>the idea being that we're going to provide a simple 
        text document.<pb ref="a2"/></p><p>here's some text on the second page.</p>
      to
        Page a1
        things in an examples to 2020-03-30 some other stuff. the idea being that
        we're going to provide a simple text document.
        
        Page a2
        here's some text on the second page.
      
      aside from some newlines, wrapping/line length is not important.
      
      the for-each-group selects all text (`.//text()`) and groups it around preceding `pb`
      elements. the `generate-id()` function ensures a unique id per pb.
    -->
    <xsl:for-each-group group-by="preceding::pb[1]/generate-id()" select=".//text()">
      <xsl:text>Page </xsl:text>
      <xsl:value-of select="count(preceding::pb)"/>
      <xsl:text>&#10;&#10;</xsl:text>
      <xsl:value-of select="normalize-space(string-join(current-group(), ' '))"/>
      <xsl:text>&#10;&#10;</xsl:text>
    </xsl:for-each-group>
  </xsl:template>

</xsl:stylesheet>