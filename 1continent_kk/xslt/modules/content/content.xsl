<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page[@alt-name = 'krasnodar']]" mode="home">
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
                                <option value="obekty/novostrojki">Жилищные комплексы</option>
                                <!--option value="obekty/kvartiryi">Квартиры</option-->
                                <option value="obekty/doma">Дом</option>
                                <option value="obekty/kommercheskaya_nedvizhimost">Коммерческая недвижимость</option>
                            </select>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Район: </span>
                            <select name="rajon" class="width-auto">
                                <xsl:apply-templates select="document('usel://reg_user/148')/udata/item" mode="distinct"/>
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
                <a href="/krasnodar/obekty/novostrojki/" class="banmap"/>
                <a href="/blog/poleznye_sovety/0_komissii_vsegda/" rel="nofollow" class="blog_0_present"/>
            </div>
        </div>
        <!-- .wrapper -->
        <div class="special">
            <div class="wrapper">
                <div class="special_title">Спецпредложения</div>

                <div id="slider" class="slider">
                    <div class="slider_elements">
                        <xsl:apply-templates select="document('usel://to_slider_k/?limit=10')/udata/page" mode="sidebar_hot"/>

                    </div>
                </div>

                <div class="special_footer">
                    <a href="/krasnodar/specialnye_predlozheniya_i_akcii/">Все спецпредложения и акции</a>
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
                <div class="b_right">
                    <h2>Отзывы счастливых владельцев</h2>
                    <!--xsl:apply-templates select="document(concat('udata://blogs20/postsList/',112,'//2'))/udata/items/item" mode="otziv_blog_list"/-->
                    <xsl:apply-templates select="document(concat('udata://content/menu/0/0/', 477))/udata/items" mode="otziv_blog_list"/>
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
                            <a href="/krasnodar/novosti/">Все новости</a>
                        </td>
                    </tr>
                </table>


                <xsl:apply-templates select="document(concat('udata://news/lastlist/', 506,'//3'))/udata/items/item" mode="home_news_list"/>
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

        <!--div class="home_partners">
            <div class="wrapper">
                <xsl:comment>noindex</xsl:comment>
                <h2>Наши партнёры</h2>
                <xsl:apply-templates select=".//group[@name = 'nashi_partnry']/property[@type = 'img_file']" mode="partn"/>
                <div class="clear"/>
                <xsl:comment>/noindex</xsl:comment>
            </div>
        </div-->
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
                    <xsl:when test="page/@parentId = '477'">
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
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
    <!-- Страница Отдельной квартиры -->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page[@type-id = 128]]" mode="article">

        <xsl:variable name="id" select="@pageId"/>

        <xsl:variable name="parentid" select="page/@parentId"/>

        <xsl:variable name="j_k_id" select="parents/page[@id = $parentid]/@parentId"/>

        <xsl:variable name="j_k_data" select="document(concat('upage://',$j_k_id))//page"/>

        <xsl:variable name="districtid" select="parents/page[@id = $j_k_id]/@parentId"/>

        <xsl:variable name="district_data" select="document(concat('upage://',$districtid))//page"/>

        <xsl:variable name="object-id" select="document(concat('upage://', $id))/udata/page/@object-id"/>

        <xsl:variable name="type-id" select="/result/page/@type-id"/>

        <xsl:variable name="title" select=".//property[@name = 'h1']/value"/>

        <xsl:variable name="description" select=".//property[@name = 'content' ]/value"/>

        <xsl:variable name="jl_kratkoe_opisanie" select="$j_k_data//property[@name = 'kratkoe_opisanie' ]/value"/>

        <xsl:variable name="jk_opisanie" select="$j_k_data//property[@name = 'content' ]/value"/>

        <xsl:variable name="ipoteca" select="$j_k_data//property[@name = 'ipoteka']/value"/>

        <xsl:variable name="tehnologii" select="$j_k_data//property[@name = 'tehnologii_stroitelstva' ]/value"/>

        <xsl:variable name="infrastruktura" select="$j_k_data//property[@name = 'infrastruktura' ]/value"/>

        <xsl:variable name="p_path" select=".//property[@type = 'img_file']/value"/>

        <xsl:variable name="p_path_t" select=".//property[@type = 'img_file']/value/@path"/>

        <xsl:variable name="tarif" select="document(concat('upage://',$parentid,'.stoimost_kvadratnogo_metra'))/udata/property/value"/>

        <xsl:variable name="S" select="number(translate(.//property[@name = 'obwaya_prowad']/value, ',', '.'))"/>

        <xsl:variable name="cena" select="$tarif * $S"/>

        <xsl:variable name="kolichestvo_komnat" select=".//property[@name = 'kolichestvo_komnat']/value/item/@name"/>
        <xsl:variable name="kolichestvo_komnat_id" select=".//property[@name = 'kolichestvo_komnat']/value/item/@id"/>




        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:choose>
                    <xsl:when test="page/@parentId = '477'">
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/1/0')/udata"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <div class="headline">
                <span>
                    <xsl:call-template name="title">
                        <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                        <xsl:with-param name="S" select="$S"/>
                        <xsl:with-param name="jil_komp" select="$j_k_data//property[@name = 'h1']/value"/>
                    </xsl:call-template>
                </span>
            </div>
            <div class="content_detail" itemscope='"' itemtype="http://schema.org/Product">

                <div class="detail_info" id="obj_{$j_k_id}">
                    <!-- ============================== -->
                    <div class="photo_gallery">
                        <xsl:if test="$ipoteca = 1">
                            <div class="det_ipoteca"/>
                        </xsl:if>

                        <xsl:if test="$p_path = false()">
                            <img alt="{$title}" title="{$title}" src="{$template-resources}img/empty_appart.jpg" class="empty_appart"/>
                        </xsl:if>

                        <xsl:if test="$p_path != false()">
                            <div id="gallery" class="ad-gallery">
                                <div class="ad-image-wrapper"> </div>
                                <div class="ad-nav">
                                    <div class="ad-thumbs">
                                        <ul>
                                            <xsl:apply-templates select=".//group[@name = 'fotoalbom']/property[@type = 'img_file']" mode="gallery">
                                                <xsl:with-param name="title" select="$title"/>
                                            </xsl:apply-templates>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div id="hidden_gal" style="display:none">
                                <xsl:apply-templates select=".//group[@name = 'fotoalbom']/property[@type = 'img_file']" mode="gallery_plus">
                                    <xsl:with-param name="title" select="$title"/>
                                </xsl:apply-templates>
                            </div>

                            <script type="text/javascript">
                                $(document).ready(function() {
                                }); 
                            </script>
                        </xsl:if>

                    </div>
                    <!-- ============================== -->
                    <div class="info">
                        <div class="name" itemprop="name">
                            <h1>
                                <xsl:call-template name="title">
                                    <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                                    <xsl:with-param name="S" select="$S"/>
                                    <xsl:with-param name="jil_komp" select="$j_k_data//property[@name = 'h1']/value"/>
                                </xsl:call-template>
                            </h1>
                        </div>

                        <div class="distinct">Район: <a href="{$district_data/@link}"><xsl:value-of select="$district_data//property[@name = 'h1']/value"/></a></div>
                        <div class="distinct">Объект: <a href="{$j_k_data/@link}"><xsl:value-of select="$j_k_data//property[@name = 'h1']/value"/></a></div>

                        <div class="obj_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                            <meta itemprop="priceCurrency" content="RUB"/>
                            <span class="o_p_t">Стоимость: </span>
                            <span itemprop="price"><xsl:value-of select="format-number($cena, '### ###', 'european')"/> руб.</span>
                        </div>
                        <div class="obj_sub_price"> (<xsl:value-of select="format-number($tarif, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>


                        <span class="komissia">0% комиссии</span>
                        <div class="det_obj_button">
                            <a href="#summit" class="summit">Договориться о встрече в офисе</a>
                        </div>

                        <div class="det_obj_ipoteca">
                            <a href="#calc_form" id="inline_calc">Рассчитать ипотеку</a>
                        </div>


                        <div class="det_favorite">
                            <xsl:variable name="cart_items" select="document('udata://emarket/cart/')/udata/items"/>
                            <xsl:choose>
                                <xsl:when test="$cart_items/item[page/@id = $id]">
                                    <a id="{page/@id}" class="added_to_fav basket_list" href="#" onclick="return false;" title="Добавить в избранное"> В избранном </a>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a id="add_basket_{page/@id}" class="add_to_fav basket_list" href="#" title="Добавить в избранное"> Добавить в избранное </a>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="description">
                            <xsl:apply-templates select="//group[@name = 'parametry']/property" mode="k_param"/>
                        </div>
                        <div style="clear: both;"/>
                    </div>
                    <script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"/>
                    <div class="yashare-auto-init" data-yashareL10n="ru" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareTheme="counter"/>

                    <!-- ============================== -->
                    <div style="clear: both;"/>
                </div>
                <div class="det_btn">
                    <a id="inline_3" class="det_button ask_question" href="#ask_question">Задать вопрос консультанту</a>
                    <a id="inline_4" class="det_button ask_question" href="#request_call">Заказать звонок</a>
                </div>

                <!-- ============================== -->
                <div class="tabs_section">
                    <ul class="tabs">
                        <li class="current">Описание</li>
                        <xsl:if test="$jk_opisanie = true()">
                            <li>
                                <xsl:value-of select="$j_k_data//property[@name= 'h1']/value"/>
                            </li>
                        </xsl:if>
                        <xsl:if test="$tehnologii = true()">
                            <li>Технология строительства</li>
                        </xsl:if>
                        <xsl:if test="$infrastruktura = true()">
                            <li>Инфраструктура</li>
                        </xsl:if>
                        <xsl:if test="$j_k_data//group[@name = 'unikalnye_bonusy'] = true()">
                            <li>Уникальные бонусы</li>
                        </xsl:if>
                    </ul>
                    <div class="box visible" itemprop="description">
                        <!-- Описание -->
                        <!--xsl:value-of select="$description" disable-output-escaping="yes"/-->
                        <xsl:text>
                        Продается 
                        </xsl:text>
                        <xsl:choose>
                            <xsl:when test="$kolichestvo_komnat = '1'"> 1-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = '2'"> 2-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = '3'"> 3-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = '4+'"> 4-комнатная квартира </xsl:when>
                            <xsl:when test="$kolichestvo_komnat = 'Студия'"> студия площадью </xsl:when>
                            <xsl:otherwise> квартира </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>
                         в 
                        </xsl:text>
                        <xsl:value-of select="$j_k_data//property[@name = 'h1']/value"/>
                        <xsl:text>
                        в городе Краснодар от центра новостроек "1 Континент". Стоимость квартиры                         
                        </xsl:text>
                        <xsl:value-of select="$cena"/>
                        <xsl:text> 
                         рублей. Жилой комплекс находится в районе 
                        </xsl:text>
                        <xsl:value-of select="$district_data//property[@name = 'h1']/value"/>
                        <xsl:text>. 
                            Общая площадь квартиры 
                            </xsl:text>
                        <xsl:value-of select="$S"/>
                        <xsl:text>
                        кв. м. Имеет рациональную планировку: жилая площадь -                         
                        </xsl:text>
                        <xsl:value-of select=".//property[@name = 'zhilaya_prowad']/value"/>
                        <xsl:text>
                        кв. м., площадь кухни - 
                        </xsl:text>
                        <xsl:value-of select=".//property[@name = 'plowad_kuhni']/value"/>
                        <xsl:text>
                            кв. м., 
                        </xsl:text>
                        <xsl:value-of select=".//property[@name = 'nalichie_lodzhiibalkona']/value"/>
                        <xsl:text> . 
                            Стоимость квартиры за 1 кв.м. = 
                        </xsl:text>
                        <xsl:value-of select="format-number($tarif, '### ###', 'european')"/> руб. <xsl:if test="$ipoteca = 1"> Возможно осуществить покупку квартиры в ипотеку. </xsl:if>
                    </div>
                    <xsl:if test="$jk_opisanie = true()">
                        <div class="box">
                            <!-- Жил. Комплекс -->
                            <xsl:value-of select="$jl_kratkoe_opisanie" disable-output-escaping="yes"/>
                            <xsl:value-of select="$jk_opisanie" disable-output-escaping="yes"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="$tehnologii = true()">
                        <div class="box">
                            <!-- Технология строительства -->
                            <xsl:value-of select="$tehnologii" disable-output-escaping="yes"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="$infrastruktura = true()">
                        <div class="box">
                            <!-- Инфраструктура -->
                            <xsl:value-of select="$infrastruktura" disable-output-escaping="yes"/>
                        </div>
                    </xsl:if>
                    <xsl:if test="$j_k_data//group[@name = 'unikalnye_bonusy'] = true()">
                        <div class="box">
                            <!-- Уникальные бонусы -->
                            <div class="unikalnye_bonusy">
                                <!--xsl:apply-templates select=".//group[@name = 'unikalnye_bonusy']/property" mode="unikalnye_bonusy"/-->
                                <script type="text/javascript" src="{$template-resources}js/un_bon.js"/>
                            </div>
                        </div>
                    </xsl:if>

                </div>
                <!-- .section -->
                <!--============================-->

                <div class="content_sub_info">
                    <!-- Похожие объекты -->
                    <xsl:if test="document(concat('udata://content/getSimilarAppart/', $cena,'/',$kolichestvo_komnat_id,'/5/150000'))/udata/page/item = true()">
                        <div class="special_title">Похожие объекты</div>
                    </xsl:if>
                    <div class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document(concat('udata://content/getSimilarAppart/', $cena,'/',$kolichestvo_komnat_id,'/5/150000'))/udata/page/item" mode="simi_appart">
                                <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                            </xsl:apply-templates>
                        </div>
                    </div>

                    <div style="clear: both;"/>
                    <div class="special_title">Спецпредложения</div>
                    <div class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document(concat('udata://content/getSimilarAppart/0/',$kolichestvo_komnat_id,'/1000/0'))/udata/page/item[position() &lt; 10]"
                                mode="simi_appart">
                                <xsl:sort order="ascending" select="number(@stoimost)" data-type="number"/>
                                <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                            </xsl:apply-templates>
                        </div>
                    </div>
                    <div style="clear: both;"/>
                </div>
            </div>
        </div>

    </xsl:template>

    <xsl:template match="item" mode="simi_appart">

        <xsl:param name="kolichestvo_komnat"/>

        <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>

        <xsl:variable name="link" select="@link"/>

        <xsl:variable name="price" select="@stoimost"/>

        <xsl:variable name="price_km" select="@ckm"/>

        <xsl:variable name="obwaya_prowad" select="@obwaya_prowad"/>

        <xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'foto']/value"/>

        <xsl:variable name="group_id" select="@par_id"/>

        <xsl:variable name="group_page" select="document(concat('upage://',$group_id))"/>

        <xsl:variable name="j_k_id" select="$group_page/udata/page/@parentId"/>

        <xsl:variable name="j_k_page" select="document(concat('upage://',$j_k_id))"/>

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
                <div class="s_obj_title">
                    <a href="{$link}" title="{$title}">
                        <xsl:call-template name="title">
                            <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                            <xsl:with-param name="S" select="$obwaya_prowad"/>
                            <xsl:with-param name="jil_komp" select="$j_k_page//property[@name = 'h1']/value"/>
                        </xsl:call-template>

                    </a>
                </div>
                <div class="s_obj_cost">
                    <span>Стоимость: </span>
                    <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. <xsl:if test="$price_km = true()">
                        <span class="s_obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </span>
                    </xsl:if>
                </div>

            </div>
        </div>
        <!-- item END -->
    </xsl:template>

    <xsl:template match="property" mode="k_param"/>

    <xsl:template match="property[@type = 'string']" mode="k_param">
        <div class="k_param">
            <strong><xsl:value-of select="title"/>: </strong>
            <span><xsl:value-of select="value"/></span> м<sup>2</sup>
        </div>
    </xsl:template>

    <xsl:template match="property[@type = 'string' and @name = 'nalichie_lodzhiibalkona']" mode="k_param">
        <div class="k_param">
            <strong><xsl:value-of select="title"/>: </strong>
            <span>
                <xsl:value-of select="value"/>
            </span>
        </div>
    </xsl:template>

    <xsl:template name="title">
        <xsl:param name="kolichestvo_komnat"/>
        <xsl:param name="S"/>
        <xsl:param name="jil_komp"/>

        <xsl:choose>
            <xsl:when test="$kolichestvo_komnat = '1'">1-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = '2'">2-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = '3'">3-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = '4+'">4-комнатная квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:when test="$kolichestvo_komnat = 'Студия'">Студия площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:when>
            <xsl:otherwise>Квартира площадью <xsl:value-of select="$S"/> кв. м. в <xsl:value-of select="$jil_komp"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--===========================================================================================================================-->
    <!-- Страница ВСЕ квартиры -->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page[@type-id = 155]]" mode="article">
        <xsl:variable name="title" select=".//property[@name = 'h1']/value"/>
        <xsl:variable name="kolichestvo_komnat" select=".//property[@name = 'kolichestvo_komnat']/value/item/@id"/>
        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:choose>
                    <xsl:when test="page/@parentId = '477'">
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <div class="headline">
                <span>
                    <xsl:value-of select="$title"/>
                </span>
            </div>
            <div class="headline">
                <!--span>Быстрый подбор недвижимости: </span-->
                <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',550,'/0/1/0'))/udata/items" mode="subcatalog3">
                    <xsl:with-param name="uri" select="page/@link"/>
                    <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                </xsl:apply-templates>

                <xsl:if test="string-length($raion) != 0">
                    <xsl:apply-templates select="document('udata://content/menu/default/0/1253')/udata/items" mode="subcatalog_komn2">
                        <xsl:with-param name="komn" select=".//property[@name = 'kolichestvo_komnat']"/>
                    </xsl:apply-templates>
                </xsl:if>

                <!--xsl:apply-templates select="document('udata://content/menu/default/0/1253')/udata/items" mode="subcatalog_komn">
                    <xsl:with-param name="komn" select="$title"/>
                </xsl:apply-templates-->

                <div style="clear: both;"/>
            </div>

            <div class="catalog">
                <xsl:choose>
                    <xsl:when test=".//property[@name = 'kolichestvo_komnat'] = false()">
                        <!--xsl:apply-templates select="document(concat('usel://rooms/', 0,'/',$raion,'/?page=',$p))/udata" mode="gk"/-->
                        <xsl:apply-templates select="document(concat('udata://content/getAppartKK/all/',$raion,'/10'))/udata" mode="gkk"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--xsl:apply-templates select="document(concat('usel://rooms/', .//property[@name = 'kolichestvo_komnat']/value/item/@id,'/',$raion,'/?page=',$p))/udata" mode="gk"/-->
                        <xsl:apply-templates select="document(concat('udata://content/getAppartKK/', .//property[@name = 'kolichestvo_komnat']/value/item/@id,'/',$raion,'/10'))/udata" mode="gkk"/>
                    </xsl:otherwise>
                </xsl:choose>


                <xsl:if test="$p = 0">
                    <xsl:if test="string-length($raion) = 0">
                        <div class="article">
                            <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                        </div>
                    </xsl:if>
                </xsl:if>

                <div style="clear: both;"/>
            </div>
            <xsl:call-template name="sidebar"/>
            <div style="clear: both;"/>
        </div>

    </xsl:template>


    <xsl:template match="items" mode="subcatalog2">
        <xsl:param name="uri"/>
        <xsl:variable name="current_raion" select="document(concat('upage://', $raion,'.h1'))//value"/>
        <div style="display: inline-block; position: relative; z-index:100" class="jq-selectbox jqselect">
            <div style="position: relative" class="jq-selectbox__select">
                <xsl:choose>
                    <xsl:when test="$current_raion = true()">
                        <div class="jq-selectbox__select-text" style="width: 110px;">
                            <xsl:value-of select="$current_raion"/>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="jq-selectbox__select-text" style="width: 110px;">Выберите район</div>
                    </xsl:otherwise>
                </xsl:choose>
                <div class="jq-selectbox__trigger">
                    <div class="jq-selectbox__trigger-arrow"/>
                </div>
            </div>
            <div style="position: absolute; display: none;" class="jq-selectbox__dropdown">
                <ul style="position: relative; list-style: none; overflow: auto; overflow-x: hidden">
                    <li style="display: block; white-space: nowrap;">
                        <a href="{$uri}">
                            <xsl:text>Любой районы</xsl:text>
                        </a>
                    </li>
                    <xsl:apply-templates select="item" mode="subcatalog2">
                        <xsl:with-param name="uri" select="$uri"/>
                    </xsl:apply-templates>
                </ul>
            </div>
        </div>

    </xsl:template>

    <xsl:template match="item" mode="subcatalog2">
        <xsl:param name="uri"/>
        <li style="display: block; white-space: nowrap;">
            <a href="{$uri}?raion={document(concat('upage://',@id))/udata/page/@alt-name}">
                <xsl:value-of select="."/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="items" mode="subcatalog_komn">
        <xsl:param name="komn"/>
        <div style="display: inline-block; position: relative; z-index:100" class="jq-selectbox jqselect">
            <div style="position: relative" class="jq-selectbox__select">
                <xsl:choose>
                    <xsl:when test="$komn != 'Квартиры'">
                        <div class="jq-selectbox__select-text" style="width: 110px;">
                            <xsl:value-of select="$komn"/>
                        </div>
                    </xsl:when>
                    <xsl:when test="$komn = 'Квартиры'">
                        <div class="jq-selectbox__select-text" style="width: 110px;">Выберите количество комнат</div>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="jq-selectbox__select-text" style="width: 110px;">Выберите количество комнат</div>
                    </xsl:otherwise>
                </xsl:choose>

                <div class="jq-selectbox__trigger">
                    <div class="jq-selectbox__trigger-arrow"/>
                </div>
            </div>
            <div style="position: absolute; display: none;" class="jq-selectbox__dropdown">
                <ul style="position: relative; list-style: none; overflow: auto; overflow-x: hidden">
                    <li style="display: block; white-space: nowrap;">
                        <xsl:choose>
                            <xsl:when test="string-length($raion) = 0">
                                <a href="/krasnodar/obekty/kvartiry/">
                                    <xsl:text>Любой количество комнат</xsl:text>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="/krasnodar/obekty/kvartiry/?raion={$raion}">
                                    <xsl:text>Любой количество комнат</xsl:text>
                                </a>
                            </xsl:otherwise>
                        </xsl:choose>
                    </li>

                    <xsl:apply-templates select="item" mode="subcatalog_komn"/>
                </ul>
            </div>
        </div>

    </xsl:template>

    <xsl:template match="item" mode="subcatalog_komn">
        <li style="display: block; white-space: nowrap;">
            <xsl:choose>
                <xsl:when test="string-length($raion) = 0">
                    <a href="{@link}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a href="{@link}?raion={$raion}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>

    <xsl:template match="items" mode="subcatalog3">
        <xsl:param name="uri"/>
        <xsl:param name="kolichestvo_komnat"/>
        <div class="block_step_link">
            <!--a class="step_link" href="{$uri}">Все</a-->
            <a class="step_link" href="/krasnodar/obekty/kvartiry/">Все</a>
            <xsl:apply-templates select="item" mode="subcatalog3">
                <xsl:with-param name="uri" select="$uri"/>
                <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match="item" mode="subcatalog3">
        <xsl:param name="uri"/>
        <xsl:param name="kolichestvo_komnat"/>
        <xsl:variable name="pr" select="document(concat('upage://',@id))/udata/page/@alt-name"/>
        <xsl:variable name="romms_count" select="document(concat('udata://content/getAppartKK/', $kolichestvo_komnat,'/',$pr))/udata/total"/>

        <xsl:choose>
            <xsl:when test="$pr = $raion">
                <a class="step_link checked" href="{$uri}?raion={$pr}">
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="string-length($raion) = 0 and $romms_count != 0">
                    <a class="step_link" href="{$uri}?raion={$pr}">
                        <xsl:value-of select="."/>
                    </a>
                </xsl:if>

            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="items" mode="subcatalog_komn2">
        <xsl:param name="komn"/>
        <div class="block_step_link">
            <xsl:choose>
                <xsl:when test="string-length($raion) = 0">
                    <a class="step_link" href="/krasnodar/obekty/kvartiry/">
                        <xsl:text>Любой количество комнат</xsl:text>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a class="step_link" href="/krasnodar/obekty/kvartiry/?raion={$raion}">
                        <xsl:text>Любой количество комнат</xsl:text>
                    </a>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:apply-templates select="item" mode="subcatalog_komn2">
                <xsl:with-param name="komn" select="$komn"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match="item" mode="subcatalog_komn2">
        <xsl:param name="komn"/>
        <xsl:variable name="id_room" select="document(concat('upage://', @id,'.kolichestvo_komnat'))/udata/property/value/item/@id"/>
        <xsl:variable name="romms_count" select="document(concat('udata://content/getAppartKK/', $id_room,'/',$raion))/udata/total"/>

        <xsl:choose>
            <xsl:when test="string-length($raion) = 0">

                <xsl:choose>
                    <xsl:when test="$document-page-id = @id">
                        <a class="step_link checked" href="{@link}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$komn = false() and $romms_count != 0">
                            <a class="step_link" href="{@link}">
                                <xsl:value-of select="."/>
                            </a>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:when>

            <xsl:otherwise>

                <xsl:choose>
                    <xsl:when test="$document-page-id = @id">
                        <a class="step_link checked" href="{@link}?raion={$raion}">
                            <xsl:value-of select="."/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$komn = false() and $romms_count != 0">
                            <a class="step_link" href="{@link}?raion={$raion}">
                                <xsl:value-of select="."/>
                            </a>
                        </xsl:if>
                    </xsl:otherwise>

                </xsl:choose>
            </xsl:otherwise>

        </xsl:choose>
    </xsl:template>
    <!--===========================================================================================================================-->
    <!-- Страница группы квартир -->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'content' and page[@type-id = 154]]" mode="article">

        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <span>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </span>
            </div>
            <div class="catalog">
                <xsl:apply-templates select="document(concat('udata://content/menu/0/0/', @pageId))/udata/items" mode="items_group"/>
                <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>

                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>

    </xsl:template>

    <xsl:template match="udata" mode="gk">
        <xsl:choose>
            <xsl:when test="total = 0">
                <div class="c_title"> На данный момент в выбранном вами районе нет наших объектов. Но Вы можете подобрать недвижимость в другом районе. </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="page" mode="items_group"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',10,'/'))/udata" mode="upload"/>
    </xsl:template>

    <xsl:template match="item|page " mode="items_group">

        <xsl:variable name="id" select="@id"/>

        <xsl:variable name="page" select="document(concat('upage://',$id))"/>

        <xsl:variable name="group_id" select="$page/udata/page/@parentId"/>

        <xsl:variable name="group_page" select="document(concat('upage://',$group_id))"/>

        <xsl:variable name="j_k_id" select="$group_page/udata/page/@parentId"/>

        <xsl:variable name="j_k_page" select="document(concat('upage://',$j_k_id))"/>

        <xsl:variable name="district_id" select="$j_k_page/udata/page/@parentId"/>

        <xsl:variable name="district_page" select="document(concat('upage://',$district_id))"/>

        <xsl:variable name="title" select="$page//property[@name = 'h1']/value"/>

        <xsl:variable name="photo" select="$page//property[@name = 'foto']/value"/>

        <xsl:variable name="link" select="$page/udata/page/@link"/>

        <xsl:variable name="ipoteca" select="$j_k_page//property[@name = 'ipoteka']/value"/>

        <xsl:variable name="kolichestvo_komnat" select="$page//property[@name = 'kolichestvo_komnat']/value/item/@name"/>

        <xsl:variable name="S" select="number(translate($page//property[@name = 'obwaya_prowad']/value, ',', '.'))"/>

        <xsl:variable name="tarif" select="document(concat('upage://',$group_id,'.stoimost_kvadratnogo_metra'))/udata/property/value"/>

        <xsl:variable name="cena" select="$tarif * $S"/>

        <xsl:variable name="object_sq" select="$page/udata/page/properties/group[@name = 'parametry']"/>

        <div class="object">
            <div class="obj_photo">
                <xsl:if test="$ipoteca = 1">
                    <div class="cat_ipoteca"/>
                </xsl:if>

                <a href="{$link}" onclick="yaCounter21668962.reachGoal('select_obj'); return true;">
                    <!--xsl:choose>
                        <xsl:when test="$photo = true()">
                            <img alt="{$title}" title="{$title}">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/294/263/default/0/1/5/80'))//src"/>
                                </xsl:attribute>
                            </img>
                        </xsl:when>
                        <xsl:otherwise>
                            <img alt="{$title}" title="{$title}" src="{$template-resources}img/empty_appart.jpg"> </img>
                        </xsl:otherwise>
                    </xsl:choose-->
                    <img alt="{$title}" title="{$title}" src="{$template-resources}img/kvart/{$kolichestvo_komnat}/1.png"> </img>
                </a>
            </div>
            <div class="obj_info">
                <h4 class="obj_title">
                    <a href="{$link}" onclick="yaCounter21668962.reachGoal('select_obj'); return true;">
                        <xsl:call-template name="title">
                            <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                            <xsl:with-param name="S" select="$S"/>
                            <xsl:with-param name="jil_komp" select="$j_k_page//property[@name = 'h1']/value"/>
                        </xsl:call-template>
                    </a>
                </h4>
                <div class="obj_distinct">Район: <a href="{$district_page/udata/page/@link}"><xsl:value-of select="$district_page//property[@name = 'h1']/value"/></a></div>
                <div class="obj_distinct">Объект: <a href="{$j_k_page/udata/page/@link}"><xsl:value-of select="$j_k_page//property[@name = 'h1']/value"/></a></div>

                <div class="obj_price">
                    <span>Стоимость: <xsl:value-of select="format-number($cena, '### ###', 'european')"/> руб.</span>
                </div>
                <!--div class="obj_sub_price">  (<xsl:value-of select="format-number($tarif, '### ###', 'european')"/> руб. за м<sup>2</sup>)  </div-->

                <!--div class="description">
                    <xsl:apply-templates select="$page//group[@name = 'parametry']/property" mode="k_param"/>
                </div-->
                <div class="description">
                    <div class="a_r_i">
                        <table>
                            <tr>
                                <td class="th a_r_i_op">
                                    <xsl:value-of select="$object_sq/property[@name = 'obwaya_prowad']/title"/>
                                </td>
                                <td class="th a_r_i_zp">
                                    <xsl:value-of select="$object_sq/property[@name = 'zhilaya_prowad']/title"/>
                                </td>
                                <td class="th a_r_i_pk">
                                    <xsl:value-of select="$object_sq/property[@name = 'plowad_kuhni']/title"/>
                                </td>
                                <td class="th a_r_i_nlb">
                                    <xsl:value-of select="$object_sq/property[@name = 'nalichie_lodzhiibalkona']/title"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td a_r_i_op">
                                    <xsl:value-of select="$object_sq/property[@name = 'obwaya_prowad']/value"/> м<sup>2</sup>. </td>
                                <td class="td a_r_i_zp">
                                    <xsl:value-of select="$object_sq/property[@name = 'zhilaya_prowad']/value"/> м<sup>2</sup>. </td>
                                <td class="td a_r_i_pk">
                                    <xsl:value-of select="$object_sq/property[@name = 'plowad_kuhni']/value"/> м<sup>2</sup>. </td>
                                <td class="td a_r_i_nlb">
                                    <xsl:value-of select="$object_sq/property[@name = 'nalichie_lodzhiibalkona']/value"/>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

                <div class="obj_button">
                    <a href="#summit" class="summit" onclick="yaCounter21668962.reachGoal('summit{$j_k_id}'); return true;">Договориться о встрече в офисе</a>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="udata" mode="gkk">
        <xsl:choose>
            <xsl:when test="total = 0">
                <div class="c_title"> На данный момент в выбранном вами районе нет наших объектов. Но Вы можете подобрать недвижимость в другом районе. </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="page/item" mode="items_group_k"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',10,'/'))/udata" mode="upload"/>
    </xsl:template>

    <xsl:template match="item " mode="items_group_k">

        <xsl:variable name="id" select="@id"/>

        <xsl:variable name="page" select="document(concat('upage://',$id))"/>

        <xsl:variable name="group_id" select="$page/udata/page/@parentId"/>

        <xsl:variable name="group_page" select="document(concat('upage://',$group_id))"/>

        <xsl:variable name="j_k_id" select="$group_page/udata/page/@parentId"/>

        <xsl:variable name="j_k_page" select="document(concat('upage://',$j_k_id))"/>

        <xsl:variable name="district_id" select="$j_k_page/udata/page/@parentId"/>

        <xsl:variable name="district_page" select="document(concat('upage://',$district_id))"/>

        <xsl:variable name="title" select="$page//property[@name = 'h1']/value"/>

        <xsl:variable name="photo" select="$page//property[@name = 'foto']/value"/>

        <xsl:variable name="link" select="$page/udata/page/@link"/>

        <xsl:variable name="ipoteca" select="$j_k_page//property[@name = 'ipoteka']/value"/>

        <xsl:variable name="kolichestvo_komnat" select="$page//property[@name = 'kolichestvo_komnat']/value/item/@name"/>

        <xsl:variable name="S" select="number(translate($page//property[@name = 'obwaya_prowad']/value, ',', '.'))"/>

        <xsl:variable name="tarif" select="document(concat('upage://',$group_id,'.stoimost_kvadratnogo_metra'))/udata/property/value"/>

        <xsl:variable name="cena" select="$tarif * $S"/>

        <xsl:variable name="object_sq" select="$page/udata/page/properties/group[@name = 'parametry']"/>

        <div class="object">
            <div class="obj_photo">
                <xsl:if test="$ipoteca = 1">
                    <div class="cat_ipoteca"/>
                </xsl:if>

                <a href="{$link}" onclick="yaCounter21668962.reachGoal('select_obj'); return true;">
                    <!--xsl:choose>
                        <xsl:when test="$photo = true()">
                            <img alt="{$title}" title="{$title}">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/294/263/default/0/1/5/80'))//src"/>
                                </xsl:attribute>
                            </img>
                        </xsl:when>
                        <xsl:otherwise>
                            <img alt="{$title}" title="{$title}" src="{$template-resources}img/empty_appart.jpg"> </img>
                        </xsl:otherwise>
                    </xsl:choose-->
                    <img alt="{$title}" title="{$title}" src="{$template-resources}img/kvart/{$kolichestvo_komnat}/1.png"> </img>
                </a>
            </div>
            <div class="obj_info">
                <h4 class="obj_title">
                    <a href="{$link}" onclick="yaCounter21668962.reachGoal('select_obj'); return true;">
                        <xsl:call-template name="title">
                            <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                            <xsl:with-param name="S" select="$S"/>
                            <xsl:with-param name="jil_komp" select="$j_k_page//property[@name = 'h1']/value"/>
                        </xsl:call-template>
                    </a>
                </h4>
                <div class="obj_distinct">Район: <a href="{$district_page/udata/page/@link}"><xsl:value-of select="$district_page//property[@name = 'h1']/value"/></a></div>
                <div class="obj_distinct">Объект: <a href="{$j_k_page/udata/page/@link}"><xsl:value-of select="$j_k_page//property[@name = 'h1']/value"/></a></div>

                <div class="obj_price">
                    <span>Стоимость: <xsl:value-of select="format-number($cena, '### ###', 'european')"/> руб.</span>
                </div>
                <!--div class="obj_sub_price">  (<xsl:value-of select="format-number($tarif, '### ###', 'european')"/> руб. за м<sup>2</sup>)  </div-->

                <!--div class="description">
                    <xsl:apply-templates select="$page//group[@name = 'parametry']/property" mode="k_param"/>
                </div-->
                <div class="description">
                    <div class="a_r_i">
                        <table>
                            <tr>
                                <td class="th a_r_i_op">
                                    <xsl:value-of select="$object_sq/property[@name = 'obwaya_prowad']/title"/>
                                </td>
                                <td class="th a_r_i_zp">
                                    <xsl:value-of select="$object_sq/property[@name = 'zhilaya_prowad']/title"/>
                                </td>
                                <td class="th a_r_i_pk">
                                    <xsl:value-of select="$object_sq/property[@name = 'plowad_kuhni']/title"/>
                                </td>
                                <td class="th a_r_i_nlb">
                                    <xsl:value-of select="$object_sq/property[@name = 'nalichie_lodzhiibalkona']/title"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td a_r_i_op">
                                    <xsl:value-of select="$object_sq/property[@name = 'obwaya_prowad']/value"/> м<sup>2</sup>. </td>
                                <td class="td a_r_i_zp">
                                    <xsl:value-of select="$object_sq/property[@name = 'zhilaya_prowad']/value"/> м<sup>2</sup>. </td>
                                <td class="td a_r_i_pk">
                                    <xsl:value-of select="$object_sq/property[@name = 'plowad_kuhni']/value"/> м<sup>2</sup>. </td>
                                <td class="td a_r_i_nlb">
                                    <xsl:value-of select="$object_sq/property[@name = 'nalichie_lodzhiibalkona']/value"/>
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

                <div class="obj_button">
                    <a href="#summit" class="summit" onclick="yaCounter21668962.reachGoal('summit{$j_k_id}'); return true;">Договориться о встрече в офисе</a>
                </div>
            </div>
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
                <span itemprop="name">1 Континет</span>
                <div itemprop="description">
                    <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                </div>
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

                <a href="#summit" class="summit contacts_in_ofise">Договориться о встрече в офисе</a>

                <div class="map">
                    <xsl:value-of select=".//property[@name = 'map']/value" disable-output-escaping="yes"/>
                </div>


                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
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

                <div class="stuff">
                    <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',481,'/0////1'))/udata" mode="stuff"/>
                </div>

                <div style="clear: both;"/>
            </div>

            <xsl:call-template name="sidebar"/>
        </div>

    </xsl:template>


    <!--===========================================================================================================================-->
    <!-- Отзывы счастливых владельцев -->
    <xsl:template match="result[@module = 'content' and page[@alt-name = 'otzyvy_schastlivyh_vladelcev']]" mode="article">
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
                <xsl:apply-templates select="document(concat('udata://content/menu/0/0/', 477))/udata/items" mode="otziv_blog_list2"/>
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
                <xsl:apply-templates select="document('usel://to_slider_k/?limit=10')/udata/page" mode="items"/>

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
    <!--xsl:template match="result[@method = 'search_do']" mode="search">
        <div class="wrapper">
            <div class="headline">
                <h1>Результаты поиска</h1>
            </div>
            <div class="search_result">
                <xsl:apply-templates select="document('udata://search/search_do////460/15')/udata" mode="search-result"/>
            </div>
            <xsl:call-template name="sidebar"/>
        </div>
    </xsl:template-->
    <xsl:template match="result[@module = 'content' and @method = 'content' and page[@alt-name = 'search_result']]" mode="article">
        <div class="wrapper">
            <div class="headline">
                <h1>Результаты поиска</h1>
            </div>
            <div class="search_result">
                <xsl:apply-templates select="document('udata://search/search_do////460/15')/udata" mode="search-result"/>
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
            <form action="/krasnodar/search_result/" method="get" class="morf_search">
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
        <xsl:if test="@id != '475'">
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
        </xsl:if>
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
        <div class="headline">
            <h2 style="font-weight: normal;">
                <em>
                    <xsl:value-of select=".//property[@name = 'slogan']/value"/>
                </em>
            </h2>
        </div>
        <div class="sitemap">
            <xsl:apply-templates select="document('udata://content/fullSitemap//10')" mode="sitemap"/>
        </div>
    </xsl:template>
    <xsl:template match="items" mode="sitemap">
        <ul>
            <xsl:apply-templates select="item" mode="sitemap"/>
        </ul>
    </xsl:template>
    <xsl:template match="item[@link != '/sitemap/'][@link != '/en/sitemap/'][@link != '/home/informacionnaya_stranica/'][@link != '/en/home/informacionnaya_stranica/']" mode="sitemap">
        <li>
            <a href="{@link}">
                <xsl:value-of select="@name"/>
            </a>
            <xsl:apply-templates select="items" mode="sitemap"/>
        </li>
    </xsl:template>
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@method = 'notfound']">
        <div class="wrapper">
            <div class="article">
                <div class="notfound"> 404 <br/> Страница не найдена!<br/>
                    <span>Извините, но запрашиваемая вами страница отсутствует. Воспользуйтесь навигационным меню, чтобы перейти в нужный раздел нашего сайта или перейдите на <a href="/krasnodar/"
                            >главную страницу</a> сайта.</span>
                </div>

                <div style="clear: both;"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
