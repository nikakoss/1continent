<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM	"ulang://i18n/constants.dtd:file">

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:umi="http://www.umi-cms.ru/TR/umi">

	<xsl:template match="udata" mode="rate"/>

	<xsl:template match="udata[@is_graded = '1']" mode="rate">
		<div class="votes vote element_{element_id}" itemprop="aggregateRating" itemscope="itemscope" itemtype="http://schema.org/AggregateRating">
			<span>Голосовать: </span>
			<xsl:call-template name="rateStars"/>
		</div>
	</xsl:template>

	<xsl:template match="udata[@is_graded = '1' and is_rated = '1']" mode="rate">
		<div class="votes element_{element_id}" title="&votes-title;" itemprop="aggregateRating" itemscope="itemscope" itemtype="http://schema.org/AggregateRating">
			<span>Рейтинг: </span>
			<xsl:call-template name="rateStars"/>
		</div>
	</xsl:template>

	<xsl:template name="rateStars">
		<link itemprop="ratingValue" content="{rate}"/>
		<link itemprop="reviewCount" content="{rate_voters}"/>
		<div class="star_1 current_{ceil_rate}">
			<a href="/vote/setElementRating//{element_id}/1/"/>
			<div class="star_2 current_{ceil_rate}">
				<a href="/vote/setElementRating//{element_id}/2/"/>
				<div class="star_3 current_{ceil_rate}">
					<a href="/vote/setElementRating//{element_id}/3/"/>
					<div class="star_4 current_{ceil_rate}">
						<a href="/vote/setElementRating//{element_id}/4/"/>
						<div class="star_5 current_{ceil_rate}">
							<a href="/vote/setElementRating//{element_id}/5/"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="udata[@is_graded = '1']" mode="rate_no_vote">
		<div class="votes element_{element_id}" title="&votes-title;" itemprop="aggregateRating" itemscope="itemscope" itemtype="http://schema.org/AggregateRating">
			<span>Рейтинг: </span>
			<xsl:call-template name="rateStarsNoVote"/>
		</div>
	</xsl:template>

	<xsl:template name="rateStarsNoVote">
		<link itemprop="ratingValue" content="{rate}"/>
		<link itemprop="reviewCount" content="{rate_voters}"/>
		<div class="star_1 current_{ceil_rate}">
			<a/>
			<div class="star_2 current_{ceil_rate}">
				<a/>
				<div class="star_3 current_{ceil_rate}">
					<a/>
					<div class="star_4 current_{ceil_rate}">
						<a/>
						<div class="star_5 current_{ceil_rate}">
							<a/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
