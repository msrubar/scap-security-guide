<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xccdf="http://checklists.nist.gov/xccdf/1.1"
xmlns:xhtml="http://www.w3.org/1999/xhtml"
exclude-result-prefixes="xccdf">

  <xsl:variable name="cceuri">http://cce.mitre.org</xsl:variable>
  <xsl:variable name="ovaluri"> http://oval.mitre.org/XMLSchema/oval-definitions-5</xsl:variable>
  <xsl:variable name="ovalpath"> oval:org.scap-security-guide.rhel:def:</xsl:variable>
  <xsl:variable name="ovalfile">rhel6-oval.xml</xsl:variable>

  <!-- Content:template -->
  <xsl:template match="Benchmark">
    <xsl:copy>
      <xsl:attribute name="xmlns">
        <xsl:text>
http://checklists.nist.gov/xccdf/1.1
</xsl:text>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <!-- expand reference to CCE ID -->
  <xsl:template match="Rule/ident">
    <ident>
      <xsl:attribute name="system">
        <xsl:value-of select="$cceuri" />
      </xsl:attribute>
      <xsl:value-of select="@cce" />
    </ident>
  </xsl:template>

  <xsl:template match="Rule/ref">
    <xccdf:reference>
      <xsl:value-of select="@nist" />
    </xccdf:reference>
  </xsl:template>

  <!-- expand reference to OVAL ID -->
  <xsl:template match="Rule/oval">
    <check>
      <xsl:attribute name="system">
        <xsl:value-of select="$ovaluri" />
      </xsl:attribute>
      <check-content-ref>
        <xsl:attribute name="href">
          <xsl:value-of select="$ovalfile" />
        </xsl:attribute>
        <xsl:attribute name="name">
          <xsl:value-of select="$ovalpath" />
        </xsl:attribute>
      </check-content-ref>
    </check>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>

  <!-- CORRECTING TERRIBLE ABUSE OF NAMESPACES BELOW -->
  <!-- (expanding xhtml tags back into the xhtml namespace) -->
  <xsl:template match="br">
    <xhtml:br />
  </xsl:template>

  <xsl:template match="ul">
    <xhtml:ul>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:ul>
  </xsl:template>

  <xsl:template match="li">
    <xhtml:li>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:li>
  </xsl:template>

  <xsl:template match="code">
    <xhtml:code>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:code>
  </xsl:template>

  <xsl:template match="b">
    <xhtml:b>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:b>
  </xsl:template>

  <xsl:template match="em">
    <xhtml:em>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:em>
  </xsl:template>

  <xsl:template match="ol">
    <xhtml:ol>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:ol>
  </xsl:template>

  <xsl:template match="pre">
    <xhtml:pre>
      <xsl:copy>
        <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
    </xhtml:pre>
  </xsl:template>
</xsl:stylesheet>