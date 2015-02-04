<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <xsl:variable name="is_home" select="result[@module='content' and @method='content' and page/@is-default = '1']"/>
    <xsl:template match="/">
        <!--xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;</xsl:text-->
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <xsl:choose>
                    <xsl:when test="result[@module = 'catalog' and page[@type-id = 120]]">
                        <xsl:variable name="price" select="result/page//property[@name = 'cena']/value"/>
                        <xsl:variable name="price_km" select="result/page//property[@name = 'cena_km']/value"/>

                        <title>
                            <xsl:text>Купить квартиру в </xsl:text>
                            <xsl:value-of select="result/page/name"/>
                        </title>
                        <meta name="description" content="">
                            <xsl:attribute name="content">
                                <xsl:text>Купить квартиру в </xsl:text>
                                <xsl:value-of select="result/page/name"/>
                                <xsl:text> за </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="result/page//property[@name = 'tip_realizacii'] = true()">
                                        <xsl:choose>
                                            <xsl:when test="result/page//property[@name = 'tip_realizacii']/value/item/@id  = 401">
                                                <xsl:value-of select="format-number($price, '### ###', 'european')"/> руб. за кв. м. </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="$price != 0">
                                                        <xsl:value-of select="format-number($price, '### ###', 'european')"/> руб. <xsl:if test="$price_km != 0"> (<xsl:value-of
                                                                select="format-number($price_km, '### ###', 'european')"/> руб. за кв. м.) </xsl:if>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:if test="$price_km != 0">
                                                            <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за кв. м. </xsl:if>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="$price != 0">
                                                <xsl:value-of select="format-number($price, '### ###', 'european')"/> руб. <xsl:if test="$price_km != 0"> (<xsl:value-of
                                                        select="format-number($price_km, '### ###', 'european')"/> руб. за кв. м.) </xsl:if>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:if test="$price_km != 0">
                                                    <xsl:value-of select="format-number($price_km, '### ###', 'european')"/> руб. за кв. м. </xsl:if>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text>- </xsl:text>
                                <xsl:value-of select="result/page//property[@name = 'rajon']/value/item/@name"/>
                                <xsl:text>, </xsl:text>
                                <xsl:text>Таганрог. Возможность покупки в ипотеку. Компания "1 Континент" поможет Вам подобрать квартиру. Договориться о встрече по тел. +7(951)520-7000, 8(8634)69-22-49</xsl:text>
                            </xsl:attribute>
                        </meta>
                        <meta name="keywords" content="">
                            <xsl:attribute name="content">
                                <xsl:value-of select="result/page/name"/>
                                <xsl:text>, Таганрог, квартира, новостройка, купить, продажа, цена</xsl:text>
                            </xsl:attribute>
                        </meta>
                    </xsl:when>
                    <xsl:when test="result[@module = 'catalog' and page[@type-id = 121]]">
                        <xsl:variable name="price" select="result/page//property[@name = 'cena']/value"/>
                        <xsl:variable name="price_km" select="result/page//property[@name = 'cena_km']/value"/>

                        <title>
                            <xsl:text>Купить дом в районе </xsl:text>
                            <xsl:value-of select="result/page//property[@name = 'rajon']/value/item/@name"/>
                            <xsl:text> от </xsl:text>
                            <xsl:value-of select="format-number($price, '### ###', 'european')"/>
                            <xsl:text> руб.</xsl:text>
                        </title>
                        <meta name="description" content="">
                            <xsl:attribute name="content">
                                <xsl:text>Купить дом в Таганроге, район </xsl:text>
                                <xsl:value-of select="result/page//property[@name = 'rajon']/value/item/@name"/>
                                <xsl:text> от </xsl:text>
                                <xsl:value-of select="format-number($price, '### ###', 'european')"/>
                                <xsl:text> руб. </xsl:text>
                                <xsl:text>Возможность покупки в ипотеку. Компания "1 Континент" поможет Вам подобрать новый дом. Договориться о встрече по тел. +7(951)520-7000, 8(8634)69-22-49</xsl:text>
                            </xsl:attribute>
                        </meta>
                        <meta name="keywords" content="">
                            <xsl:attribute name="content">
                                <xsl:text>дом, </xsl:text>
                                <xsl:value-of select="result/page//property[@name = 'rajon']/value/item/@name"/>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="format-number($price, '### ###', 'european')"/>
                                <xsl:text> руб.</xsl:text>
                                <xsl:text>, таганрог, новостройка, купить, продажа, цена</xsl:text>
                            </xsl:attribute>
                        </meta>
                    </xsl:when>
                    <xsl:when test="result[@module = 'catalog' and page[@type-id = 141]]">
                        <title>
                            <xsl:value-of select="/result/@title"/>
                        </title>
                        <meta name="description" content="">
                            <xsl:attribute name="content">
                                <xsl:value-of select="/result/page/name"/>
                                <xsl:text> Интересные статьи о недвижимости, ипотеке и интерьере от компании "1 Континент". Договориться о встрече по тел. +7(951)520-7000, 8(8634)69-22-49</xsl:text>
                            </xsl:attribute>
                        </meta>
                        <meta name="keywords" content="">
                            <xsl:attribute name="content">
                                <xsl:value-of select="/result/page/name"/>
                                <xsl:text>, статьи, 1 континент</xsl:text>
                            </xsl:attribute>
                        </meta>
                    </xsl:when>
                    <xsl:otherwise>
                        <title>
                            <xsl:value-of select="/result/@title"/>
                        </title>
                        <meta name="description" content="{//meta/description}">
                            <xsl:attribute name="content">
                                <xsl:value-of select="//meta/description"/>
                            </xsl:attribute>
                        </meta>
                        <meta name="keywords" content="{//meta/keywords}">
                            <xsl:attribute name="content">
                                <xsl:value-of select="//meta/keywords"/>
                            </xsl:attribute>
                        </meta>
                    </xsl:otherwise>
                </xsl:choose>

                <meta http-equiv="Pragma" content="no-cache"/>
                <meta http-equiv="Cache-Control" content="no-cache"/>
                <meta http-equiv="Lang" content="ru"/>
                <xsl:if test="$p != 0">
                    <meta name="robots" content="noindex, follow"/>
                </xsl:if>
                <link rel="icon" type="image/png" href="/favicon.ico"/>
                <!--[if gte IE 9]>
        <style type="text/css">
        .gradient {
        filter: none;
        }
        </style>
        <![endif]-->
                <script type="text/javascript" src="{$template-resources}js/jquery-1.9.1.min.js"/>
                <link rel="stylesheet" type="text/css" href="/templates/css/style_common.css"/>
                <link rel="stylesheet" type="text/css" href="/templates/css/font.css"/>
                <link rel="stylesheet" type="text/css" href="{$template-resources}css/style.css"/>
                <link rel="stylesheet" type="text/css" href="{$template-resources}css/jquery.formstyler.css"/>
                <link rel="stylesheet" type="text/css" href="{$template-resources}css/anythingslider.css"/>
                <link rel="stylesheet" type="text/css" href="{$template-resources}detail_js/jquery.ad-gallery.css"/>
                <link rel="stylesheet" type="text/css" href="{$template-resources}fancybox/jquery.fancybox.css?v=2.1.4" media="screen"/>
                <link href="{$template-resources}/jivosite/jivosite.css" rel="stylesheet"/>

            </head>
            <body>
                <xsl:choose>
                    <xsl:when test="$choice_url = '/krasnodar'">
                        <xsl:call-template name="header_krasnodar"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="header_tagan"/>
                    </xsl:otherwise>
                </xsl:choose>

                <div class="content">
                    <xsl:if test="$is-home = true()">
                        <xsl:attribute name="class">content home</xsl:attribute>
                    </xsl:if>
                    <div class="wrapper">
                        <span class="error">
                            <xsl:apply-templates select="document('udata://system/listErrorMessages/')/udata[items]"/>
                        </span>
                    </div>
                    <xsl:apply-templates select="result[@module='content' and @method='content' and page/@is-default = '1']" mode="home"/>
                    <xsl:apply-templates select="result[@module='content' and @method='content' and not(page/@is-default='1')]" mode="article"/>
                    <xsl:apply-templates select="result[@module='catalog' and @method='category']/page" mode="catalog"/>
                    <!--xsl:apply-templates select="result[@module='catalog' and @method='object']" mode="catalog_object"/-->
                    <xsl:apply-templates select="result[@module='catalog' and @method='object']"/>
                    <!--xsl:apply-templates select="result[@module='blogs20' and @method='blog']" mode="blog_list"/>
                    <xsl:apply-templates select="result[@module='blogs20' and @method='post']" mode="blog_post"/-->
                    <xsl:apply-templates select="result[@module='news' and @method='rubric']/page" mode="news_list_list"/>
                    <xsl:apply-templates select="result[@module='news' and @method='item']/page" mode="news_item"/>
                    <xsl:apply-templates select="result[@module = 'emarket' and @method='cart']"/>
                    <xsl:apply-templates select="result[@module = 'search' and @method = 'search_do']" mode="search"/>
                    <xsl:apply-templates select="result[@module = 'content' and @method = 'notfound']"/>
                    <div class="clear"/>
                </div>
                <!-- .content -->

                <div class="footer">
                    <div class="wrapper">
                        <xsl:comment>noindex</xsl:comment>
                        <div class="footer_menu">
                            <xsl:choose>
                                <xsl:when test="$choice_url = '/krasnodar'">
                                    <xsl:call-template name="f_menu_krasnodar"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="f_menu_taganrog"/>
                                </xsl:otherwise>
                            </xsl:choose>

                        </div>
                        <!-- .footer_menu -->
                        <table>
                            <tr>
                                <td>
                                    <xsl:value-of select="$global_parameters/property[@name = 'futer_tekst']/value" disable-output-escaping="yes"/>
                                </td>
                                <xsl:comment>/noindex</xsl:comment>
                                <td style="text-align: center;">
                                    <script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"/>
                                    <div class="yashare-auto-init" data-yashareL10n="ru" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,gplus"
                                        data-yashareTheme="counter"/>
                                </td>
                                <td style="text-align: right;">
                                    <!-- Yandex.Metrika informer -->
                                    <a href="https://metrika.yandex.ru/stat/?id=21668962&amp;from=informer" target="_blank" rel="nofollow">
                                        <img src="//bs.yandex.ru/informer/21668962/3_1_FFFFFFFF_EFEFEFFF_0_pageviews" style="width:88px; height:31px; border:0;" alt="Яндекс.Метрика"
                                            title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" onclick="">
                                            <xsl:attribute name="onclick"> try{Ya.Metrika.informer({i:this,id:21668962,lang:'ru'});return false}catch(e){} </xsl:attribute>
                                        </img>
                                    </a>
                                    <!-- /Yandex.Metrika informer -->
                                    <!-- Yandex.Metrika counter -->
                                    <script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript"/>
                                    <script type="text/javascript">
                                            try { var yaCounter21668962 = new Ya.Metrika({id:21668962, webvisor:true, clickmap:true, accurateTrackBounce:true}); } catch(e) { }
                                     </script>
                                    <!-- /Yandex.Metrika counter -->
                                    <noscript>
                                        <div>
                                            <img src="//mc.yandex.ru/watch/21668962" style="position:absolute; left:-9999px;" alt=""/>
                                        </div>
                                    </noscript>

                                    <!--a rel="nofollow" target="_blank" href="#"><img title="Яндекс.Метрика: данные за сегодня (просмотры, визиты и уникальные посетители)" alt="Яндекс.Метрика" style="width:88px; height:31px; border:0;" src="{$template-resources}/tmp_img/ya.png"/></a-->
                                </td>
                            </tr>
                            <xsl:comment>noindex</xsl:comment>
                            <tr>
                                <td><!-- Разработка и продвижение: <a href="http://arsenal-media.net" rel="nofollow">Arsenal-Media</a> --></td>
                                <td style="text-align:center">
                                    <a href="/sitemap/" rel="nofollow">Карта сайта</a>
                                </td>
                                <td style="text-align: right;">Разработка и продвижение: <a rel="nofollow" href="http://arsenal-media.net">Arsenal Media</a></td>
                                <!--td>
                                    <xsl:text>&#160;</xsl:text>
                                </td-->
                            </tr>
                            <xsl:comment>/noindex</xsl:comment>
                        </table>

                        <div style="display:none">
                            <div id="request_call" class="modal_form">
                                <a href="javascript:;" onclick="$.fancybox.close();" class="close">Закрыть</a>
                                <xsl:apply-templates select="document('udata://webforms/add/130')/udata" mode="feedback"/>
                            </div>
                        </div>

                        <div style="display:none">
                            <div id="ask_question" class="modal_form">
                                <a href="javascript:;" onclick="$.fancybox.close();" class="close">Закрыть</a>
                                <xsl:apply-templates select="document('udata://webforms/add/131')/udata" mode="feedback"/>
                            </div>
                        </div>

                        <div style="display:none">
                            <div id="summit" class="modal_form">
                                <a href="javascript:;" onclick="$.fancybox.close();" class="close">Закрыть</a>
                                <xsl:apply-templates select="document('udata://webforms/add/132')/udata" mode="feedback"/>
                            </div>
                        </div>

                        <div style="display:none">
                            <div id="calc_form" class="modal_form">
                                <a href="javascript:;" onclick="$.fancybox.close();" class="close">Закрыть</a>
                                <form enctype="multipart/form-data" action="#" method="post" class="calc_form" novalidate="novalidate">
                                    <div class="form_title">
                                        <h4>Калькулятор ипотеки</h4>
                                    </div>
                                    <div class="f_box">
                                        <label>
                                            <span class="f_name">Стоимость объекта недвижимости: </span>
                                            <input type="text" name="calc_cost"/>
                                        </label>
                                    </div>
                                    <div class="f_box">
                                        <label>
                                            <span class="f_name">Первоначальный взнос: </span>
                                            <input type="text" name="calc_pre"/>
                                        </label>
                                    </div>
                                    <div class="f_box">
                                        <label>
                                            <span class="f_name">Срок кредита: </span>
                                            <select title="" name="calc_time">
                                                <option value="3">3 месяца</option>
                                                <option value="12">12 месяцев</option>
                                                <option value="36">3 года</option>
                                                <option value="60">5 лет</option>
                                                <option value="84">7 лет</option>
                                                <option value="144">12 лет</option>
                                                <option value="180">15 лет</option>
                                                <option value="240">20 лет</option>
                                            </select>
                                        </label>
                                    </div>
                                    <div class="calc_result">
                                        <div class="c_r_title">Результаты расчёта ипотеки</div>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Сумма кредита:</span>
                                                    </td>
                                                    <td class="summ">
                                                        <span id="summ" class="c_r_digit"/>
                                                        <span> руб.</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <span>Ежемесячный платёж:</span>
                                                    </td>
                                                    <td class="summ">
                                                        <span id="pay" class="c_r_digit"/>
                                                        <span> руб.</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                                <!--div class="calc_desc">
                                    <xsl:value-of select="document('upage://home/global_parameters')//group[@name = 'kalkulyator']/property[@name = 'text']/value" disable-output-escaping="yes"/>
                                </div-->
                                <div class="h_c_button request_call">Появились вопросы? Мы Вам перезвоним</div>
                                <form enctype="multipart/form-data" action="/webforms/send/" method="post" class="feedback formId_calc" novalidate="novalidate">
                                    <input type="hidden" value="/webforms/posted/130/" name="ref_onsuccess"/>
                                    <input type="hidden" value="130" name="system_form_id"/>
                                    <input type="hidden" value="411" name="system_email_to"/>

                                    <div class="calc_left">
                                        <div class="f_box">
                                            <label>
                                                <span class="f_name">Ваше имя: </span>
                                                <input type="text" name="data[new][s_name]"/>
                                            </label>
                                        </div>
                                        <div class="f_box">
                                            <label>
                                                <span class="f_name">Электронная почта: </span>
                                                <input type="text" name="data[new][s_mail]"/>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="calc_right">
                                        <div class="f_box">
                                            <label>
                                                <span class="f_name">Ваш телефон: </span>
                                                <input type="text" name="data[new][s_phone]"/>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="clear"/>
                                    <div class="submit">
                                        <input type="submit" value="Отправить" name="submit" class="input_button"/>
                                    </div>
                                </form>

                            </div>
                        </div>

                        <div style="display:none">
                            <div id="region" class="modal_form">
                                <a href="javascript:;" onclick="$.fancybox.close();" class="close">Закрыть</a>
                                <div>
                                    <div class="form_title">
                                        <h2>Выбрать город</h2>
                                    </div>
                                    <a href="{result/@request-uri}">Таганрог</a>
                                    <a href="/krasnodar">Краснодар</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- .wrapper -->
                </div>
                <!-- .footer -->
                <script type="text/javascript" src="{$template-resources}js/jquery.cookie.js"/>
                <script type="text/javascript" src="{$template-resources}js/jquery.easing.1.3.js"/>
                <script type="text/javascript" src="{$template-resources}js/jquery.formstyler.min.js"/>
                <script type="text/javascript" src="{$template-resources}js/jquery.anythingslider.min.js"/>

                <script type="text/javascript">
                    $(document).ready(function() {
                    $('.slider_elements').anythingSlider(
                    {
                    resizeContents      : false,
                    showMultiple        : 3,
                    buildNavigation     : true,
                    buildStartStop      : false,
                    autoPlay            : false,
                    autoPlayLocked      : false,
                    hashTags            : false,
                    infiniteSlides      : true,
                    delay               : 7000,
                    animationTime       : 1600,
                    }
                    )
                    })                                        
                </script>
                <script type="text/javascript">
                    (function($) {  
                    $(function() {  
                    $('input, select').styler();  
                    })  
                    })(jQuery)  
                </script>
                <script type="text/javascript" src="{$template-resources}detail_js/jquery.ad-gallery_fancybox.js?rand=995"/>
                <script type="text/javascript">
                    $(function() {
                    var galleries = $('.ad-gallery').adGallery();
                    });
                </script>
                <script type="text/javascript" src="{$template-resources}fancybox/jquery.fancybox.js?v=2.1.4"/>
                <script type="text/javascript">
                    $(document).ready(function() {
                    $("a.fancybox").fancybox({
                    openEffect : 'none',
                    //topRatio: 0,
                    maxHeight: 1000,
                    helpers : {
                    overlay : true,
                    title : null            
                    }
                    });
                    $("#inline_1, #inline_2, #inline_3, #inline_4, .summit, #inline_calc").fancybox({
                    'modal' : true,
                    'padding' : 0,
                    closeBtn   : true,
                    'openEffect' : 'elastic',
                    'closeEffect' : 'elastic',
                    afterClose   : function() {
                    $('.feedback :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $('form .alert').remove();
                    }
                    });
                    $("#inline_reg").fancybox({
                    'modal' : true,
                    'padding' : 0,
                    closeBtn   : true,
                    'openEffect' : 'elastic',
                    'closeEffect' : 'elastic',
                    afterShow: function(){
                    $.removeCookie('choice', { path: '/' });
                    $.removeCookie('choice_url', { path: '/' });
                    }
                    });
                    })                                        
                </script>

                <script type="text/javascript" src="{$template-resources}js/location.js"/>

                <script type="text/javascript" src="{$template-resources}js/__common.js"/>
                <script type="text/javascript">
                    (function($) {  
                    $(function() {  
                    $('ul.tabs').on('click', 'li:not(.current)', function() {
                    $(this).addClass('current').siblings().removeClass('current')  
                    .parents('div.tabs_section').find('div.box').eq($(this).index()).fadeIn(150).siblings('div.box').hide();  
                    })  
                    })  
                    })(jQuery)                  
                </script>
                <script type="text/javascript" src="{$template-resources}js/jquery.validate.min.js"/>
                <script type="text/javascript" src="{$template-resources}js/check_form.js"/>
                <script type="text/javascript" src="{$template-resources}js/calc.js"/>
                <script type="text/javascript" src="{$template-resources}js/fixed_header.js"/>

            </body>
        </html>
    </xsl:template>

    <xsl:template name="header_tagan">
        <div class="header def">
            <div class="wrapper">
                <a href="/">
                    <img src="{$template-resources}img/logo.png" alt="1-continent.ru"/>
                </a>
                <xsl:comment>noindex</xsl:comment>
                <div class="h_contacts">
                    <div class="h_contacts_left">
                        <div class="phone">
                            <span>
                                <xsl:value-of select="$global_parameters/property[@name = 'tel_prefiks_1']/value"/>
                            </span>
                            <xsl:value-of select="$global_parameters/property[@name = 'telefon_1']/value"/>
                        </div>
                        <span class="h_contacts_time">Мы работаем</span>
                        <span>
                            <xsl:value-of select="$global_parameters/property[@name = 'vremya_raboty']/value"/>
                        </span>
                        <span class="h_contacts_location">
                            <xsl:value-of select="$global_parameters/property[@name = 'adres']/value"/>
                        </span>
                        <a class="h_contacts_show_location" href="/kontakty/" rel="nofollow" onclick="yaCounter21668962.reachGoal('h_contacts_show_location'); return true;">Показать на карте</a>
                    </div>
                    <div class="h_contacts_right">
                        <div class="phone">
                            <span>
                                <xsl:value-of select="$global_parameters/property[@name = 'tel_prefiks_2']/value"/>
                            </span>
                            <xsl:value-of select="$global_parameters/property[@name = 'telefon_2']/value"/>
                        </div>
                        <span class="h_contacts_icq">
                            <xsl:value-of select="$global_parameters/property[@name = 'icq']/value"/>
                        </span>
                        <span class="h_contacts_skype">
                            <xsl:value-of select="$global_parameters/property[@name = 'skype']/value"/>
                        </span>
                        <a class="h_contacts_mail" href="mailto:{$global_parameters/property[@name = 'mail']/value}">
                            <xsl:value-of select="$global_parameters/property[@name = 'mail']/value"/>
                        </a>
                        <div class="h_contacts_favorite">
                            <xsl:apply-templates select="document('udata://emarket/cart')/udata" mode="upcart"/>
                        </div>
                    </div>
                </div>
                <div class="h_btn">
                    <form class="morf_search" method="get" action="/search/search_do/">
                        <input type="text" onblur="javascript: if(this.value == '') this.value = 'Поиск по сайту';" onfocus="javascript: if(this.value == 'Поиск по сайту') this.value = '';"
                            value="Поиск по сайту" name="search_string" class="textinputs"/>
                        <input type="submit" class="search_sbmt" value=""/>
                    </form>
                    <a href="#request_call" class="h_c_button request_call" id="inline_1" onclick="yaCounter21668962.reachGoal('request_call'); return true;">Заявка на квартиру</a>
                    <!--a href="#ask_question" class="h_c_button ask_question" id="inline_2" onclick="yaCounter21668962.reachGoal('ask_question'); return true;">Задать вопрос</a-->
                    <a href="#region" class="h_c_button ask_question" id="inline_reg">Выбрать город</a>
                </div>
                <xsl:comment>/noindex</xsl:comment>
            </div>
        </div>
        <!-- .header -->
        <div class="pipe"/>
        <div class="wrapper">
            <div class="header_menu">
                <xsl:apply-templates select="document('udata://content/menu/0/0/')/udata" mode="header_menu"/>
            </div>
            <!-- .header_menu -->
        </div>
        <!-- .wrapper -->

    </xsl:template>
    <xsl:template name="header_krasnodar">
        <div class="header def">
            <div class="wrapper">
                <a href="/krasnodar/">
                    <img src="/templates/1continent_kk/img/logo.png" alt="1-continent.ru"/>
                </a>
                <xsl:comment>noindex</xsl:comment>
                <div class="h_contacts">
                    <div class="h_contacts_left">
                        <div class="phone">
                            <span>
                                <xsl:value-of select="$global_parameters_kk/property[@name = 'tel_prefiks_1']/value"/>
                            </span>
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'telefon_1']/value"/>
                        </div>
                        <span class="h_contacts_time">Мы работаем</span>
                        <span>
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'vremya_raboty']/value"/>
                        </span>
                        <span class="h_contacts_location">
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'adres']/value"/>
                        </span>
                        <a class="h_contacts_show_location" href="/kontakty/" rel="nofollow" onclick="yaCounter21668962.reachGoal('h_contacts_show_location'); return true;">Показать на карте</a>
                    </div>
                    <div class="h_contacts_right">
                        <div class="phone">
                            <span>
                                <xsl:value-of select="$global_parameters_kk/property[@name = 'tel_prefiks_2']/value"/>
                            </span>
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'telefon_2']/value"/>
                        </div>
                        <!--span class="h_contacts_icq">
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'icq']/value"/>
                        </span-->
                        <span class="h_contacts_skype">
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'skype']/value"/>
                        </span>
                        <a class="h_contacts_mail" href="mailto:{$global_parameters_kk/property[@name = 'mail']/value}">
                            <xsl:value-of select="$global_parameters_kk/property[@name = 'mail']/value"/>
                        </a>
                        <div class="h_contacts_favorite">
                            <xsl:apply-templates select="document('udata://emarket/cart')/udata" mode="upcart"/>
                        </div>
                    </div>
                </div>
                <div class="h_btn">
                    <form class="morf_search" method="get" action="/krasnodar/search_result/">
                        <input type="text" onblur="javascript: if(this.value == '') this.value = 'Поиск по сайту';" onfocus="javascript: if(this.value == 'Поиск по сайту') this.value = '';"
                            value="Поиск по сайту" name="search_string" class="textinputs"/>
                        <input type="submit" class="search_sbmt" value=""/>
                    </form>
                    <a href="#request_call" class="h_c_button request_call" id="inline_1" onclick="yaCounter21668962.reachGoal('request_call'); return true;">Заявка на квартиру</a>
                    <!--a href="#ask_question" class="h_c_button ask_question" id="inline_2" onclick="yaCounter21668962.reachGoal('ask_question'); return true;">Задать вопрос</a-->
                    <a href="#region" class="h_c_button ask_question" id="inline_reg">Выбрать город</a>
                </div>
                <xsl:comment>/noindex</xsl:comment>
            </div>
        </div>
        <!-- .header -->
        <link href="/templates/1continent_kk/css/style.css" type="text/css" rel="stylesheet"/>
        <div class="pipe"/>
        <div class="wrapper">
            <div class="header_menu">
                <ul>
                    <li>
                        <a title="Главная" href="/krasnodar/">
                            <span>Главная</span>
                        </a>
                    </li>
                    <li>
                        <span title="Объекты" href="">
                            <span>Объекты</span>
                        </span>
                        <ul>
                            <li>
                                <a title="Жилые комплексы" href="/krasnodar/obekty/novostrojki/">
                                    <span>Жилые комплексы</span>
                                </a>
                            </li>
                            <li>
                                <a title="Квартиры" href="/krasnodar/obekty/kvartiry/">
                                    <span>Квартиры</span>
                                </a>
                            </li>
                            <li>
                                <a title="Коттеджи" href="/krasnodar/obekty/doma/">
                                    <span>Коттеджи</span>
                                </a>
                            </li>
                            <li>
                                <a title="Коммерческая недвижимость" href="/krasnodar/obekty/kommercheskaya_nedvizhimost/">
                                    <span>Коммерческая недвижимость</span>
                                </a>
                            </li>
                        </ul>

                    </li>
                    <li>
                        <a title="О компании" href="/o_kompanii/">
                            <span>О компании</span>
                        </a>
                    </li>
                    <li>
                        <a title="О городе" href="/krasnodar/o_gorode/" rel="nofollow">
                            <span>О городе</span>
                        </a>
                    </li>
                    <li>
                        <a title="Блог" href="/blog/" rel="nofollow">
                            <span>Блог</span>
                        </a>
                    </li>
                    <li>
                        <a title="Контакты" href="/kontakty/" rel="nofollow">
                            <span>Контакты</span>
                        </a>
                    </li>
                    <li style="float: none; clear: both;"> </li>
                </ul>
            </div>
            <!-- .header_menu -->
        </div>
        <!-- .wrapper -->

    </xsl:template>

    <xsl:template name="f_menu_taganrog">
        <xsl:apply-templates select="document('udata://content/menu/0/0/')/udata" mode="header_menu"/>
    </xsl:template>

    <xsl:template name="f_menu_krasnodar">
        <ul>
            <li>
                <a title="Главная" href="/krasnodar/">
                    <span>Главная</span>
                </a>
            </li>
            <li>
                <a title="Жилые комплексы" href="/krasnodar/obekty/novostrojki/">
                    <span>Жилые комплексы</span>
                </a>
            </li>
            <li>
                <a title="Квартиры" href="/krasnodar/obekty/kvartiry/">
                    <span>Квартиры</span>
                </a>
            </li>
            <li>
                <a title="Коттеджи" href="/krasnodar/obekty/doma/">
                    <span>Коттеджи</span>
                </a>
            </li>
            <li>
                <a title="Коммерческая недвижимость" href="/krasnodar/obekty/kommercheskaya_nedvizhimost/">
                    <span>Коммерческая недвижимость</span>
                </a>
            </li>

            <li>
                <a title="О компании" href="/o_kompanii/">
                    <span>О компании</span>
                </a>
            </li>
            <li>
                <a title="О городе" href="/krasnodar/o_gorode/" rel="nofollow">
                    <span>О городе</span>
                </a>
            </li>
            <li>
                <a title="Блог" href="/blog/" rel="nofollow">
                    <span>Блог</span>
                </a>
            </li>
            <li>
                <a title="Контакты" href="/kontakty/" rel="nofollow">
                    <span>Контакты</span>
                </a>
            </li>
            <li style="float: none; clear: both;"> </li>
        </ul>
    </xsl:template>

</xsl:stylesheet>
