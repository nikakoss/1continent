<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:variable name="currency-prefix" select="document('udata://emarket/cart/')/udata/summary/price/@prefix" />
    <xsl:variable name="currency-suffix" select="document('udata://emarket/cart/')/udata/summary/price/@suffix" />

    <xsl:include href="cart.xsl" />
    <xsl:include href="basket.xsl" />
    

   
</xsl:stylesheet>