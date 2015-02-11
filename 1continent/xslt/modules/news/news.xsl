<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- СПИСОК НОВОСТЕЙ -->
    <xsl:template match="result[@module = 'news' and @method = 'rubric']/page" mode="news_list_list">
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="news_list">
                <xsl:apply-templates select="document(concat('udata://news/lastlist/', page/@id,'//10'))" mode="news_list_list"/>
            </div>
            <xsl:call-template name="sidebar"/>
            <div class="clear"/>
        </div>
    </xsl:template>

    <xsl:template match="udata[@module = 'news'][@method = 'lastlist']" mode="news_list_list">
        <xsl:apply-templates select="items/item" mode="news_list_list"/>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata"/>
        
    </xsl:template>

    <xsl:template match="item" mode="news_list_list">

        <xsl:variable name="news_name" select="document(concat('upage://',@id,'.h1'))//value"/>
        <xsl:variable name="news_link" select="document(concat('upage://',@id))/udata/page/@link"/>
        <xsl:variable name="news_anons" select="document(concat('upage://',@id,'.anons'))//value"/>
        <xsl:variable name="date" select="document(concat('upage://',@id,'.publish_time'))//value/@unix-timestamp"/>
        <xsl:variable name="anons_pic" select="document(concat('upage://',@id,'.anons_pic'))//value"/>
        <xsl:variable name="publish_pic" select="document(concat('upage://',@id,'.publish_pic'))//value"/>
        <xsl:variable name="desc" select="document(concat('upage://',@id))//property[@name = 'anons_nohtml']/value"/>

        <div class="object">
            <div class="obj_photo">
                <a href="{$news_link}">
                    <img alt="{$news_name}" title="{$news_name}">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_pic, ')/215/170/default/0/1/5/80'))//src"/>
                        </xsl:attribute>
                    </img>
                </a>
            </div>
            <div class="obj_info">
                <h4 class="obj_title">
                    <a href="{$news_link}">
                        <xsl:value-of select="$news_name"/>
                    </a>
                </h4>
                <div class="obj_desc">
                    <xsl:value-of select="$desc" disable-output-escaping="yes"/>
                    <!--xsl:call-template name="firstWords">
                        <xsl:with-param name="value" select="$desc"/>
                        <xsl:with-param name="count" select="23"/>
                    </xsl:call-template-->
                </div>
                <div class="obj_button">
                    <a href="{$news_link}" class="">Подробнее</a>
                </div>
            </div>
        </div>
    </xsl:template>

    <!--===========================================================================================================================-->

    <xsl:template match="item" mode="news_list">
        <xsl:if test="position() &lt;= 4">

            <xsl:variable name="news_name" select="document(concat('upage://',@id,'.h1'))//value"/>
            <xsl:variable name="news_link" select="document(concat('upage://',@id))/udata/page/@link"/>
            <xsl:variable name="news_anons" select="document(concat('upage://',@id,'.anons'))//value"/>
            <xsl:variable name="date" select="document(concat('upage://',@id,'.publish_time'))//value/@unix-timestamp"/>
            <xsl:variable name="anons_pic" select="document(concat('upage://',@id,'.anons_pic'))//value"/>
            <xsl:variable name="publish_pic" select="document(concat('upage://',@id,'.publish_pic'))//value"/>
            <xsl:variable name="desc" select="document(concat('upage://',@id))//property[@name = 'content']/value"/>

            <div class="object">
                <div class="obj_photo">
                    <a href="{$news_link}">
                        <img alt="{$news_name}" title="{$news_name}">
                            <xsl:attribute name="src">
                                <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_pic, ')/112/112/default/0/1/5/80'))//src"/>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="obj_info">
                    <xsl:if test="$date">
                        <span class="publish_time">
                            <xsl:apply-templates select="document(concat('udata://system/convertDate/',$date,'/d.m.Y/'))/udata"/>
                        </span>
                    </xsl:if>

                    <h4 class="obj_title">
                        <a href="{$news_link}">
                            <xsl:value-of select="$news_name"/>
                        </a>
                    </h4>
                    <!--div class="obj_desc">
                        <xsl:call-template name="firstWords">
                            <xsl:with-param name="value" select="$desc"/>
                            <xsl:with-param name="count" select="15"/>
                        </xsl:call-template>
                    </div-->
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    <!--===========================================================================================================================-->
    <xsl:template match="item" mode="home_news_list">

        <xsl:variable name="news_name" select="document(concat('upage://',@id,'.h1'))//value"/>
        <xsl:variable name="news_link" select="document(concat('upage://',@id))/udata/page/@link"/>
        <xsl:variable name="news_anons" select="document(concat('upage://',@id,'.anons'))//value"/>
        <xsl:variable name="date" select="document(concat('upage://',@id,'.publish_time'))//value/@unix-timestamp"/>
        <xsl:variable name="anons_pic" select="document(concat('upage://',@id,'.anons_pic'))//value"/>
        <xsl:variable name="publish_pic" select="document(concat('upage://',@id,'.publish_pic'))//value"/>
        <xsl:variable name="desc" select="document(concat('upage://',@id))//property[@name = 'content']/value"/>

        <div class="hn_item">
            <a href="{$news_link}"/>
            <img alt="{$news_name}" title="{$news_name}">
                <xsl:attribute name="src">
                    <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_pic, ')/112/112/default/0/1/5/80'))//src"/>
                </xsl:attribute>
            </img>
            <div>
                <xsl:if test="$date">
                    <span>
                        <xsl:apply-templates select="document(concat('udata://system/convertDate/',$date,'/d.m.Y/'))/udata"/>
                    </span>
                </xsl:if>
                <h3>
                    <xsl:value-of select="$news_name"/>
                </h3>
            </div>
            <xsl:call-template name="firstWords">
                <xsl:with-param name="value" select="$news_anons"/>
                <xsl:with-param name="count" select="30"/>
            </xsl:call-template>
        </div>

    </xsl:template>
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- НОВОСТЬ -->
    <xsl:template match="result[@module = 'news' and @method = 'item']/page" mode="news_item">
        <xsl:variable name="id" select="@id"/>

        <div class="wrapper">
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="news_item">
                <xsl:if test=".//property[@name = 'anons'] = true()">
                    <div class="news_anons">
                        <xsl:value-of select=".//property[@name = 'anons']/value" disable-output-escaping="yes"/>
                    </div>
                </xsl:if>

                <xsl:if test=".//property[@ name='publish_pic']/value = true()">
                    <div class="n_photo">
                        <img>
                            <xsl:attribute name="src">
                                <xsl:value-of select="document(concat('udata://system/makeThumbnail/(.', .//property[@name='publish_pic']/value, ')/680/350/default/0/1/80'))//src"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="name"/>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="name"/>
                            </xsl:attribute>
                        </img>
                    </div>
                </xsl:if>
                <div class="news_content">
                    <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                </div>

                <div class="related">
                    <div class="b_i_title">Последние новости</div>
                    <xsl:apply-templates select="document(concat('udata://news/lastlist/', ..//parents/page/@id,''))/udata/items/item[not(@id = $id)]" mode="news_list"/>
                    <!--xsl:apply-templates select="document(concat('udata://blogs20/postsList/',parents/page/@id,'//'))/udata/items/item[not(@id = $id)]" mode="related"/-->
                </div>

            </div>


            <xsl:call-template name="sidebar"/>
            <div class="clear"/>

        </div>

    </xsl:template>



</xsl:stylesheet>
