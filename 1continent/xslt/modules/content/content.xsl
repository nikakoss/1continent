<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page/@is-default = '1']" mode="home">
        <div class="wrapper">
            <div class="banner">
                <form class="os118 filter" method="post" action="/webforms/send/" onsubmit="site.forms.data.save(this); return site.forms.data.check(this);" enctype="multipart/form-data">
                    <div class="form_title">Подобрать новостройку</div>
                    <input type="hidden" name="ref_onsuccess" value="/webforms/posted/118/"/>
                    <input type="hidden" name="system_form_id" value="118"/>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Тип недвижимости: </span>
                            <select name="type" class="width-auto">
                                <option value="novostrojki">Квартира</option>
                                <option value="doma">Дом</option>
                                <option value="kommercheskaya_nedvizhimost">Коммерческая недвижимость</option>
                            </select>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Район: </span>
                            <select name="rajon" class="width-auto">
                                <xsl:apply-templates select="document('usel://reg_user/118')/udata/item" mode="distinct"/>
                            </select>
                        </label>
                    </div>
                    <!--div class="f_box">
                        <label>
                            <span class="f_name">Стоимость: </span>
                            <input class="styler" type="text" name="cena0" placeholder="От"/>
                        </label>
                        <label>
                            <input class="styler" type="text" name="cena1" placeholder="До"/>
                        </label>
                    </div-->
                    <div class="submit">
                        <input class="input_button" type="button" name="submit" value="Подобрать"/>
                    </div>
                </form>
                <script type="text/javascript" src="{$template-resources}js/filter.js"/>
                <a href="/novostrojki/" class="banmap"/>
                <a href="/blog/poleznye_sovety/0_komissii_vsegda/" rel="nofollow" class="blog_0_present"/>
            </div>
        </div>
        <!-- .wrapper -->
        <div class="special">
            <div class="wrapper">
                <div class="special_title">Спецпредложения</div>

                <div id="slider" class="slider">
                    <div class="slider_elements">
                        <xsl:apply-templates select="document('usel://to_slider/?limit=10')/udata/page" mode="sidebar_hot"/>

                    </div>
                </div>

                <div class="special_footer">
                    <a href="/specialnye_predlozheniya_i_akcii">Все спецпредложения и акции</a>
                </div>

            </div>
            <!-- .wrapper -->
        </div>
        <div class="reasons">
            <div class="wrapper">
                <div class="r_left">
                    <span class="rl_n">5</span>
                    <span class="rl_t">причин работы с нами</span>
                </div>
                <div class="r_right">
                    <p>Все новостройки города здесь!</p>
                    <p>0% комиссии всегда!</p>
                    <p>Цены застройщиков</p>
                    <p>Возможность покупки в рассрочку и в ипотеку</p>
                    <p>Уникальные бонусы нашим покупателям</p>
                </div>
            </div>
            <!-- .wrapper -->
        </div>
        <div class="basic">
            <div class="wrapper">
                <div class="b_left">
                    <!--h2>О нашей компании</h2-->
                    <xsl:value-of select="$global_parameters/property[@name = 'o_nashej_kompanii_na_glavnoj']/value" disable-output-escaping="yes"/>
                </div>
                <div class="our_offer">
                    <span>Наши квартиры</span>
                    <div id="slider" class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document(concat('usel://newitems/', 350,'/',3))/udata" mode="slider_room"/>
                        </div>
                    </div>
                    <div id="slider" class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document(concat('usel://newitems/', 351,'/',3))/udata" mode="slider_room"/>
                        </div>
                    </div>
                    <div id="slider" class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document(concat('usel://newitems/', 352,'/',3))/udata" mode="slider_room"/>
                        </div>
                    </div>

                </div>
                <div class="b_left">
                    <xsl:value-of select="$global_parameters/property[@name = 'o_nashej_kompanii_na_glavnoj_2']/value" disable-output-escaping="yes"/>
                </div>
                <div class="our_offer">
                    <span>Наши предложения</span>
                    <div id="slider" class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',3,'/0////1'))/udata/lines" mode="sidebar_hot"/>
                        </div>
                    </div>
                </div>
                <div class="b_left">
                    <xsl:value-of select="$global_parameters/property[@name = 'o_nashej_kompanii_na_glavnoj_3']/value" disable-output-escaping="yes"/>
                </div>

                <div class="b_right">
                    <h2>Отзывы счастливых владельцев</h2>
                    <!--xsl:apply-templates select="document(concat('udata://blogs20/postsList/',112,'//2'))/udata/items/item" mode="otziv_blog_list"/-->
                    <xsl:apply-templates select="document(concat('udata://content/menu/0/0/', 430))/udata/items" mode="otziv_blog_list"/>
                </div>
                <div class="clear"/>
            </div>
            <!-- .wrapper -->
        </div>
        <div class="home_news">
            <div class="wrapper">
                <table>
                    <tr>
                        <td>
                            <h2>Новости</h2>
                        </td>
                        <td>
                            <a href="/novosti/">Все новости</a>
                        </td>
                    </tr>
                </table>


                <xsl:apply-templates select="document(concat('udata://news/lastlist/', 85,'//3'))/udata/items/item" mode="home_news_list"/>
                <div class="clear"/>
            </div>
            <!-- .wrapper -->
        </div>

        <div class="home_info">
            <div class="wrapper">
                <table>
                    <tr>
                        <td>
                            <h2>Статьи и материалы</h2>
                        </td>
                        <td>
                            <a href="/blog/">Все статьи</a>
                        </td>
                    </tr>
                </table>
                <!--xsl:apply-templates select="document(concat('udata://blogs20/postsList/',67,'//2'))/udata/items/item" mode="home_blog_list"/-->
                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',393,'/2//1//0'))/udata/lines/item" mode="home_blog_list"/>
                <div class="clear"/>
            </div>
            <!-- .wrapper -->
        </div>

        <div class="home_partners">
            <div class="wrapper">
                <xsl:comment>noindex</xsl:comment>
                <h2>Наши партнёры</h2>

                <!--xsl:apply-templates select="document(concat('udata://photoalbum/album/', 92,'//0'))/udata" mode="album"/-->
                <!--xsl:apply-templates select="document(concat('udata://content/menu/0/0/', 334))/udata/items" mode="album"/-->

                <xsl:apply-templates select=".//group[@name = 'nashi_partnry']/property[@type = 'img_file']" mode="partn"/>

                <div class="clear"/>
                <xsl:comment>/noindex</xsl:comment>
            </div>
            <!-- .wrapper -->
        </div>
    </xsl:template>

    <xsl:template match="property[@type = 'img_file']" mode="partn">
        <xsl:variable name="pos" select="position()"/>
        <xsl:variable name="name" select="concat('ssylka_', $pos)"/>
        <xsl:variable name="link" select="../property[@name = $name]/value"/>
        <div class="hp_item">
            <a href="{$link}" rel="nofollow" title="{$pos}">
                <xsl:attribute name="style"> background: url("<xsl:value-of select="document(concat('udata://system/makeThumbnail/(.', value , ')/172/53/default/0/1/80'))//src"/>") no-repeat scroll
                    50% 50% transparent; display:block; </xsl:attribute>
            </a>
        </div>

    </xsl:template>

    <xsl:template match="item" mode="distinct">
        <option value="{@id}">
            <xsl:value-of select="@name"/>
        </option>
    </xsl:template>
    <!--===========================================================================================================================-->
    <!-- ARTICLE -->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and @method = 'content']" mode="article">
        <xsl:variable name="anons_img" select=".//property[@name = 'anons_img']/value"/>

        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:choose>
                    <xsl:when test="page/@parentId = '430'">
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/1/0')/udata"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <div class="headline">
                <span>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </span>
            </div>
            <div class="article">
                <xsl:if test="$anons_img = true()">
                    <xsl:variable name="name" select=".//property[@name = 'h1']/value"/>
                    <img alt="{$name}" title="{$name}">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/128/128/default/0/1/5/80'))//src"/>
                        </xsl:attribute>
                    </img>
                </xsl:if>
                <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>

                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>


    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- БЛОГ -->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page[@alt-name = 'blog']]" mode="article">

        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="article_list">

                <xsl:apply-templates select="document('udata://content/menu//1/(blog)')/udata" mode="article_list"/>

                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>




    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- Контакты -->
    <xsl:template match="result[@module = 'content' and page[@alt-name = 'kontakty']]" mode="article">
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <span>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </span>
            </div>
            <div class="article" itemscope="" itemtype="http://schema.org/Organization">
                <p style="font-size: medium;">Компания: <span itemprop="name">1 Континет</span></p>
                <div class="contacts_location" itemprop="address" itemscope="" itemtype="http://schema.org/PostalAddress">
                    <span itemprop="addressLocality">г. <xsl:value-of select="$global_parameters/property[@name = 'gorod']/value"/></span>, <span itemprop="streetAddress"><xsl:value-of
                            select="$global_parameters/property[@name = 'ulicadom']/value"/></span>
                </div>
                <div class="contacts_phone">
                    <span itemprop="telephone">
                        <xsl:value-of select="$global_parameters/property[@name = 'tel_prefiks_1']/value"/>
                        <xsl:value-of select="$global_parameters/property[@name = 'telefon_1']/value"/>
                    </span>, <span itemprop="telephone">
                        <xsl:value-of select="$global_parameters/property[@name = 'tel_prefiks_2']/value"/>
                        <xsl:value-of select="$global_parameters/property[@name = 'telefon_2']/value"/>
                    </span>
                </div>

                <a href="#summit" class="summit contacts_in_ofise">Договориться о встрече в офисе Таганрога</a>

                <div class="map">
                    <xsl:value-of select=".//property[@name = 'map']/value" disable-output-escaping="yes"/>
                </div>

                <div class="contacts_location" itemprop="address" itemscope="" itemtype="http://schema.org/PostalAddress">
                    <span itemprop="addressLocality">г. <xsl:value-of select="$global_parameters_kk/property[@name = 'gorod']/value"/></span>, <span itemprop="streetAddress"><xsl:value-of
                            select="$global_parameters_kk/property[@name = 'ulicadom']/value"/></span>
                </div>
                <div class="contacts_phone">
                    <span itemprop="telephone">
                        <xsl:value-of select="$global_parameters_kk/property[@name = 'tel_prefiks_1']/value"/>
                        <xsl:value-of select="$global_parameters_kk/property[@name = 'telefon_1']/value"/>
                    </span>, <span itemprop="telephone">
                        <xsl:value-of select="$global_parameters_kk/property[@name = 'tel_prefiks_2']/value"/>
                        <xsl:value-of select="$global_parameters_kk/property[@name = 'telefon_2']/value"/>
                    </span>
                </div>

                <a href="#summit2" class="summit contacts_in_ofise">Договориться о встрече в офисе Краснодара</a>

                <div class="map">
                    <xsl:value-of select="document('upage://505.map')//value" disable-output-escaping="yes"/>
                </div>

                <div itemprop="description">
                    <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                </div>
                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>

            <div style="display:none">
                <div id="summit2" class="modal_form">
                    <a href="javascript:;" onclick="$.fancybox.close();" class="close">Закрыть</a>
                    <xsl:apply-templates select="document('udata://webforms/add/146')/udata" mode="feedback"/>
                </div>
            </div>

        </div>
    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- О компании -->
    <xsl:template match="result[@module = 'content' and @method = 'content' and page[@alt-name = 'o_kompanii']]" mode="article">
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="article">
                <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>

                <xsl:comment>noindex</xsl:comment>
                <div class="stuff">
                    <div class="stuff_list">Наши сотрудники в Таганроге</div>
                    <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',36,'/0////1'))/udata" mode="stuff"/>
                </div>
                <div style="clear: both;"/>
                <div class="stuff">
                    <div class="stuff_list">Наши сотрудники в Краснодаре</div>
                    <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',481,'/0////1'))/udata" mode="stuff"/>
                </div>
                <div style="clear: both;"/>
                <xsl:comment>/noindex</xsl:comment>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>

    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- Отзывы счастливых владельцев -->
    <xsl:template match="result[@module = 'content' and page[@alt-name = 'otzyvy_schastlivyh_vladelcev']]" mode="article">
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/1/0')/udata"/>
            </div>
            <div class="headline">
                <span>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </span>
            </div>
            <div class="article">
                <xsl:apply-templates select="document(concat('udata://content/menu/0/0/', 430))/udata/items" mode="otziv_blog_list2"/>
                <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>

                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>
    </xsl:template>
    <!--===========================================================================================================================-->
    <!-- Спец. предложения -->
    <xsl:template match="result[@module = 'content' and @method = 'content' and page[@alt-name = 'specialnye_predlozheniya_i_akcii']]" mode="article">
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1>Подбор недвижимости: <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>

            <div class="catalog">
                <xsl:apply-templates select="document('usel://to_slider/?limit=10')/udata/page" mode="items"/>

                <!--xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id_cat,'/2////1'))/udata" mode="items"/-->
                <!--div id="cat_{$id_cat}" class="upload"><span class="plus"><xsl:text>+ </xsl:text></span><span class="ult">Показать ещё</span></div-->
                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>


            <script type="text/javascript" src="{$template-resources}js/load_objects.js"/>

        </div>

    </xsl:template>
    <!--===========================================================================================================================-->
    <!-- АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // АЛЬБОМЫ // -->

    <xsl:template match="udata[@module = 'photoalbum' and @method = 'album']" mode="album">
        <xsl:apply-templates select="items/item" mode="album"/>
        <div style="clear:both"/>
    </xsl:template>

    <xsl:template match="item" mode="album">
        <xsl:variable name="name" select="document(concat('upage://',@id))/udata/page/name"/>
        <xsl:variable name="link" select="document(concat('upage://',@id))//property[@name = 'url_partnra']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',@id,'.izobrazhenie'))//value"/>
        <xsl:variable name="desc" select="document(concat('upage://',@id))//property[@name = 'descr']/value"/>


        <div class="hp_item">
            <a href="{$link}" rel="nofollow">
                <xsl:attribute name="title">
                    <xsl:value-of select="$name"/>
                    <xsl:value-of select="$desc" disable-output-escaping="yes"/>
                </xsl:attribute>
                <xsl:attribute name="style"> background: url("<xsl:value-of select="document(concat('udata://system/makeThumbnail/(.', $photo, ')/172/53/default/0/1/80'))//src"/>") no-repeat scroll
                    50% 50% transparent; display:block; </xsl:attribute>
            </a>
        </div>
    </xsl:template>

    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // ПОИСК // -->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@method = 'search_do']" mode="search">
        <div class="wrapper">
            <div class="headline">
                <h1>Результаты поиска</h1>
            </div>
            <div class="search_result">
                <xsl:apply-templates select="document('udata://search/search_do////1,3,4,5,32,33,393,35,85/15')/udata" mode="search-result"/>
            </div>
            <xsl:call-template name="sidebar"/>
        </div>
    </xsl:template>

    <xsl:template match="udata[@method = 'search_do']" mode="search-result">
        <div class="query_string">
            <xsl:text>Поисковый запрос: "</xsl:text>
            <span>
                <xsl:value-of select="$search_string"/>
            </span>
            <xsl:text>" не принёс результатов</xsl:text>

        </div>
        <div style="clear: both;"/>
    </xsl:template>

    <xsl:template match="udata[@method = 'search_do' and count(items/item)]" mode="search-result">
        <div class="query_string">
            <xsl:text>Поисковый запрос: "</xsl:text>
            <span>
                <xsl:value-of select="$search_string"/>
            </span>
            <xsl:text>"</xsl:text>
            <!--xsl:text>" найдено: </xsl:text>
                    <xsl:value-of select="total"/>
                    <xsl:text>.</xsl:text-->
            <form action="/search/search_do/" method="get" class="morf_search">
                <input type="text" class="textinputs" name="search_string" value="Поиск по сайту" onfocus="javascript: if(this.value == 'Поиск по сайту') this.value = '';"
                    onblur="javascript: if(this.value == '') this.value = 'Поиск по сайту';"/>
                <input type="submit" value="" class="search_sbmt"/>
            </form>
        </div>

        <dl class="found_item">
            <xsl:apply-templates select="items/item" mode="search-result">
                <xsl:with-param name="per_page" select="per_page"/>
            </xsl:apply-templates>
        </dl>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata"/>
    </xsl:template>

    <xsl:template match="item" mode="search-result">
        <xsl:param name="per_page"/>
        <dt>
            <!--span>
                <xsl:value-of select="$p * $per_page + position()"/>
            </span-->
            <a href="{@link}">
                <xsl:value-of select="@name"/>
            </a>
        </dt>
        <dd>
            <xsl:value-of select="." disable-output-escaping="yes"/>
            <a class="h_c_button request_call" href="{@link}">Подробнее</a>
        </dd>
    </xsl:template>

    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- BREADCRUMBS  BEGIN-->
    <xsl:template match="udata[@method = 'navibar']">
        <xsl:if test="$is-home = false()">
            <ul class="navibar" xmlns:v="http://rdf.data-vocabulary.org/#">
                <li typeof="v:Breadcrumb">
                    <a href="{$lang-prefix}/" rel="v:url" property="v:title"> Главная </a>
                </li>
                <xsl:apply-templates select="items/item" mode="navibar"/>
            </ul>
        </xsl:if>
    </xsl:template>
    <xsl:template match="item" mode="navibar">
        <!--xsl:variable name="content" select="document(concat('upage://', @id))//property[@name = 'content']"/-->
        <!--xsl:variable name="block_link" select="document(concat('upage://', @id))//property[@name = 'block_link']/value"/-->
        <!--xsl:if test="$content = false() and $block_link = false()"-->
        <li typeof="v:Breadcrumb">
            <xsl:text> &ndash; </xsl:text>
            <a href="{@link}" rel="v:url" property="v:title">
                <xsl:attribute name="title">
                    <xsl:value-of select="."/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </a>
            <!--xsl:value-of select="$block_link"/-->
        </li>
        <!--/xsl:if-->
    </xsl:template>
    <xsl:template match="item[position() = last()]" mode="navibar">
        <li property="v:title">
            <xsl:text> &ndash; </xsl:text>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    <!-- BREADCRUMBS  END-->
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page[@alt-name = 'sitemap']]" mode="article">
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <span>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </span>
            </div>
            <div class="article">
                <div class="sitemap">
                    <xsl:apply-templates select="document('udata://content/fullSitemap//10')" mode="sitemap"/>
                </div>
                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>
    </xsl:template>

    <xsl:template match="items" mode="sitemap">
        <ul>
            <xsl:apply-templates select="item" mode="sitemap"/>
        </ul>
    </xsl:template>

    <xsl:template match="item[@link != '/sitemap/'][@link != '/krasnodar/search_result/'][@link != '/search_result/'][@robots_deny = false()]" mode="sitemap">
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name"/>
            </a>
            <xsl:apply-templates select="items" mode="sitemap"/>
        </li>
    </xsl:template>
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- 404-->
    <xsl:template match="result[@method = 'notfound']">
        <div class="wrapper">
            <div class="article">
                <div class="notfound"> 404 <br/> Страница не найдена!<br/>
                    <span>Извините, но запрашиваемая вами страница отсутствует. Воспользуйтесь навигационным меню, чтобы перейти в нужный раздел нашего сайта или перейдите на <a href="/">главную
                            страницу</a> сайта.</span>
                </div>

                <div style="clear: both;"/>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="title">
        <xsl:param name="kolichestvo_komnat"/>
        <xsl:param name="S"/>
        <xsl:param name="jil_komp"/>

        <xsl:choose>
            <xsl:when test="$kolichestvo_komnat = '1'"> 1-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = '2'"> 2-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = '3'"> 3-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = '4+'"> 4-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = 'Студия'"> Студия площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:otherwise> Квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!-- Вывод СПЕЦПРЕДЛОЖЕНИЯ слева BEGIN -->
    <xsl:template match="page" mode="slider_room">

        <xsl:variable name="parentId" select="@parentId"/>
        <xsl:variable name="parent_parentId" select="document(concat('upage://',$parentId))/udata/page/@parentId"/>
        <xsl:variable name="parent_obj" select="document(concat('upage://',$parent_parentId))"/>

        <xsl:variable name="link" select="$parent_obj/udata/page/@link"/>
        <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'foto']/value"/>
        <xsl:variable name="kolichestvo_komnat" select="document(concat('upage://',@id))//property[@name = 'kolichestvo_komnat']/value/item/@name"/>
        <xsl:variable name="obwaya_prowad" select="document(concat('upage://',@id))//property[@name = 'obwaya_prowad']/value"/>
        <xsl:variable name="zhilaya_prowad" select="document(concat('upage://',@id))//property[@name = 'zhilaya_prowad']/value"/>
        <xsl:variable name="plowad_kuhni" select="document(concat('upage://',@id))//property[@name = 'plowad_kuhni']/value"/>
        <xsl:variable name="nalichie_lodzhiibalkona" select="document(concat('upage://',@id))//property[@name = 'nalichie_lodzhiibalkona']/value"/>

        <div>
            <div class="s_obj">
                <!--img alt="{$title}" title="{$title}" src="{$template-resources}img/empty_appart.jpg"> </img-->
                <a href="{$link}">
                    <img alt="{$title}" title="{$title}" class="photo">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $parent_obj//property[@name = 'foto']/value, ')/230/135/default/0/1/5/80'))//src"/>
                        </xsl:attribute>
                    </img>
                </a>

                <div class="s_obj_title">
                    <a href="{$link}">
                        <xsl:choose>
                            <xsl:when test="$kolichestvo_komnat = '1'"> 1-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = '2'"> 2-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = '3'"> 3-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = '4+'"> 4-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = 'Студия'"> студия площадью </xsl:when>
                            <xsl:otherwise> квартира </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>общей площадью </xsl:text>
                        <xsl:value-of select="$obwaya_prowad"/>
                        <xsl:text> м</xsl:text>
                        <sup>2</sup>
                        <xsl:text>, жилой площадью </xsl:text>
                        <xsl:value-of select="$zhilaya_prowad"/>
                        <xsl:text> м</xsl:text>
                        <sup>2</sup>
                        <xsl:text>, площадью кухни </xsl:text>
                        <xsl:value-of select="$plowad_kuhni"/>
                        <xsl:text> м</xsl:text>
                        <sup>2</sup>
                    </a>
                </div>
                <div class="s_obj_place">
                    <span>Район: </span>
                    <xsl:value-of select="$parent_obj//property[@name = 'rajon']/value/item/@name"/>
                </div>

            </div>
        </div>
    </xsl:template>
    <!-- Вывод СПЕЦПРЕДЛОЖЕНИЯ слева END -->

</xsl:stylesheet>
