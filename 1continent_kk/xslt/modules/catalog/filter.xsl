<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
    <!ENTITY nbsp  "&#160;">
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <!--===========================================================================================================================-->

    <!-- Вывод Формы ФИЛЬТРА BEGIN-->
    <xsl:template match="udata[@module = 'catalog' and @method = 'search']" mode="filter">
        <form action=" {$current_catalog}" method="get" onsubmit="yaCounter21668962.reachGoal('sbmt_filter'); return true;">
            <!--xsl:apply-templates select="document('udata://catalog/getCategoryList/notemplate/1252/0/1')/udata/items" mode="filter_cat"/-->

            <!--xsl:apply-templates select="group[not(@name = 'custom_group')]" mode="filter-group"/-->
            <xsl:apply-templates select="group" mode="filter-group"/>
            <div style="clear: both;"/>
        </form>
    </xsl:template>


    <xsl:template match="items" mode="filter_cat">
        <div class="f_cat">
            <span>Подобрать новостройку: </span>
            <xsl:apply-templates select="item[@id != '488']" mode="filter_cat"/>
        </div>
    </xsl:template>

    <xsl:template match="item[@id != '488']" mode="filter_cat">
        <a href="{@link}">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>




    <xsl:template match="group" mode="filter-group">
        <table id="{@name}">
            <tr>
            <xsl:apply-templates select="field" mode="filter-fields"/>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="group[position() = last()]" mode="filter-group">
        <table id="{@name}">
            <tr>
            <xsl:apply-templates select="field" mode="filter-fields"/>
            </tr>
        </table>
        <div class="submit">
            <input type="submit" name="submit" value="Подобрать"/>
        </div>
    </xsl:template>

    <xsl:template match="field[@data-type = 'relation' or @data-type = 'symlink']" mode="filter-fields">
        <td id="{@name}">
            <label>
                <span>
                    <xsl:value-of select="@title"/>
                </span>
                <select name="fields_filter[{@name}]">
                    <option value="">Выберите район</option>
                    <xsl:apply-templates select="values/item" mode="option-fields"/>
                    <!--xsl:apply-templates select="document('usel://reg_user/148')/udata/item" mode="distinct"/-->
                </select>
            </label>
        </td>
    </xsl:template>

    <xsl:template match="field/values/item" mode="option-fields">
        <option value="{@id}">
            <xsl:copy-of select="@selected"/>
            <xsl:value-of select="."/>
        </option>
    </xsl:template>

    <!-- =========================== -->
    <xsl:template match="field[(@data-type = 'relation' or @data-type = 'symlink') and @name = 'target']" mode="filter-fields">
        <td id="{@name}" style="display: block;">
            <xsl:apply-templates select="values/item" mode="radio">
                <xsl:sort select="@id" data-type="number" order="ascending"/>
                <xsl:with-param name="name" select="@name"/>
            </xsl:apply-templates>
        </td>
    </xsl:template>

    <xsl:template match="field/values/item" mode="radio">
        <xsl:param name="name"/>
        <label>
            <span class="check_boxes">
                <xsl:value-of select="."/>
                <input type="radio" name="fields_filter[{$name}][]" value="{@id}">
                    <xsl:if test="@selected">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input>
            </span>
        </label>
    </xsl:template>
    <!-- =========================== -->
    <xsl:template match="field[(@data-type = 'relation' or @data-type = 'symlink') and @name = 'kolichestvo_komnat' or @name = 'etazhnost']" mode="filter-fields">
        <td id="{@name}" style="display: block;">
            <xsl:if test="values/item/@selected">
                <xsl:attribute name="style">display: block;</xsl:attribute>
            </xsl:if>
            <span>
                <xsl:value-of select="@title"/>
            </span>
            <xsl:apply-templates select="values/item" mode="checkbox"/>
        </td>
    </xsl:template>

    <xsl:template match="field/values/item" mode="checkbox">
        <label>
            <span class="check_boxes">
                <input type="radio" name="fields_filter[kolichestvo_komnat][]" value="{@id}">
                    <xsl:if test="@selected">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input>
                <span><xsl:value-of select="."/></span>
            </span>
        </label>
    </xsl:template>
    <!-- =========================== -->

    <xsl:template match="field[@data-type = 'boolean']" mode="filter-fields">
        <td id="fld_{@name}">
            <label>
                <div>&nbsp;</div>
                <input id="{@name}" type="checkbox" name="fields_filter[{@name}]" value="1">
                    <xsl:if test="checked">
                        <xsl:attribute name="checked">checked</xsl:attribute>
                    </xsl:if>
                </input>
                <span>&nbsp;
                    <xsl:value-of select="@title"/>
                </span>
            </label>
        </td>
    </xsl:template>

    <xsl:template match="field[@data-type = 'price']" mode="filter-fields">
        <td id="{@name}" class="grade">
            <label class="left">
                <!--span>
                    <xsl:text> от</xsl:text>
                </span-->
                <input type="hidden" name="fields_filter[{@name}][0]" value="{value_from}" class="textinputs"/>
            </label>
            <label class="right">
                <span>
                    <xsl:value-of select="@title"/>
                </span>
                <input type="text" name="fields_filter[{@name}][1]" placeholder="до" value="{value_to}" class="textinputs"/>
            </label>
        </td>
    </xsl:template>
    
    <xsl:template match="field[@data-type = 'price' and @name='stoimost_max']" mode="filter-fields">
        <td id="{@name}" class="grade">
            <label class="left">
                <!--span>
                    <xsl:value-of select="@title"/>
                </span-->
                <input type="hidden" name="fields_filter[{@name}][0]" placeholder="до" value="{value_from}" class="textinputs"/>
            </label>
            <label class="right">
                <!--span>
                    <xsl:value-of select="@title"/>
                </span-->
                <input type="hidden" name="fields_filter[{@name}][1]" placeholder="до" value="{value_to}" class="textinputs"/>
            </label>
            <script type="text/javascript" src="{$template-resources}js/catalogfilter.js"/>
        </td>
    </xsl:template>

    <xsl:template match="field[@data-type = 'int' or @data-type = 'float']" mode="filter-fields">
        <td id="{@name}" class="grade">
            <label class="left">
                <!--span>
                    <xsl:text> от</xsl:text>
                </span-->
                <input type="hidden" name="fields_filter[{@name}][0]" value="" class="textinputs"/>
            </label>
            <label class="right">
                <span>
                    <xsl:value-of select="@title"/>
                </span>
                <input type="text" name="fields_filter[{@name}][1]" placeholder="до" value="" class="textinputs"/>
            </label>
        </td>
    </xsl:template>
    <!-- =========================== -->
    <!-- =========================== -->
    <!-- =========================== -->


    <xsl:template match="udata[@module = 'search' and @method = 'insert_form']">

        <form class="morf_search" method="get" action="/search/search_do/">
            <input type="text" class="textinputs" style="width:180px; padding: 0 5px;" name="search_string" value="{last_search_string}" onfocus="javascript: if(this.value == '{last_search_string}') this.value = '';" onblur="javascript: if(this.value == '') this.value = '{last_search_string}';"/>
            <input type="submit" value="Искать"/>
        </form>

    </xsl:template>

    <!-- Вывод Формы ФИЛЬТРА END-->



    <!--===========================================================================================================================-->
</xsl:stylesheet>
