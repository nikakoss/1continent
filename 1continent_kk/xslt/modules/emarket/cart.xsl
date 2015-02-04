<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="result[@method = 'cart']">
        <xsl:apply-templates select="document('udata://emarket/cart')/udata" mode="basket"/>
    </xsl:template>

    <!--=======================================================================================================-->
    <!--  если в корзине пусто  -->
    <xsl:template match="udata[@method = 'cart'][count(items/item) = 0]" mode="basket">
        <div class="wrapper">
            <div class="headline">
                <h1>Избранное: пусто</h1>
                <!-- <a href="javascript:history.back()" style="float: right; font-size: 12px; color: #aaa;">на предыдущую страницу</a>  -->
            </div>
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>

            <xsl:call-template name="sidebar"/>

        </div>
    </xsl:template>
    <!--=======================================================================================================-->

    <!--=======================================================================================================-->
    <!--  если в корзине что то есть  -->
    <xsl:template match="udata[@method = 'cart'][count(items/item) &gt; 0]" mode="basket">

        <div class="wrapper">
            <div class="headline">
                <h1>Избранное</h1>
                <!-- <a href="javascript:history.back()" style="float: right; font-size: 12px; color: #aaa;">на предыдущую страницу</a>  -->
                <div class="basket_remove_all">
                    <!--a href="/emarket/basket/remove_all/" class="go_detail basket_remove_all"-->
                    <a href="/emarket/basket/remove_all/" class="go_detail basket_remove_all">
                        <xsl:text>Очистить избранное</xsl:text>
                    </a>
                </div>
            </div>
            <div class="breadcrumbs">
                <xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
            </div>

            <div class="basket">
                <div class="c_title">Объектов в избранном: <span>
                        <xsl:value-of select="summary/amount"/>
                    </span>
                </div>
                <!-- Список объектов в избранном -->
                <xsl:apply-templates select="items/item" mode="basket"/>
                <div class="clear"/>
            </div>
            <xsl:call-template name="sidebar"/>

        </div>

    </xsl:template>
    <!--=======================================================================================================-->

    <!--=======================================================================================================-->
    <xsl:template match="item" mode="basket">

        <xsl:variable name="title" select="document(concat('upage://',page/@id))//property[@name = 'h1']/value"/>
        <xsl:variable name="price" select="document(concat('upage://',page/@id))//property[@name = 'cena']/value"/>
        <xsl:variable name="price_km" select="document(concat('upage://',page/@id))//property[@name = 'cena_km']/value"/>
        <xsl:variable name="photo" select="document(concat('upage://',page/@id))//property[@name = 'foto']/value"/>
        <xsl:variable name="desc" select="document(concat('upage://',page/@id))//property[@name = 'content']/value"/>
        <xsl:variable name="link" select="document(concat('upage://',page/@id))/udata/page/@link"/>
        <xsl:variable name="ipoteca" select="document(concat('upage://',page/@id))//property[@name = 'ipoteka']/value"/>
        <xsl:variable name="kratkoe_opisanie" select="document(concat('upage://',page/@id))//property[@name = 'kratkoe_opisanie' ]/value"/>
        

        <!-- item BEGIN -->
        <div class="object cart_item_{@id}">
            <div class="obj_photo">
                <xsl:if test="$ipoteca = 1">
                    <div class="cat_ipoteca"/>
                </xsl:if>

                <a href="{$link}">
                    <img alt="{$title}" title="{$title}">
                        <xsl:attribute name="src">
                            <xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $photo, ')/294/263/default/0/1/5/80'))//src"/>
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
                    
                    <xsl:value-of select="$kratkoe_opisanie" disable-output-escaping="yes"/>
                    
                    <!--xsl:call-template name="firstWords">
                        <xsl:with-param name="value" select="$desc"/>
                        <xsl:with-param name="count" select="42"/>
                    </xsl:call-template-->
                </div>
                <div class="basket_remove det_favorite">
                    <a href="/emarket/basket/remove/item/{@id}/" id="{@id}" class="del_from_fav"> Удалить из избранного </a>
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
                                            <span>Стоимость: </span>
                                            <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. </div>
                                        <xsl:if test="$price_km = true()">
                                            <div class="obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="obj_price">
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
                                <div class="obj_price">
                                    <span>Стоимость: </span>
                                    <xsl:value-of select="format-number($price, '### ###', 'european')"/> р. </div>
                                <xsl:if test="$price_km = true()">
                                    <div class="obj_sub_price"> (<xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>) </div>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="obj_price">
                                    <span>Цена: </span>
                                    <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за м<sup>2</sup>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>

                <div class="obj_button">
                    <a href="#summit" class="summit">Договориться о встрече в офисе</a>
                </div>
            </div>
        </div>
        <!-- item END -->
    </xsl:template>

    <xsl:template match="item/page[@type-id = '128']" mode="basket">
        
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
        
        
        
        <!-- item BEGIN -->
        <div class="object cart_item_{@id}">
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
                        <xsl:call-template name="title">
                            <xsl:with-param name="kolichestvo_komnat" select="$kolichestvo_komnat"/>
                            <xsl:with-param name="S" select="$S"/>
                            <xsl:with-param name="jil_komp" select="$j_k_page//property[@name = 'h1']/value"/>
                        </xsl:call-template>
                    </a>
                </h4>
                <div class="obj_distinct">Район: <a href="{$district_page/@link}"><xsl:value-of select="$district_page//property[@name = 'h1']/value"/></a></div>
                <div class="obj_distinct">Объект: <a href="{$j_k_page/@link}"><xsl:value-of select="$j_k_page//property[@name = 'h1']/value"/></a></div>
                
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
        <!-- item END -->
    </xsl:template>

    <xsl:template match="udata[@method = 'cart']/summary" mode="basket_sum">
        <form>
            <table style="width: 100%; text-align: center; height: 120px;">
                <tr>
                    <td>
                        <p class="b1" style="background: none repeat scroll 0% 0% transparent; color: black; width: 23%; padding: 30px;">
                            <xsl:text>Объектов в избранном: </xsl:text>
                            <xsl:apply-templates select="amount"/>
                        </p>
                    </td>
                </tr>
            </table>
            <div style="clear: both;"/>
        </form>
    </xsl:template>
    <!--=======================================================================================================-->
    <!--=======================================================================================================-->
    <!--=======================================================================================================-->





</xsl:stylesheet>
