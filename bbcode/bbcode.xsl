<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" indent="no"/>
	<xsl:strip-space elements="*"/>

	<!-- Configuration -->
	<xsl:param name="list-style" select="'default'"/>

	<xsl:template match="/">
    <xsl:apply-templates/>
	</xsl:template>

	<!-- ¤head -->
	<xsl:template match="h1 | h2 | h3 | h4 | h5 | h6">
		<xsl:text>&#x0a;</xsl:text>[b]<xsl:apply-templates/>[/b]<xsl:text>&#x0a;&#x0a;</xsl:text>
	</xsl:template>

	<xsl:template match="div | br">
    <xsl:apply-templates/><xsl:text>&#x0a;</xsl:text>
	</xsl:template>

	<xsl:template match="p">
    <xsl:text>&#x0a;</xsl:text><xsl:apply-templates/><xsl:text>&#x0a;</xsl:text>
	</xsl:template>

  <xsl:template match="b | strong">
    <xsl:text/>[b]<xsl:apply-templates/>[/b]<xsl:text/>
  </xsl:template>

	<xsl:template match="i | em">
    <xsl:text/>[i]<xsl:apply-templates/>[/i]<xsl:text/>
	</xsl:template>

	<xsl:template match="u">
    <xsl:text/>[u]<xsl:apply-templates/>[/u]<xsl:text/>
	</xsl:template>

	<xsl:template match="del">
    <xsl:text/>[s]<xsl:apply-templates/>[/s]<xsl:text/>
	</xsl:template>

	<xsl:template match="center">
    <xsl:text/>[center]<xsl:apply-templates/>[/center]<xsl:text/>
	</xsl:template>

	<xsl:template match="code">
    <xsl:text/>[code]<xsl:apply-templates/>[/code]<xsl:text/>
	</xsl:template>

	<xsl:template match="blockquote">
    <xsl:text/>[quote]<xsl:apply-templates/>[/quote]<xsl:text/>
	</xsl:template>

	<xsl:template match="a">
    <xsl:text/>[url=<xsl:value-of select="@href"/>]<xsl:apply-templates/>[/url]<xsl:text/>
	</xsl:template>

	<xsl:template match="img">
    <xsl:text/>[img]<xsl:value-of select="@src"/><xsl:apply-templates/>[/img]<xsl:text/>
	</xsl:template>

	<!-- ¤list -->

  <xsl:template match="ul">
		<xsl:choose>
			<xsl:when test="$list-style = 'official'">
				<xsl:text/>[ul]<xsl:apply-templates/>[/ul]<xsl:text>&#x0a;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
  </xsl:template>

	<xsl:template match="ul/li">
		<xsl:choose>
			<xsl:when test="$list-style = 'official'">
				<xsl:text/>[li]<xsl:apply-templates/>[/li]<xsl:text>&#x0a;</xsl:text>
			</xsl:when>
			<xsl:when test="$list-style = 'simple'">
				<xsl:text/>[*]<xsl:apply-templates/><xsl:text>&#x0a;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text/>* <xsl:apply-templates/><xsl:text>&#x0a;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
  </xsl:template>

  <xsl:template match="ol">
		<xsl:choose>
			<xsl:when test="$list-style = 'official'">
				<xsl:text/>[ol]<xsl:apply-templates/>[/ol]<xsl:text>&#x0a;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
  </xsl:template>

	<xsl:template match="ol/li">
		<xsl:choose>
			<xsl:when test="$list-style = 'official'">
				<xsl:text/>[li]<xsl:apply-templates/>[/li]<xsl:text>&#x0a;</xsl:text>
			</xsl:when>
			<xsl:when test="$list-style = 'simple'">
				<xsl:text/>[#]<xsl:apply-templates/><xsl:text>&#x0a;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text/><xsl:value-of select="position()"/>. <xsl:apply-templates/><xsl:text>&#x0a;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
  </xsl:template>

	<xsl:template match="table">
    <xsl:text/>[table]<xsl:text>&#x0a;</xsl:text><xsl:apply-templates/>[/table]<xsl:text>&#x0a;</xsl:text>
	</xsl:template>

	<xsl:template match="tr">
    <xsl:text/>[tr]<xsl:apply-templates/>[/tr]<xsl:text>&#x0a;</xsl:text>
	</xsl:template>

	<xsl:template match="th">
    <xsl:text/>[th]<xsl:apply-templates/>[/th]<xsl:text/>
	</xsl:template>

	<xsl:template match="td">
    <xsl:text/>[td]<xsl:apply-templates/>[/td]<xsl:text/>
	</xsl:template>

	<xsl:template match="font">
<xsl:if test="@color">[color=<xsl:value-of select="@color"/>]</xsl:if><xsl:if test="@size">[size=<xsl:value-of select="@size"/>]</xsl:if><xsl:apply-templates/><xsl:if test="@size">[/size]</xsl:if><xsl:if test="@color">[/color]</xsl:if>
	</xsl:template>

	<!-- Handle arbitrary element with CSS styling -->
	<xsl:template match="*[@style]">
		<xsl:variable name="style" select="concat(translate(@style,' ',''),';')"/>
		<xsl:if test="contains($style,'font-style:italic')">[i]</xsl:if>
		<xsl:if test="contains($style,'font-weight:bold')">[b]</xsl:if>
		<xsl:if test="contains($style,'color:')">[color=<xsl:value-of select="substring-before(substring-after(@style,'color:'),';')"/>]</xsl:if>
		<!-- Either px or pt. Todo: Better handling of errors. -->
		<xsl:if test="contains($style,'font-size:')">[size=<xsl:value-of select="substring-before(substring-after($style,'font-size:'),'px')"/><xsl:value-of select="substring-before(substring-after($style,'font-size:'),'pt')"/>]</xsl:if>
		<xsl:apply-templates/>
		<xsl:if test="contains($style,'font-size:')">[/size]</xsl:if>
		<xsl:if test="contains($style,'color:')">[/color]</xsl:if>
		<xsl:if test="contains($style,'font-weight:bold')">[/b]</xsl:if>
		<xsl:if test="contains($style,'font-style:italic')">[/i]</xsl:if>
	</xsl:template>
</xsl:stylesheet>
