<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/TR/xlink">
    <xsl:output encoding="utf-8" method="html" indent="yes"/>
    <xsl:variable name="errors" select="document('udata://system/listErrorMessages')/udata"/>
    <xsl:variable name="lang-prefix" select="/result/@pre-lang"/>
    <xsl:variable name="document-page-id" select="/result/@pageId"/>
    <xsl:variable name="document-title" select="/result/@title"/>
    <xsl:variable name="user-type" select="/result/user/@type"/>
    <xsl:variable name="domain" select="/result/@domain"/>
    <xsl:variable name="module" select="/result/@module"/>
    <xsl:variable name="method" select="/result/@method"/>
    
    <xsl:variable name="current_catalog" select=".//page[@parentId = '1252' and @is-active = '1']/@link"/>
    <xsl:variable name="is-home" select="result[@module='content' and @method='content' and page/@is-default = '1']"/>
    
    <xsl:variable name="global_parameters" select="document('upage://krasnodar/home/global_parameters/')//group[@name = 'glavnaya_stranica']"/>
    <xsl:variable name="about_as" select="document('upage://about_as')"/>
    
    <xsl:param name="search_string" />
    <xsl:param name="p">0</xsl:param>
    <xsl:param name="choice_url">0</xsl:param>
    <!--xsl:param name="raion" >550</xsl:param-->
    <xsl:param name="raion" />
    
    
    <xsl:param name="template-resources"/>

    <xsl:include href="layouts/layout.xsl"/>
    <xsl:include href="modules/content/menu.xsl"/>
    <xsl:include href="modules/content/content.xsl"/>
    <xsl:include href="modules/content/comments.xsl"/>
    <xsl:include href="modules/content/forms.xsl"/>
    <xsl:include href="modules/catalog/catalog.xsl"/>
    <xsl:include href="modules/catalog/filter.xsl"/>
    <xsl:include href="modules/catalog/detail.xsl"/>
    <xsl:include href="modules/numpages.xsl"/>
    <xsl:include href="modules/emarket/basket.xsl"/>
    <xsl:include href="modules/emarket/cart.xsl"/>
    <xsl:include href="modules/blogs20/blog.xsl"/>
    <xsl:include href="modules/news/news.xsl"/>
        
    <!--xsl:include href="modules/content/forms.xsl"/>
    <xsl:include href="modules/filemanager/list_files.xsl"/>
    <xsl:include href="modules/news/news.xsl"/-->
    
</xsl:stylesheet>