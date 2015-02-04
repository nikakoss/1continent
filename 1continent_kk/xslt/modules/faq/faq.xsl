<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY raquo  "&#187;">
    <!ENTITY ndash  "&#8211;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">
    <xsl:template match="result[@module = 'faq'][@method = 'project']" mode="faq">



        <xsl:apply-templates select="document('udata://faq/category/notemplate/52/10')" mode="faq"/>

    </xsl:template>
    <xsl:template match="udata[@module = 'faq' and @method = 'category']" mode="faq">
        <div class="article">
            <xsl:apply-templates select="items" mode="faq"/>
            <xsl:apply-templates select="document('udata://faq/addQuestionForm/notemplate/52')" mode="faq_form"/>
        </div>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata"/>
    </xsl:template>

    <xsl:template match="item" mode="faq">
        <xsl:variable name="author_id" select="document(concat('upage://',@id))//property[@name = 'author_id']/value/item/@id "/>
        <xsl:variable name="author" select="document(concat('udata://users/viewAuthor/', $author_id))/udata/fname"/>

        <div class="faq">
            <div class="f_q">
                <div class="f_q_name"><xsl:value-of select="$author"/>: </div>
                <dl>
                    <dd>
                        <xsl:value-of select="@name"/>
                    </dd>
                    <dt>
                        <xsl:value-of select="question"/>
                    </dt>
                </dl>
            </div>
            <div class="f_a">
                <div class="f_a_name"> Федерация мотоспорта отвечает: </div>
                <div class="f_a_answer">
                    <xsl:value-of select="answer"/>
                </div>
            </div>
        </div>

    </xsl:template>
    <xsl:template match="udata[@module = 'faq'][@method = 'addQuestionForm']" mode="faq_form">

        <div class="a_a_q">
            <div class="a_a_q_name">
                <h3>Задайте свой вопрос</h3>
            </div>
            <form class="feedback" method="post" action="{action}" onsubmit="site.forms.data.save(this); return site.forms.data.check(this);">
                <div class="f_box">
                    <label>
                        <span class="f_name">Ваше имя: </span>
                        <input type="text" name="nick" class="textinputs"/>
                    </label>
                </div>
                <div class="f_box">
                    <label>
                        <span class="f_name">Ваш E-mail: </span>
                        <input type="text" name="email" class="textinputs"/>
                    </label>
                </div>
                <div class="f_box">
                    <label>
                        <span class="f_name">Тема: </span>
                        <input type="text" name="title" class="textinputs"/>
                    </label>
                </div>
                <div class="f_box">
                    <label>
                        <span class="f_name">Сообщение: </span>
                        <textarea cols="27" rows="9" name="question"/>
                    </label>
                </div>
                <div class="submit">
                    <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>

                    <input type="submit" value="" name="submit" class="input_button"/>
                </div>
            </form>
        </div>

    </xsl:template>
    <xsl:template match="result[@module = 'faq'][@method = 'post_question']" mode="faq">
        <div class="article">
            <p>
                <xsl:text>Ваш вопрос отправлен. Мы ответим Вам в ближайшее время.</xsl:text>
            </p>
            <p>
                <xsl:text>С уважением, Администрация сайта.</xsl:text>
            </p>
            <p>
                <a href="/vopros_otvet/">
                    <xsl:text>Вернуться с списку вопросов</xsl:text>
                </a>
            </p>
        </div>
    </xsl:template>


</xsl:stylesheet>
