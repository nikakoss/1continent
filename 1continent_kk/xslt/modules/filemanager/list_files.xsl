<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" xmlns:udt="http://umi-cms.ru/2007/UData/templates" xmlns:xlink="http://www.w3.org/TR/xlink" exclude-result-prefixes="xsl date udt xlink">

	<xsl:template match="result[@module = 'filemanager'][@method = 'list_files']"> </xsl:template>

	<xsl:template match="udata[@module = 'filemanager'][@method = 'list_files']" mode="list_file">
		<xsl:apply-templates select="items" mode="list_files"/>
	</xsl:template>

	<xsl:template match="items" mode="list_files">
		<xsl:variable name="fs_file" select="document(concat('upage://',@id,'.fs_file'))/udata/property/value"/>
		<xsl:variable name="file" select="document(concat('ufs://',$fs_file))/udata/file"/>
		<li>
			<a href="{$fs_file}" target="_blank">
				<span class="file_img"/>
				<xsl:value-of select="@name"/><!-- .<xsl:value-of select="$file/@ext"/> -->
			</a> 
			<!-- 
			(<xsl:choose>
				<xsl:when test="$file/@size &gt; '1073741824'">
					<xsl:value-of select="format-number($file/@size div '1073741824', '#.##')"/> Gб) </xsl:when>
				<xsl:when test="$file/@size &gt; '1048576'">
					<xsl:value-of select="format-number($file/@size div '1048576', '#.##')"/> Мб) </xsl:when>
				<xsl:when test="$file/@size &gt; '1024'">
					<xsl:value-of select="format-number($file/@size div '1024', '#.##')"/> Kб) </xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="format-number($file/@size, '#.##')"/> б) </xsl:otherwise>
			</xsl:choose>
			 -->
		</li>
	</xsl:template>

</xsl:stylesheet>
