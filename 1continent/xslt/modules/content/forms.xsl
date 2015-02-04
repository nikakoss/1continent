<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->
    <!-- Вывод Формы обратной связи BEGIN-->
    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="feedback">
        <!--form action="/webforms/send/" id="{@form_id}" enctype="multipart/form-data" method="get"-->
        <form class="feedback formId{@form_id}" method="post" action="/webforms/send/" enctype="multipart/form-data" onsubmit="yaCounter21668962.reachGoal('form{@form_id}'); return true;">
            <div class="form_title">
                <h4>
                    <xsl:value-of select="items/item[@selected = 'selected']"/>
                </h4>
            </div>
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}/"/>
            <input type="hidden" name="system_form_id" value="{/udata/@form_id}"/>
            <input type="hidden" name="system_email_to" value="{items/item[@selected = 'selected']/@id}"/>

            <xsl:apply-templates select=".//group[@name = 'params']/field" mode="form-fields"/>

            <div class="submit">
                <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                <input class="input_button" type="submit" name="submit" value="Отправить"/>
                    
                
            </div>

        </form>
    </xsl:template>

    <xsl:template match="udata[@module = 'webforms'][@method = 'add']" mode="feedback_calc">
        <!--form action="/webforms/send/" id="{@form_id}" enctype="multipart/form-data" method="get"-->
        <form class="feedback formId{@form_id}" method="post" action="/webforms/send/" enctype="multipart/form-data" >
            <input type="hidden" name="ref_onsuccess" value="/webforms/posted/{/udata/@form_id}/"/>
            <input type="hidden" name="system_form_id" value="{/udata/@form_id}"/>
            <input type="hidden" name="system_email_to" value="{items/item[@selected = 'selected']/@id}"/>
            
            <xsl:apply-templates select=".//group[@name = 'params']/field" mode="form-fields"/>
            
            <div class="clear"></div>
            <div class="submit">
                <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                <input class="input_button" type="submit" name="submit" value="Отправить"/>
                
                
            </div>
            
        </form>
    </xsl:template>
    


    <xsl:template match="field" mode="form-fields">
        <xsl:apply-templates select="field" mode="form-fields"/>
    </xsl:template>

    <xsl:template match="field" mode="form-fields">
        <div class="f_box">
            <label>
                <span class="f_name">
                    <xsl:value-of select="@title"/>
                    <xsl:text>: </xsl:text>
                </span>
                <input type="text" name="{@input_name}"/>
            </label>
        </div>
    </xsl:template>

    <xsl:template match="field[@type = 'wysiwyg']" mode="form-fields">
        <div class="f_box">
            <label>
                <span class="f_name">
                    <xsl:value-of select="@title"/>
                    <xsl:text>: </xsl:text>
                </span>
                <textarea name="{@input_name}" rows="9" cols="27"/>
            </label>
        </div>
    </xsl:template>



    <!-- Выпадающий список -->
    <xsl:template match="field[@type = 'relation']" mode="form-fields">
        <div class="f_box">
            <label>
                <span class="f_name"><xsl:value-of select="@title"/>:</span>
                
                    <select name="{@input_name}" title="{@tip}">
                        <xsl:apply-templates select="values/item" mode="form-fields">
                            <xsl:sort order="ascending" select="@id"/>
                        </xsl:apply-templates>
                    </select>
                
            </label>
        </div>
    </xsl:template>
    <xsl:template match="item" mode="form-fields">
        <option value="{@id}">
            <xsl:value-of select="."/>
        </option>
    </xsl:template>
    

    <!-- Вывод Формы обратной связи END-->

    <!--===========================================================================================================================-->
    <!--===========================================================================================================================-->
    
    <xsl:template match="field" mode="request_order_fields">
        <xsl:apply-templates select="field" mode="request_order_fields"/>
    </xsl:template>

    <!-- Выпадающий список -->
    <xsl:template match="field[@type = 'relation']" mode="request_order_fields">
        <div class="f_box">
            <label>
                <span class="f_name"><xsl:value-of select="@title"/>:</span>
                <div style="float: right; margin: 0px 5px 0px 0px; width: 300px;">
                    <select name="{@input_name}" title="{@tip}">
                        <xsl:apply-templates select="values/item" mode="request_order_fields">
                            <xsl:sort order="ascending" select="@id"/>
                        </xsl:apply-templates>
                    </select>
                </div>
            </label>
        </div>
    </xsl:template>
    <xsl:template match="item" mode="request_order_fields">
        <option value="{@id}">
            <xsl:value-of select="."/>
        </option>
    </xsl:template>

    <!-- Чек-боксы -->
    <!--xsl:template match="field[@type = 'relation' and (@name = 'vremya_zvonka' or @name = 'sposob_transportirovki')]" mode="request-fields">
        <div class="f_box checkbox">
            <span class="f_name">
                <xsl:value-of select="@title"/>
            </span>
            <xsl:apply-templates select="values/item" mode="checkbox"/>
        </div>
    </xsl:template>
    <xsl:template match="field/values/item" mode="checkbox">
        <label>
            <span class="check_boxes">
                <input type="checkbox" name="{../../@input_name}[]" value="{@id}">
                    <xsl:if test="@selected">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input>
                <xsl:value-of select="."/>
            </span>
        </label>
    </xsl:template-->

    <!-- Радио -->
    <xsl:template match="field[@type = 'relation' and (@name = 'vremya_zvonka' or @name = 'sposob_transportirovki')]" mode="request_order_fields">
        <div class="f_box checkbox">
            <span class="f_name">
                <xsl:value-of select="@title"/>
            </span>
            <xsl:apply-templates select="values/item" mode="checkbox">
                <xsl:sort select="@id" order="ascending"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>
    <xsl:template match="field/values/item" mode="checkbox">
        <label>
            <span class="check_boxes">
                <input type="radio" name="{../../@input_name}[]" value="{@id}">
                    <xsl:if test="@selected">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input>
                <xsl:value-of select="."/>
            </span>
        </label>
    </xsl:template>

    <!-- Строка -->
    <xsl:template match="field[@type = 'string' or @type = 'int']" mode="request_order_fields">
        <div class="f_box">
            <input type="text" class="styler" name="{@input_name}">
                <xsl:attribute name="placeholder">
                    <xsl:value-of select="@title"/>
                </xsl:attribute>
            </input>
        </div>
    </xsl:template>

    <!-- Текстовое поле -->
    <xsl:template match="field[@type = 'text' or @type = 'wysiwyg']" mode="request_order_fields">
        <div class="f_box">
            <textarea cols="55" rows="10" name="{@input_name}" class="styler">
                    <xsl:attribute name="placeholder">
                        <xsl:value-of select="@title"/>
                    </xsl:attribute>
                </textarea>
        </div>
    </xsl:template>


    <xsl:template match="result[@module = 'webforms'][@method = 'posted']" mode="request">
        <xsl:apply-templates select="document(concat('udata:/', @ request-uri))" mode="request"/>
    </xsl:template>


    <xsl:template match="udata[@module = 'webforms'][@method = 'posted']" mode="request">
        <div class="wrapper">
            <div class="heading">
                <h1>Message is sent</h1>
                <h2>
                    <xsl:value-of select="/" disable-output-escaping="yes"/>
                </h2>
            </div>
            <div class="mail">
            </div>
            <div class="p_and_p_contacts">
                <div class="p_and_p_phone">
                    <span>
                        <xsl:value-of select="$global_parameters/property[@name = 'phone_number_1']/value"/>
                    </span>
                    <span>
                        <xsl:value-of select="$global_parameters/property[@name = 'phone_number_2']/value"/>
                    </span>
                </div>
                <div class="p_and_p_mail">
                    <span class="f_mail"/>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:text>mailto:</xsl:text>
                            <xsl:value-of select="$global_parameters/property[@name = 'email']/value"/>
                        </xsl:attribute>
                        <xsl:value-of select="$global_parameters/property[@name = 'email']/value"/>
                    </a>
                </div>
                <div class="p_and_p_loc">
                    <span class="f_loc"/>
                    <xsl:value-of select="$global_parameters/property[@name = 'location']/value"/>
                </div>
            </div>
            
        </div>
    </xsl:template>
</xsl:stylesheet>
