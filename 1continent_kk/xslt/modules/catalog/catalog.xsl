<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
    <!ENTITY nbsp  "&#160;">
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->
    <xsl:decimal-format name="european" decimal-separator="," grouping-separator=" "/>
    <!--===========================================================================================================================-->
    <!-- Вывод объектов выбранного каталога BEGIN -->
    <xsl:template match="result[@module='catalog' and @method='category']/page[@alt-name = 'novostrojki' or @alt-name = 'doma' or @alt-name = 'kommercheskaya_nedvizhimost']" mode="catalog">
        <xsl:variable name="id_cat" select="@id"/>
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1 id="{@id}">Подбор недвижимости: <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
                <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',$id_cat,'/0/0/0'))/udata/items" mode="subcatalog"/>
            </div>

            <div class="obj_filter">
                <xsl:choose>
                    <xsl:when test="$id_cat = '550'">
                        <xsl:apply-templates select="document('udata://catalog/search////151')/udata" mode="filter"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="document(concat('udata://catalog/search/(', $id_cat ,')'))/udata" mode="filter"/>
                    </xsl:otherwise>
                </xsl:choose>

            </div>
            <div class="catalog">
                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id_cat,'/5//1//1'))/udata" mode="items"/>
                <!--div id="cat_{$id_cat}" class="upload"><span class="plus"><xsl:text>+ </xsl:text></span><span class="ult">Показать ещё</span></div-->

                <xsl:if test="$p = 0">
                    <div class="article">
                        <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                    </div>
                </xsl:if>
                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>


            <script type="text/javascript" src="{$template-resources}js/load_objects.js"/>

        </div>

    </xsl:template>
    <!-- Вывод объектов выбранного каталога END -->


    <!-- Вывод объектов выбранного каталога BEGIN -->
    <xsl:template match="result[@module='catalog' and @method='category']/page[@parentId = '550' or @parentId= '463' or @parentId = '461']" mode="catalog">
        <xsl:variable name="id_cat" select="@id"/>
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1 id="{@id}">Подбор недвижимости: <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>

            <div class="obj_filter">
                <xsl:apply-templates select="document(concat('udata://catalog/search/(', @id ,')'))/udata" mode="filter"/>
            </div>
            <div class="catalog">
                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id_cat,'/5//1//1'))/udata" mode="items"/>
                <!--div id="cat_{$id_cat}" class="upload"><span class="plus"><xsl:text>+ </xsl:text></span><span class="ult">Показать ещё</span></div-->

                <div class="article">
                    <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                </div>

                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>


            <script type="text/javascript" src="{$template-resources}js/load_objects.js"/>

        </div>

    </xsl:template>
    <!-- Вывод объектов выбранного каталога END -->

    <!--  -->
    <xsl:template match="udata" mode="items">
        <xsl:choose>
            <xsl:when test="total = 0">
                <div class="c_title"> На данный момент в выбранном вами районе нет наших объектов. Но Вы можете подобрать недвижимость в другом районе. </div>
                <div class="headline">
                    <!--xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',550,'/0/0/0'))/udata/items" mode="subcatalog"/-->
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="c_title">Найдено объектов: <span>
                        <xsl:value-of select="total"/>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="lines/item" mode="items"/>
        <div class="clear"/>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata" mode="upload">
            <xsl:with-param name="cat" select="category_id"/>
        </xsl:apply-templates>
    </xsl:template>
    <!--  -->

    <!-- Вывод ЭЛЕМЕНТА каталога  BEGIN -->
    <xsl:template match="item|page " mode="items">
        <xsl:variable name="parent" select="document(concat('upage://',@id))/udata/page/@parentId"/>
        <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
        <xsl:variable name="price" select="document(concat('upage://',@id))//property[@name = 'cena']/value"/>
        <xsl:variable name="price_km" select="document(concat('upage://',@id))//property[@name = 'cena_km']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'foto']/value"/>
        <xsl:variable name="desc" select="document(concat('upage://',@id))//property[@name = 'content']/value"/>
        <xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>
        <xsl:variable name="ipoteca" select="document(concat('upage://',@id))//property[@name = 'ipoteka']/value"/>
        <xsl:variable name="kratkoe_opisanie" select="document(concat('upage://',@id))//property[@name = 'kratkoe_opisanie' ]/value"/>

        <xsl:variable name="district" select="document(concat('upage://',@id))//property[@name = 'rajon_k']/value/item/@name"/>
        <xsl:variable name="type_id" select="document(concat('upage://',@id))/udata/page/@type-id"/>


        <div class="object">
            <div class="obj_photo">
                <xsl:if test="$ipoteca = 1">
                    <div class="cat_ipoteca"/>
                </xsl:if>

                <a href="{$link}" onclick="yaCounter21668962.reachGoal('select_obj'); return true;">
                    <img alt="{$title}" title="{$title}">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/294/263/default/0/1/5/80'))//src"/>
                        </xsl:attribute>
                    </img>
                </a>
            </div>
            <div class="obj_info">
                <h4 class="obj_title">
                    <a href="{$link}" onclick="yaCounter21668962.reachGoal('select_obj'); return true;">
                        <xsl:value-of select="$title"/>
                    </a>
                </h4>
                <!--xsl:if test="$type_id = '122'">
                    <div class="obj_distinct">Район: <xsl:value-of select="$district"/></div>
                </xsl:if-->
                <div class="obj_distinct">Район: <xsl:value-of select="$district"/></div>

                <div class="obj_desc">

                    <xsl:value-of select="$kratkoe_opisanie" disable-output-escaping="yes"/>

                    <!--xsl:call-template name="firstWords">
                        <xsl:with-param name="value" select="$desc"/>
                        <xsl:with-param name="count" select="42"/>
                    </xsl:call-template-->
                </div>

                <xsl:choose>
                    <xsl:when test="document(concat('upage://',@id))//property[@name = 'tip_realizacii'] = true()">
                        <xsl:choose>
                            <xsl:when test="document(concat('upage://',@id))//property[@name = 'tip_realizacii']/value/item/@id  = 401">
                                <div class="obj_price">
                                    <span>Стоимость аренды: </span>
                                    <xsl:value-of select="format-number($price, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$price != 0">
                                        <div class="obj_price">
                                            <span>Стоимость: от </span>
                                            <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. </div>
                                        <xsl:if test="$price_km != 0">
                                            <div class="obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="obj_price">
                                            <xsl:if test="$price_km != 0">
                                                <span>Цена: </span>
                                                <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                            </xsl:if>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$price != 0">
                                <div class="obj_price">
                                    <span>Стоимость: от </span>
                                    <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. </div>
                                <xsl:if test="$price_km != 0">
                                    <div class="obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="obj_price">
                                    <xsl:if test="$price_km != 0">
                                        <span>Цена: </span>
                                        <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                    </xsl:if>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <div>
                    <a class="look_plane" href="{$link}">Посмотреть планировки</a>
                </div>


                <div class="obj_button">
                    <a href="#summit" class="summit" onclick="yaCounter21668962.reachGoal('summit{$parent}'); return true;">Договориться о встрече в офисе</a>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="firstWords">
        <xsl:param name="value"/>
        <xsl:param name="count"/>

        <xsl:if test="number($count) >= 1">
            <xsl:value-of select="concat(substring-before($value,' '),' ')" disable-output-escaping="yes"/>
        </xsl:if>
        <xsl:if test="number($count) > 1">
            <xsl:variable name="remaining" select="substring-after($value,' ')"/>
            <xsl:if test="string-length($remaining) > 0">
                <xsl:call-template name="firstWords">
                    <xsl:with-param name="value" select="$remaining"/>
                    <xsl:with-param name="count" select="number($count)-1"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    <!-- Вывод ЭЛЕМЕНТА каталога  END -->

    <xsl:template match="items" mode="subcatalog">
        <!--select name="sub">
            <option value="">Выберите район</option>
            <xsl:apply-templates select="item" mode="subcatalog"/>
        </select-->

        <div style="display: inline-block; position: relative; z-index:100" class="jq-selectbox jqselect">
            <div style="position: relative" class="jq-selectbox__select">
                <div class="jq-selectbox__select-text" style="width: 110px;">Выберите район</div>
                <div class="jq-selectbox__trigger">
                    <div class="jq-selectbox__trigger-arrow"/>
                </div>
            </div>
            <div style="position: absolute; display: none;" class="jq-selectbox__dropdown">
                <ul style="position: relative; list-style: none; overflow: auto; overflow-x: hidden">
                    <li style="display: block; white-space: nowrap;">
                        <a href="/krasnodar/obekty/novostrojki/">Все жилые комплексы</a>
                    </li>
                    <xsl:apply-templates select="item" mode="subcatalog"/>
                </ul>
            </div>
        </div>





    </xsl:template>

    <xsl:template match="item" mode="subcatalog">
        <!--option value="{@link}">
            <xsl:value-of select="."/>
        </option-->
        <li style="display: block; white-space: nowrap;">
            <a href="{@link}">
                <xsl:value-of select="."/>
            </a>
        </li>

        <!--a href="{@link}"><xsl:value-of select="."/></a-->
    </xsl:template>


    <!--===========================================================================================================================-->
    <xsl:template match="result[@module='catalog' and @method='category']/page[@alt-name = 'obekty']" mode="catalog">
        <xsl:variable name="id_cat" select="@id"/>
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h1 id="{@id}">
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="catalog">
                <table>
                    <tr>
                        <td>
                            <a href="/krasnodar/obekty/novostrojki/" class="obj_category" title="Жилые комплексы">
                                <img src="{$template-resources}images/_jilcompl.jpg" alt="Жилые комплексы"/>
                            </a>
                        </td>
                        <td>
                            <a href="/krasnodar/obekty/kvartiry/" class="obj_category" title="Квартиры">
                                <img src="{$template-resources}images/_kvartira.jpg" alt="Квартиры"/>
                            </a>
                        </td>
                        <td>
                            <a href="/krasnodar/obekty/doma/" class="obj_category" title="Коттеджи">
                                <img src="{$template-resources}images/_kotedj.jpg" alt=""/>
                            </a>
                        </td>
                        <td>
                            <a href="/krasnodar/obekty/kommercheskaya_nedvizhimost/" class="obj_category" title="Коммерческая нежвижимость">
                                <img src="{$template-resources}images/_commercial.jpg" alt="Коммерческая нежвижимость"/>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="/krasnodar/obekty/novostrojki/" class="obj_category">Жилые комплексы</a>
                        </td>
                        <td>
                            <a href="/krasnodar/obekty/kvartiry/" class="obj_category">Квартиры</a>
                        </td>
                        <td>
                            <a href="/krasnodar/obekty/doma/" class="obj_category">Коттеджи</a>
                        </td>
                        <td>
                            <a href="/krasnodar/obekty/kommercheskaya_nedvizhimost/" class="obj_category">Коммерческая нежвижимость</a>
                        </td>
                    </tr>
                </table>

                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id_cat,'/10/1/2//1'))/udata" mode="items"/>
                <!--div id="cat_{$id_cat}" class="upload"><span class="plus"><xsl:text>+ </xsl:text></span><span class="ult">Показать ещё</span></div-->

                <xsl:if test="$p = 0">
                    <div class="article">
                        <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                    </div>
                </xsl:if>
                <div style="clear: both;"/>
            </div>
            <xsl:call-template name="sidebar"/>
        </div>

    </xsl:template>


    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- Вывод SIDEBAR BEGIN -->
    <xsl:template name="sidebar">
        <div class="sidebar">
            <div class="s_special">
                <div class="s_title">Спецпредложения</div>
                <xsl:apply-templates select="document('usel://to_slider_k/?limit=3')/udata/page" mode="sidebar_hot"/>
                <div class="s_footer">
                    <a href="/krasnodar/specialnye_predlozheniya_i_akcii/">Все спецпредложения и акции</a>
                </div>
            </div>
            <div class="s_cons">
                <!--a href="#"/-->
            </div>
            <div class="s_calc">
                <a href="#calc_form" id="inline_calc"/>
            </div>

            <script type="text/javascript" src="{$template-resources}jivosite/jivosite.js"/>

            <!-- BEGIN JIVOSITE CODE {literal} -->
            <script type="text/javascript">
                (function(){ var widget_id = '142362';
                var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = '//code.jivosite.com/script/widget/'+widget_id; var ss = document.getElementsByTagName('script')[0]; ss.parentNode.insertBefore(s, ss);})();
            </script>
            <!-- {/literal} END JIVOSITE CODE -->

        </div>
    </xsl:template>
    <!-- Вывод SIDEBAR END -->
    <!--===========================================================================================================================-->
    <!-- Вывод СПЕЦПРЕДЛОЖЕНИЯ слева BEGIN -->
    <xsl:template match="page|item" mode="sidebar_hot">

        <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
        <xsl:variable name="ipoteca" select="document(concat('upage://',@id))//property[@name = 'ipoteka']/value"/>
        <xsl:variable name="price" select="document(concat('upage://',@id))//property[@name = 'cena']/value"/>
        <xsl:variable name="price_km" select="document(concat('upage://',@id))//property[@name = 'cena_km']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'foto']/value"/>
        <xsl:variable name="raion" select="document(concat('upage://',@id))//property[@name = 'rajon_k']/value/item/@name"/>
        <xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>





        <!-- item BEGIN -->

        <div>
            <div class="s_obj">
                <a href="{$link}">
                    <img alt="{$title}" title="{$title}" class="photo">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/230/135/default/0/1/5/80'))//src"/>
                        </xsl:attribute>
                    </img>
                </a>
                <!--div class="s_obj_n">Объект № <xsl:value-of select="@id"/></div-->
                <div class="s_obj_title">
                    <a href="{$link}" title="{$title}">
                        <xsl:value-of select="$title"/>
                    </a>
                </div>
                <div class="s_obj_place">
                    <span>Район: </span>
                    <xsl:value-of select="$raion"/>
                </div>
                <xsl:choose>
                    <xsl:when test="document(concat('upage://',@id))//property[@name = 'tip_realizacii'] = true()">
                        <xsl:choose>
                            <xsl:when test="document(concat('upage://',@id))//property[@name = 'tip_realizacii']/value/item/@id  = 401">
                                <div class="s_obj_cost">
                                    <span>Стоимость аренды: </span>
                                    <xsl:value-of select="format-number($price, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$price != 0">
                                        <div class="s_obj_cost">
                                            <span>Стоимость: </span>
                                            <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. <xsl:if test="$price_km = true()">
                                                <span class="s_obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </span>
                                            </xsl:if>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="s_obj_cost">
                                            <span>Цена: </span>
                                            <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$price != 0">
                                <div class="s_obj_cost">
                                    <span>Стоимость: </span>
                                    <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. <xsl:if test="$price_km = true()">
                                        <span class="s_obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </span>
                                    </xsl:if>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="s_obj_cost">
                                    <span>Цена: </span>
                                    <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>

            </div>
        </div>


        <!-- item END -->

    </xsl:template>
    <!-- Вывод СПЕЦПРЕДЛОЖЕНИЯ слева END -->
    <!--===========================================================================================================================-->
    <!-- Вывод Сотрудники BEGIN -->

    <xsl:template match="udata" mode="stuff">
        <div class="stuff_list">Наши сотрудники</div>
        <xsl:apply-templates select="lines/item" mode="stuff"/>

    </xsl:template>

    <xsl:template match="item" mode="stuff">
        <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'fotografiya']/value"/>
        <xsl:variable name="dolzhnost" select="document(concat('upage://',@id))//property[@name = 'dolzhnost']/value"/>
        <xsl:variable name="telefon" select="document(concat('upage://',@id))//property[@name = 'telefon']/value"/>


        <div class="members">
            <div class="m_photo">
                <img alt="{$title}" title="{$title}">
                    <xsl:attribute name="src">
                        <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/200/230/default/0/1/5/80'))//src"/>
                    </xsl:attribute>
                </img>
            </div>
            <p class="m_name">
                <xsl:value-of select="$title"/>
            </p>
            <p class="m_dolzhnost">
                <span>Должность: </span>
                <xsl:value-of select="$dolzhnost"/>
            </p>
            <p class="m_telefon">
                <span/>
                <xsl:value-of select="$telefon"/>
            </p>
        </div>





    </xsl:template>
    <!-- Вывод Сотрудники END -->
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!-- Вывод Как Бы БЛОГ BEGIN -->

    <xsl:template match="result[@module='catalog' and @method='category'][parents/page[@alt-name = 'blog']]" mode="catalog">
        <xsl:variable name="id_cat" select="@id"/>
        <div class="wrapper">
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>

            <div class="blog">
                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id_cat,'/5//1//0'))/udata" mode="blogs"/>
                <!--div id="cat_{$id_cat}" class="upload"><span class="plus"><xsl:text>+ </xsl:text></span><span class="ult">Показать ещё</span></div-->

                <div class="article">
                    <xsl:value-of select=".//property[@name = 'descr']/value" disable-output-escaping="yes"/>
                </div>

                <div style="clear: both;"/>
            </div>
            <div class="sidebar">
                <div class="rubricator">
                    <!--div class="s_title">Рубрики</div-->
                    <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',393,'///'))/udata/items" mode="blogs_list"/>
                </div>
            </div>

            <xsl:call-template name="sidebar"/>
            <!--script type="text/javascript" src="{$template-resources}js/load_objects.js"/-->

        </div>
    </xsl:template>

    <xsl:template match="result[@module='catalog' and @method='category']/page[@alt-name = 'blog']" mode="catalog">
        <xsl:variable name="id_cat" select="@id"/>
        <div class="wrapper">
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>

            <div class="blog">
                <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id_cat,'/5//1//0'))/udata" mode="blogs"/>
                <!--div id="cat_{$id_cat}" class="upload"><span class="plus"><xsl:text>+ </xsl:text></span><span class="ult">Показать ещё</span></div-->

                <div class="article">
                    <xsl:value-of select=".//property[@name = 'descr']/value" disable-output-escaping="yes"/>
                </div>

                <div style="clear: both;"/>
            </div>
            <div class="sidebar">
                <div class="rubricator">
                    <!--div class="s_title">Рубрики</div-->
                    <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',$id_cat,'///'))/udata/items" mode="blogs_list"/>
                </div>
            </div>

            <xsl:call-template name="sidebar"/>


            <!--script type="text/javascript" src="{$template-resources}js/load_objects.js"/-->

        </div>

    </xsl:template>


    <!--  -->
    <xsl:template match="udata" mode="blogs">
        <!--div class="c_title">Найдено объектов: <span>
                <xsl:value-of select="total"/>
            </span>
        </div-->
        <div id="blog_items">
            <xsl:apply-templates select="lines/item" mode="blogs"/>
        </div>
        <div class="clear"/>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata" mode="upload">
            <xsl:with-param name="cat" select="category_id"/>
        </xsl:apply-templates>
    </xsl:template>
    <!--  -->

    <!-- Вывод ЭЛЕМЕНТА Как Бы БЛОГ  BEGIN -->
    <xsl:template match="item|page " mode="blogs">
        <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'foto_dlya_anonsa']/value"/>
        <xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>
        <xsl:variable name="kratkoe_opisanie" select="document(concat('upage://',@id))//property[@name = 'anons_stati' ]/value"/>



        <xsl:variable name="district" select="document(concat('upage://',@id))//property[@name = 'rajon']/value/item/@name"/>
        <xsl:variable name="type_id" select="document(concat('upage://',@id))/udata/page/@type-id"/>


        <div class="object">
            <div class="obj_photo">
                <a href="{$link}">
                    <img alt="{$title}" title="{$title}">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/215/170/default/0/1/5/80'))//src"/>
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
                    <!--xsl:call-template name="firstWords">
                        <xsl:with-param name="value" select="$kratkoe_opisanie"/>
                        <xsl:with-param name="count" select="160"/>
                    </xsl:call-template-->
                    <xsl:value-of select="$kratkoe_opisanie"/>
                </div>
                <div class="obj_button">
                    <a href="{$link}" class="">Подробнее</a>
                </div>
            </div>
        </div>

    </xsl:template>
    <!--  -->

    <xsl:template match="items/item" mode="blogs_list">
        <div class="blog_rub">
            <a href="{@link}">
                <xsl:value-of select="."/>
            </a>
        </div>
    </xsl:template>


    <!-- Вывод Как Бы БЛОГ END -->
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->

</xsl:stylesheet>
