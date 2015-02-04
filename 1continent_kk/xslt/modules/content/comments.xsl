<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

    <xsl:template match="udata[@module = 'comments'][@method = 'insert']">
        
        <div class="add_comment">
            <div class="a_a_q">
                <div class="a_a_q_name">
                    <h3>Оставить свой комментарий</h3>
                </div>
                <form class="feedback" method="post" action="{action}">
                    <div class="f_box">
                        <label>
                            <span class="f_name">Ваше имя: </span>
                            <input type="text" name="author_nick"/>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Ваш E-mail: </span>
                            <input type="text" name="author_email"/>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Заголовок: </span>
                            <input type="text" name="title"/>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Сообщение: </span>
                            <textarea name="comment" rows="9" cols="27"/>
                        </label>
                    </div>
                    <div class="submit">
                        <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                        <input type="submit" class="input_button" name="submit" value="Отправить"/>
                    </div>
                </form>
            </div>
        </div>
        
        
        <span>Нет комментариев</span>
    </xsl:template>
    
    <xsl:template match="udata[@module = 'comments'][@method = 'insert'][items/item]">
        <div class="add_comment">
            <div class="a_a_q">
                <div class="a_a_q_name">
                    <h3>Оставить свой комментарий</h3>
                </div>
                <form class="feedback" method="post" action="{action}">
                    <div class="f_box">
                        <label>
                            <span class="f_name">Ваше имя: </span>
                            <input type="text" name="author_nick"/>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Ваш E-mail: </span>
                            <input type="text" name="author_email"/>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Заголовок: </span>
                            <input type="text" name="title"/>
                        </label>
                    </div>
                    <div class="f_box">
                        <label>
                            <span class="f_name">Сообщение: </span>
                            <textarea name="comment" rows="9" cols="27"/>
                        </label>
                    </div>
                    <div class="submit">
                        <xsl:apply-templates select="document('udata://system/captcha')/udata[url]"/>
                        <input type="submit" class="input_button" name="submit" value="Отправить"/>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="comments">
            <a name="comments"></a>
            <xsl:apply-templates select="items" mode="comment"/>
        </div>
        <xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata"/>
    </xsl:template>

    <xsl:template match="item" mode="comment">
        <div class="comment">
            <dl>
                <dd>
                    <xsl:apply-templates select="document(concat('udata://users/viewAuthor/', @author_id))/udata"/> 
                    <span class="comment_date">
                        <xsl:value-of select="document(concat('udata://system/convertDate/',@publish_time,'/(d)'))"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="document(concat('udata://content/convertDate/',@publish_time))"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="document(concat('udata://system/convertDate/',@publish_time,'/(Y)'))"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="document(concat('udata://system/convertDate/',@publish_time,'/(G:i)'))"/>
                    </span>
                </dd>
                <dt>
                    <xsl:value-of select="." disable-output-escaping="yes"/>
                </dt>
            </dl>
        </div>
    </xsl:template>

    <xsl:template match="udata[@module = 'users'][@method = 'viewAuthor']">
        <xsl:value-of select="fname" />
    </xsl:template>
    <!-- КАПЧА -->
    <xsl:template match="udata[@method='captcha']">
        <label for="captcha" id="for_captcha" title="Защитный код">
            <span class="f_name">Введите защитный код: </span>
            <input type="text" name="captcha" id="captcha"/>
            <img src="{url}{@random_string}" />
        </label>
    </xsl:template>
</xsl:stylesheet>
