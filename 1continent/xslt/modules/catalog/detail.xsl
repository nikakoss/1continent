<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp   "&#160;">
    <!ENTITY mdash  "&#8212;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->
    <xsl:decimal-format name="european" decimal-separator="," grouping-separator=" "/>
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'catalog' and @method = 'object'][page/@type-id = '136']" />
    <xsl:template match="result[@module = 'catalog' and @method = 'object'][page/@type-id != '136']">


        <xsl:variable name="id" select="@pageId"/>
        <xsl:variable name="object-id" select="document(concat('upage://', $id))/udata/page/@object-id"/>

        <xsl:variable name="type-id" select="/result/page/@type-id"/>

        <xsl:variable name="title" select=".//property[@name = 'h1']/value"/>
        <xsl:variable name="description" select=".//property[@name = 'content' ]/value"/>
        <xsl:variable name="kratkoe_opisanie" select=".//property[@name = 'kratkoe_opisanie' ]/value"/>
        <xsl:variable name="tehnikoekonomicheskie_pokazateli" select=".//property[@name = 'tehnikoekonomicheskie_pokazateli' ]"/>
        <xsl:variable name="konstrukcii" select=".//property[@name = 'konstrukcii' ]"/>
        <xsl:variable name="district" select=".//property[@name = 'rajon']/value/item/@name"/>
        <!--xsl:variable name="target" select=".//property[@name = 'target']/value/item/@id"/-->
        <xsl:variable name="ipoteca" select=".//property[@name = 'ipoteka']/value"/>


        <xsl:variable name="price" select=".//property[@name = 'cena']/value"/>
        <xsl:variable name="price_km" select=".//property[@name = 'cena_km']/value"/>


        <xsl:variable name="tehnologii" select=".//property[@name = 'tehnologii_stroitelstva' ]/value"/>
        <xsl:variable name="infrastruktura" select=".//property[@name = 'infrastruktura' ]/value"/>
        <xsl:variable name="planirovki" select=".//property[@name = 'planirovki' ]/value"/>

        <!--xsl:variable name="diff">100000</xsl:variable-->


        <xsl:variable name="p_path" select=".//property[@type = 'img_file']/value"/>
        <xsl:variable name="p_path_t" select=".//property[@type = 'img_file']/value/@path"/>

        <div class="wrapper">
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>
            <div class="headline">
                <h2>Подбор недвижимости: <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h2>
            </div>

            <div class="content_detail" itemscope='"' itemtype="http://schema.org/Product">

                <div class="detail_info" id="obj_{$id}">
                    <!-- ============================== -->
                    <div class="photo_gallery">
                        <xsl:if test="$ipoteca = 1">
                            <div class="det_ipoteca"/>
                        </xsl:if>

                        <xsl:if test="$p_path = false()">
                            <img src="{$template-resources}img/no_photo_2.png" title="{$title}" alt="{$title}"/>
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
                                <xsl:value-of select="$title"/>
                            </h1>
                        </div>
                        <div class="distinct">Район: <xsl:value-of select="$district"/></div>

                        <xsl:if test="parents/page/@alt-name = 'kommercheskaya_nedvizhimost'">
                            <div class="distinct">Площадь: <xsl:value-of select=".//property[@name = 'plowad']/value"/> м<sup>2</sup></div>
                        </xsl:if>


                        <xsl:choose>
                            <xsl:when test=".//property[@name = 'tip_realizacii'] = true()">
                                <xsl:choose>
                                    <xsl:when test=".//property[@name = 'tip_realizacii']/value/item/@id  = 401">
                                        <div class="obj_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                            <meta itemprop="priceCurrency" content="RUB"/>
                                            <span class="o_p_t">Стоимость аренды: </span>
                                            <span itemprop="price"><xsl:value-of select="format-number($price, '### ###', 'european')"/> руб. за м<sup>2</sup></span>
                                        </div>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="$price != 0">
                                                <div class="obj_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                                    <meta itemprop="priceCurrency" content="RUB"/>
                                                    <span class="o_p_t">Стоимость: от </span>
                                                    <span itemprop="price"><xsl:value-of select="format-number($price, '### ###', 'european')"/> р. </span>
                                                </div>
                                                <xsl:if test="$price_km != 0">
                                                    <div class="obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <div class="obj_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                                    <meta itemprop="priceCurrency" content="RUB"/>
                                                    <xsl:if test="$price_km != 0">
                                                        <span class="o_p_t">Цена: </span>
                                                        <span itemprop="price"><xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup></span>
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
                                        <div class="obj_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                            <meta itemprop="priceCurrency" content="RUB"/>
                                            <span class="o_p_t">Стоимость: от </span>
                                            <span itemprop="price"><xsl:value-of select="format-number($price, '### ###', 'european')"/> р. </span>
                                        </div>
                                        <xsl:if test="$price_km != 0">
                                            <div class="obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="obj_price" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                            <meta itemprop="priceCurrency" content="RUB"/>
                                            <xsl:if test="$price_km != 0">
                                                <span class="o_p_t">Цена: </span>
                                                <span itemprop="price"><xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup></span>
                                            </xsl:if>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>


                        <span class="komissia">0% комиссии</span>
                        <div class="det_obj_button">
                            <!--a href="#summit" class="summit">Договориться о встрече в офисе</a-->
                            <a href="#summit" class="summit">Купить квартиру</a>
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
                        <div style="clear: both;"/>
                    </div>
                    <div class="description">

                        <xsl:value-of select="$kratkoe_opisanie" disable-output-escaping="yes"/>

                        <!--xsl:call-template name="firstWords">
                            <xsl:with-param name="value" select="$kratkoe_opisanie"/>
                            <xsl:with-param name="count" select="42"/>
                        </xsl:call-template-->
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
                        <xsl:if test="document(concat('udata://content/menu/0/0/', $id))/udata/items = true()">
                            <li>Площади</li>
                        </xsl:if>
                        <xsl:if test="$tehnologii = true()">
                            <li>Технология строительства</li>
                        </xsl:if>
                        <xsl:if test="$infrastruktura = true()">
                            <li>Инфраструктура</li>
                        </xsl:if>
                        <xsl:if test=".//group[@name = 'unikalnye_bonusy'] = true()">
                            <li>Уникальные бонусы</li>
                        </xsl:if>
                        <xsl:if test="$planirovki = true()">
                            <li>Планировки</li>
                        </xsl:if>
                    </ul>
                    <div class="box visible" itemprop="description">
                        <!-- Описание -->
                        <xsl:value-of select="$description" disable-output-escaping="yes"/>
                    </div>
                    <xsl:if test="document(concat('udata://content/menu/0/0/', $id))/udata/items = true()">
                        <div class="box">
                            <!-- Площади -->
                            <!--xsl:apply-templates select="document(concat('udata://content/menu/0/0/', $id))/udata/items" mode="ploshadi"/-->
                            <p>С планировками можете ознакомиться в офисе нашей компании.</p>
                            <p><br /></p>
                            <a href="#summit" class="summit">Договориться о встрече в офисе</a>
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
                    <xsl:if test=".//group[@name = 'unikalnye_bonusy'] = true()">
                        <div class="box">
                            <!-- Уникальные бонусы -->
                            <div class="unikalnye_bonusy">
                                <!--xsl:apply-templates select=".//group[@name = 'unikalnye_bonusy']/property" mode="unikalnye_bonusy"/-->
                                <script type="text/javascript" src="{$template-resources}js/un_bon.js"/>
                            </div>
                        </div>
                    </xsl:if>
                    <xsl:if test="$planirovki = true()">
                        <div class="box">
                            <!-- Планировки -->
                            <xsl:value-of select="$planirovki" disable-output-escaping="yes"/>
                        </div>
                    </xsl:if>

                </div>
                <!-- .section -->
                <!--============================-->

                <!--div class="tep_co">
                    <h3>
                        <xsl:value-of select="$tehnikoekonomicheskie_pokazateli/title"/>
                    </h3>
                    <xsl:value-of select="$tehnikoekonomicheskie_pokazateli/value" disable-output-escaping="yes"/>
                </div>
                
                <div class="tep_co">
                    <h3>
                        <xsl:value-of select="$konstrukcii/title"/>
                    </h3>
                    <xsl:value-of select="$konstrukcii/value" disable-output-escaping="yes"/>
                </div-->

                <div class="content_sub_info">
                    <div class="special_title">Спецпредложения</div>
                    <div id="slider" class="slider">
                        <div class="slider_elements">
                            <xsl:apply-templates select="document('usel://to_slider/?limit=10')/udata/page" mode="sidebar_hot"/>

                        </div>
                    </div>

                    <!-- Похожие объекты -->
                    <xsl:choose>
                        <xsl:when test="$type-id = '122'">
                            <xsl:variable name="diff" select="500"/>
                            <xsl:call-template name="likeness">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="type-id" select="$type-id"/>
                                <xsl:with-param name="price" select="$price"/>
                                <!--xsl:with-param name="target" select="$target"/-->
                                <xsl:with-param name="diff" select="$diff"/>
                            </xsl:call-template>
                        </xsl:when>

                        <xsl:otherwise>
                            <xsl:variable name="diff" select="100000"/>
                            <xsl:call-template name="likeness">
                                <xsl:with-param name="id" select="$id"/>
                                <xsl:with-param name="type-id" select="$type-id"/>
                                <xsl:with-param name="price" select="$price"/>
                                <!--xsl:with-param name="target" select="$target"/-->
                                <xsl:with-param name="diff" select="$diff"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>

                    <div style="clear: both;"/>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="property[@type = 'img_file' and value != '']" mode="gallery">
        <xsl:param name="title"/>
        <xsl:variable name="p_path" select="value"/>
        <xsl:variable name="p_path_t" select="value/@path"/>
        <li>
            <a href="{$p_path}">
                <img title="{$title}" longdesc="Объект" class="image1" itemprop="image">
                    <xsl:attribute name="src">
                        <xsl:value-of select="document(concat('udata://system/makeThumbnail/(', $p_path_t, ')/(auto)/80/default/0/1/80'))//src"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="$title"/>
                    </xsl:attribute>
                </img>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="property[@type = 'img_file' and value != '']" mode="gallery_plus">
        <xsl:param name="title"/>
        <xsl:variable name="p_path" select="value"/>
        <xsl:variable name="p_path_t" select="value/@path"/>

        <!--xsl:variable name="i" select="position()"/>
        <xsl:if test="$i &gt; 1"-->
        <a href="{$p_path}" class="fancybox" rel="shadowbox[imggal]" title="{$title}"/>
        <!--/xsl:if-->

    </xsl:template>

    <!-- Похожие объекты -->
    
    <xsl:template name="likeness">
        <!-- Вывод ПОХОЖИХ ЭЛЕМЕНТА каталога BEGIN -->
        <xsl:param name="id"/>
        <xsl:param name="type-id"/>
        <xsl:param name="price"/>
        <xsl:param name="target"/>

        <xsl:param name="diff"/>

        <xsl:variable name="high_price_limit" select="$price + $diff"/>
        <xsl:variable name="less_price_limit" select="$price - $diff"/>

        <xsl:if test="document(concat('usel://likeness_price/', $type-id,'/',$less_price_limit,'/',$high_price_limit))/udata/page[not(@id = $id)] = true()">
            <div class="special_title">Похожие объекты</div>
        </xsl:if>

        <div class="slider">
            <div class="slider_elements">
                <xsl:apply-templates select="document(concat('usel://likeness_price/', $type-id,'/',$less_price_limit,'/',$high_price_limit))/udata/page[not(@id = $id)]" mode="sidebar_hot"/>
            </div>
        </div>
        <!-- Вывод ПОХОЖИХ ЭЛЕМЕНТА каталога END -->

    </xsl:template>


    <xsl:template match="property" mode="unikalnye_bonusy"> </xsl:template>
    <xsl:template match="property[@type = 'img_file']" mode="unikalnye_bonusy">
        <xsl:variable name="id" select="substring-after(@name, '_')"/>
        <xsl:variable name="name_id" select="concat('opisanie_', $id)"/>

        <div>

            <div class="b_img">
                <xsl:attribute name="style"> background-image: url("<xsl:value-of select="document(concat('udata://system/makeThumbnail/(.', value, ')/190/105/default/0/3/90'))//src"
                    />")</xsl:attribute>
            </div>
            <div>
                <xsl:value-of select="..//property[@name = $name_id]/value" disable-output-escaping="yes"/>
            </div>
            <div class="clear"/>

        </div>
    </xsl:template>

    <!--===========================================================================================================================-->

    <xsl:template match="items" mode="ploshadi">
        <table class="room_sq">
            <thead>
                <tr>
                    <th>Общая площадь</th>
                    <th>Жилая площадь</th>
                    <th>Площадь кухни</th>
                    <th>Наличие лоджии/балкона</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="item" mode="ploshadi"/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="item" mode="ploshadi">
        <tr class="tr">
            <td colspan="4" class="room_title">
                <xsl:value-of select="@name"/>
            </td>
        </tr>
        <xsl:apply-templates select="document(concat('udata://content/menu/0/0/', @id))/udata/items" mode="ploshadi_2"/>

    </xsl:template>

    <xsl:template match="items" mode="ploshadi_2">
        <xsl:apply-templates select="item" mode="ploshadi_2"/>
    </xsl:template>
    <xsl:template match="item" mode="ploshadi_2">
        <xsl:variable name="object_sq" select="document(concat('upage://', @id))/udata/page/properties/group[@name = 'parametry']"/>
        <tr>
            <td>
                <xsl:value-of select="$object_sq/property[@name = 'obwaya_prowad']/value"/>
            </td>
            <td>
                <xsl:value-of select="$object_sq/property[@name = 'zhilaya_prowad']/value"/>
            </td>
            <td>
                <xsl:value-of select="$object_sq/property[@name = 'plowad_kuhni']/value"/>
            </td>
            <td>
                <xsl:value-of select="$object_sq/property[@name = 'nalichie_lodzhiibalkona']/value"/>
            </td>
        </tr>

    </xsl:template>

    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    <xsl:template match="result[@module = 'catalog' and @method = 'object'][parents/page[@alt-name = 'blog']]">
        <xsl:variable name="id" select="page/@parentId"/>
        <xsl:variable name="photo" select=".//property[@name = 'foto_dlya_stati']/value"/>

        <div class="wrapper">
            <div class="headline">
                <h1>
                    <xsl:value-of select=".//property[@name = 'h1']/value"/>
                </h1>
            </div>
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>

            <div class="blog_post">
                <!--div class="b_p_anons">
                    <xsl:value-of select=".//property[@name = 'anons_stati']/value" disable-output-escaping="yes"/>
                </div-->
                <div class="b_p_content">
                    <p>
                        <img alt="" title="">
                            <xsl:attribute name="src">
                                <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/680/auto/default/0/1/5/80'))//src"/>
                            </xsl:attribute>
                        </img>
                    </p>
                    <xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
                    <script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"/>
                    <div class="yashare-auto-init" data-yashareL10n="ru" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareTheme="counter"/>

                </div>

                <xsl:apply-templates select="document(concat('udata://comments/insert/', page/@id))/udata"/>

                <div class="related">
                    <div class="b_i_title">Похожие статьи</div>
                    <!--xsl:apply-templates select="document(concat('udata://blogs20/postsList/',parents/page/@id,'//'))/udata/items/item[not(@id = $id)]" mode="related"/-->
                    <xsl:apply-templates select="document(concat('udata://catalog/getObjectsList/notemplate/',$id,'/4//1//0'))/udata/lines" mode="related_blog"/>
                </div>



            </div>

            <div class="sidebar">
                <div class="rubricator">
                    <!--div class="s_title">Рубрики</div-->
                    <xsl:apply-templates select="document(concat('udata://catalog/getCategoryList/notemplate/',393,'///'))/udata/items" mode="blogs_list"/>
                </div>
            </div>
            <xsl:call-template name="sidebar"/>
            <div class="clear"/>
        </div>




    </xsl:template>


    <xsl:template match="lines/item" mode="related_blog">
        <xsl:if test="position() &lt;= 4">
            <xsl:variable name="anons_img" select="document(concat('upage://',@id))//property[@name = 'foto_dlya_anonsa']/value"/>
            <xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
            <xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>
            <xsl:variable name="kratkoe_opisanie" select="document(concat('upage://',@id))//property[@name = 'anons_stati' ]/value"/>
            <xsl:variable name="update_time" select="document(concat('upage://',@id))/udata/page/@update-time"/>


            <div class="object">
                <div class="obj_photo">
                    <a href="{$link}">
                        <img alt="{$title}" title="{$title}">
                            <xsl:attribute name="src">
                                <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/112/112/default/0/1/5/80'))//src"/>
                            </xsl:attribute>
                        </img>
                    </a>
                </div>
                <div class="obj_info">
                    <xsl:if test="$update_time">
                        <span class="publish_time">
                            <xsl:apply-templates select="document(concat('udata://system/convertDate/',$update_time,'/d.m.Y/'))/udata"/>
                        </span>
                    </xsl:if>

                    <h4 class="obj_title">
                        <a href="{$link}">
                            <xsl:value-of select="$title"/>
                        </a>
                    </h4>
                    <!--div class="obj_desc">
						<xsl:call-template name="firstWords">
							<xsl:with-param name="value" select="cut"/>
							<xsl:with-param name="count" select="15"/>
						</xsl:call-template>
					</div-->
                </div>
            </div>
        </xsl:if>


    </xsl:template>


</xsl:stylesheet>
