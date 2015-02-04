<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/TR/xlink">


         <xsl:template match="purchasing[@stage = 'required'][@step = 'personal']">
            <xsl:apply-templates select="//steps" />
                <div class="personal_data">
                        <form enctype="multipart/form-data" method="post" action="{$lang-prefix}/emarket/purchase/required/personal/do/">
                                                        <xsl:apply-templates select="document(concat('udata://data/getEditForm/', customer-id))" />
                                <div>
                                        <input type="submit" class="button big" value="&continue;" />
                                </div>
                        </form>
                </div>
                
                <div class="clear"></div>
        </xsl:template>
</xsl:stylesheet>