<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!--===========================================================================================================================-->
	<xsl:template match="result[@module = 'blogs20'][@method = 'blog']" mode="blog_list">
		<div class="wrapper">
			<div class="breadcrumbs">
				<xsl:apply-templates select="document('udata://core/navibar/0/1/0/0')/udata"/>
			</div>
			<div class="headline">
				<h1>
					<xsl:value-of select=".//property[@name = 'h1']/value"/>
				</h1>
			</div>
			<div class="blog">
				<xsl:apply-templates select="document(concat('udata://blogs20/postsList/',$document-page-id,'//15'))/udata" mode="blog_list"/>
			</div>
			<xsl:call-template name="sidebar"/>
			<div class="clear"/>
		</div>
	</xsl:template>

	<xsl:template match="udata[@module = 'blogs20'][@method = 'postsList']" mode="blog_list">
		<div id="blog_items">
			<xsl:apply-templates select="items/item" mode="blog_list"/>
		</div>
		<xsl:apply-templates select="document(concat('udata://system/numpages/',total,'/',per_page,'/'))/udata"/>
		<!--xsl:apply-templates select="total"/-->
	</xsl:template>

	<xsl:template match="item" mode="blog_list">
		<xsl:variable name="anons_img" select="document(concat('upage://',@id,'.anons_img'))//value"/>
		<div class="object">
			<div class="obj_photo">
				<a href="{post_link}">
					<img alt="{name}" title="{name}">
						<xsl:attribute name="src">
							<xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/215/170/default/0/1/5/80'))//src"/>
						</xsl:attribute>
					</img>
				</a>
			</div>
			<div class="obj_info">
				<h4 class="obj_title">
					<a href="{post_link}">
						<xsl:value-of select="name"/>
					</a>
				</h4>
				<div class="obj_desc">
					<xsl:call-template name="firstWords">
						<xsl:with-param name="value" select="cut"/>
						<xsl:with-param name="count" select="43"/>
					</xsl:call-template>
				</div>
				<div class="obj_button">
					<a href="{post_link}" class="">Подробнее</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<!--===========================================================================================================================-->
	<xsl:template match="item" mode="otziv_blog_list">
		<xsl:variable name="anons_img" select="document(concat('upage://',@id,'.anons_img'))//value"/>
		<xsl:variable name="content" select="document(concat('upage://',@id,'.content'))//value"/>
		<xsl:variable name="name" select="document(concat('upage://',@id,'.h1'))//value"/>
		<xsl:variable name="update_time" select="document(concat('upage://',@id))/udata/page/@update-time"/>
		<div class="b_feedback">
			<div class="b_feedback_cont">
				<div class="bfc_left">
					<img alt="{$name}" title="{$name}">
						<xsl:attribute name="src">
							<xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/128/128/default/0/1/5/80'))//src"/>
						</xsl:attribute>
					</img>
				</div>
				<div class="bfc_right">
					<span>
						<xsl:apply-templates select="document(concat('udata://system/convertDate/',$update_time,'/d.m.Y/'))/udata"/>
					</span>
					<span class="bfc_name">
						<xsl:value-of select="$name"/>
					</span>
					<xsl:value-of select="$content" disable-output-escaping="yes"/>
				</div>
				<div class="clear"/>
			</div>
		</div>
	</xsl:template>
	<!--===========================================================================================================================-->
	<xsl:template match="item" mode="otziv_blog_list2">
		<xsl:variable name="anons_img" select="document(concat('upage://',@id,'.anons_img'))//value"/>
		<xsl:variable name="content" select="document(concat('upage://',@id,'.content'))//value"/>
		<xsl:variable name="name" select="document(concat('upage://',@id,'.h1'))//value"/>
		<xsl:variable name="update_time" select="document(concat('upage://',@id))/udata/page/@update-time"/>
		<xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>
		<div class="b_feedback_list">
			<div class="b_feedback_cont_list">
				<div class="bfc_left">
					<img alt="{$name}" title="{$name}">
						<xsl:attribute name="src">
							<xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/128/128/default/0/1/5/80'))//src"/>
						</xsl:attribute>
					</img>
				</div>
				<div class="bfc_right">
					<span>
						<xsl:apply-templates select="document(concat('udata://system/convertDate/',$update_time,'/d.m.Y/'))/udata"/>
					</span>
					<a href="{$link}">
						<span class="bfc_name">
							<xsl:value-of select="$name"/>
						</span>
					</a>
					<!--xsl:value-of select="$content" disable-output-escaping="yes"/-->
					<xsl:call-template name="firstWords">
						<xsl:with-param name="value" select="$content"/>
						<xsl:with-param name="count" select="15"/>
					</xsl:call-template>
					<xsl:text>...</xsl:text>
					<xsl:value-of select="concat('&lt;','/p','&gt;')" disable-output-escaping="yes"/>
					
				</div>
				<div class="clear"/>
			</div>
		</div>
	</xsl:template>
	<!--===========================================================================================================================-->
	<xsl:template match="result[@module = 'blogs20'][@method = 'post']" mode="blog_post">
		<xsl:variable name="id" select="page/@id"/>
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
				<div class="b_p_content">
					<xsl:value-of select=".//property[@name = 'content']/value" disable-output-escaping="yes"/>
					<script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"/>
					<div class="yashare-auto-init" data-yashareL10n="ru" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,gplus" data-yashareTheme="counter"/>

				</div>

				<div class="related">
					<div class="b_i_title">Похожие статьи</div>
					<xsl:apply-templates select="document(concat('udata://blogs20/postsList/',parents/page/@id,'//'))/udata/items/item[not(@id = $id)]" mode="related"/>
				</div>



			</div>

			<xsl:call-template name="sidebar"/>
			<div class="clear"/>
		</div>


	</xsl:template>
	<!--===========================================================================================================================-->
	<xsl:template match="item" mode="related">
		<xsl:if test="position() &lt;= 4">
			<xsl:variable name="anons_img" select="document(concat('upage://',@id,'.anons_img'))//value"/>

			<div class="object">
				<div class="obj_photo">
					<a href="{post_link}">
						<img alt="{name}" title="{name}">
							<xsl:attribute name="src">
								<xsl:value-of select="document(concat('udata://system/makeThumbnailFull/(.', $anons_img, ')/112/112/default/0/1/5/80'))//src"/>
							</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="obj_info">
					<xsl:if test="publish_time">
						<span class="publish_time">
							<xsl:apply-templates select="document(concat('udata://system/convertDate/',publish_time,'/d.m.Y/'))/udata"/>
						</span>
					</xsl:if>

					<h4 class="obj_title">
						<a href="{post_link}">
							<xsl:value-of select="name"/>
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
	<!--===========================================================================================================================-->

	<xsl:template match="item" mode="home_blog_list">
		<xsl:variable name="title" select="document(concat('upage://',@id))//property[@name = 'h1']/value"/>
		<xsl:variable name="photo" select="document(concat('upage://',@id))//property[@name = 'foto_dlya_anonsa']/value"/>
		<xsl:variable name="link" select="document(concat('upage://',@id))/udata/page/@link"/>
		<xsl:variable name="kratkoe_opisanie" select="document(concat('upage://',@id))//property[@name = 'anons_stati' ]/value"/>
		<div class="hi_item">
			<h3>
				<a href="{$link}">
					<xsl:value-of select="$title"/>
				</a>
			</h3>
			<xsl:value-of select="$kratkoe_opisanie"/>
		</div>
	</xsl:template>

</xsl:stylesheet>
