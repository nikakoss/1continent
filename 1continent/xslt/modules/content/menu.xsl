<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="header_menu">
        <ul>
            <xsl:apply-templates select="items/item" mode="header_menu"/>
            <li style="float: none; clear: both;"/>
        </ul>
    </xsl:template>
    <xsl:template match="item" mode="header_menu">
        <li>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="@link"/>
                </xsl:attribute>
                <xsl:if test="@alt-name = 'o_gorode' or @alt-name = 'kontakty' or @alt-name = 'blog'">
                    <xsl:attribute name="rel">
                        <xsl:text>nofollow</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="title">
                    <xsl:value-of select="@name"/>
                </xsl:attribute>
                <span>
                    <xsl:value-of select="@name"/>
                </span>
            </a>
            <xsl:if test="document(concat('upage://',@id))//property[@name = 'show_submenu']/value = '1'">
                <xsl:apply-templates select="document(concat('udata://content/menu/0/1/', @id))/udata[items/item]" mode="header_menu"/>
            </xsl:if>

        </li>
    </xsl:template>
    <xsl:template match="item[@status = 'active']" mode="header_menu">
        <li class="active">
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="@link"/>
                </xsl:attribute>
                <xsl:if test="@alt-name = 'o_gorode' or @alt-name = 'kontakty' or @alt-name = 'blog'">
                    <xsl:attribute name="rel">
                        <xsl:text>nofollow</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="title">
                    <xsl:value-of select="@name"/>
                </xsl:attribute>
                <span>
                    <xsl:value-of select="@name"/>
                </span>
            </a>
            <xsl:if test="document(concat('upage://',@id))//property[@name = 'show_submenu']/value = '1'">
                <xsl:apply-templates select="document(concat('udata://content/menu/0/1/', @id))/udata[items/item]" mode="header_menu"/>
            </xsl:if>
        </li>
    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- PRODUCTS and PRICES -->
    <!--===========================================================================================================================-->
    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="article_list">
        <xsl:apply-templates select="items" mode="article_list"/>
    </xsl:template>

    <xsl:template match="items" mode="article_list">
        <xsl:apply-templates select="item" mode="article_list"/>
    </xsl:template>

    <xsl:template match="item" mode="article_list">

        <xsl:variable name="title" select="document(concat('upage://',@id,'.h1'))//value"/>
        <xsl:variable name="anons_img" select="document(concat('upage://',@id,'.anons_img'))//value"/>
        <xsl:variable name="content" select="document(concat('upage://',@id,'.content'))//value"/>
        <xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>
        <xsl:variable name="desc" select="document(concat('upage://',@id))//property[@name = 'content']/value"/>


        <div class="object">
            <div class="obj_photo">
                <a href="{$link}">
                    <img alt="{$title}" title="{$title}">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/294/263/default/0/1/5/80'))//src"/>
                        </xsl:attribute>
                    </img>
                </a>
            </div>
            <div class="obj_info">
                <h4 class="obj_title">
                    <a href="{$link}">
                        <xsl:value-of select="$title"/>
                    </a>
                </h4>
                <div class="obj_desc">
                    <xsl:call-template name="firstWords">
                        <xsl:with-param name="value" select="$desc"/>
                        <xsl:with-param name="count" select="42"/>
                    </xsl:call-template>
                </div>
                <div class="obj_button">
                    <a href="" class="">Подробнее</a>
                </div>
            </div>
        </div>


    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- FAQ -->
    <!--===========================================================================================================================-->

    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="faq">
        <xsl:apply-templates select="items" mode="faq"/>
    </xsl:template>
    <xsl:template match="items" mode="faq">
        <xsl:apply-templates select="item" mode="faq"/>
    </xsl:template>
    <xsl:template match="item" mode="faq">

        <xsl:variable name="title" select="document(concat('upage://',@id,'.h1'))//value"/>
        <xsl:variable name="content" select="document(concat('upage://',@id,'.content'))//value"/>

        <div class="faq">
            <div class="f_q">
                <h3>
                    <xsl:value-of select="$title"/>
                </h3>
            </div>
            <div class="f_a">
                <xsl:value-of select="$content" disable-output-escaping="yes"/>
            </div>
        </div>
    </xsl:template>

    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <xsl:template match="udata[@module = 'content'][@method = 'menu']" mode="footer_menu">
        <ul>
            <xsl:apply-templates select="items/item" mode="footer_menu"/>
        </ul>
    </xsl:template>
    <xsl:template match="item" mode="footer_menu">
        <li>
            <a href="{@link}" title="">
                <xsl:attribute name="title">
                    <xsl:value-of select="@name"/>
                </xsl:attribute>
                <span>
                    <xsl:value-of select="@name"/>
                </span>
            </a>
        </li>
    </xsl:template>

</xsl:stylesheet>
