<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="udata[@module = 'emarket' and @method = 'cart']" mode="upcart">
                    <xsl:apply-templates select="summary" mode="upcart" />
    </xsl:template>

    <xsl:template match="summary" mode="upcart">
        <a href="/emarket/cart/" title="Избранное" rel="nofollow">
            Выбранные объекты
        </a>
        <span class="basket_info_summary">
        </span>
    </xsl:template>

    <xsl:template match="summary[amount &gt; 0]" mode="upcart">
        <a href="/emarket/cart/" title="Избранное" rel="nofollow">
            Выбранные объекты
        </a>
        <span class="basket_info_summary">
            (<xsl:apply-templates select="amount" />)
        </span>
    </xsl:template>
    
</xsl:stylesheet>