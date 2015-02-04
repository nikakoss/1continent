site.basket = {};

site.basket.replace = function(id) {
	return function(e) {
		var text, discount, goods_discount_price, goods_discount, item_total_price, item_discount, cart_item, basket, i, item, related_goods,
			cart_summary = jQuery('.cart_summary'),
			cart_discount = jQuery('.cart_discount'),
			goods_discount_price = jQuery('.cart_goods_discount'),
			add_basket_button_text = 'В избранном',
			rem_item = true,
			detect_options = {};

		if (e.summary.amount > 0) {
			text = e.summary.price.actual;
			goods_discount = ((typeof e.summary.price.original == 'undefined') ? e.summary.price.actual : e.summary.price.original);
			discount = ((typeof e.summary.price.discount != 'undefined') ? e.summary.price.discount : '0');
			for (i in e.items.item) {
				item = e.items.item[i];
				if (item.id == id) {
					rem_item = false;
					item_total_price = item["total-price"].actual;
					item_discount = ((typeof item.discount != 'undefined') ? item.discount.amount : '0');
				}
				if (item.page.id == id) {
					if (detect_options.amount) {
						detect_options.amount = detect_options.amount + item.amount;
					}
					else detect_options = {'id':id, 'amount':item.amount};
				}
			}
			if (detect_options.amount) {
				var add_basket_button = jQuery('#add_basket_' + detect_options.id);
				
				if (add_basket_button[0].tagName.toUpperCase() == 'A' && !site.basket.is_cart) {
					//add_basket_button.text(add_basket_button_text + ' (' + detect_options.amount + ')');
					add_basket_button.html(add_basket_button_text);
					add_basket_button.removeAttr("id");
					add_basket_button.removeClass("add_to_fav");
					add_basket_button.addClass("added_to_fav");
				}
				
				if (add_basket_button[0].tagName.toUpperCase() == 'FORM') {
					add_basket_button = jQuery('input:submit', add_basket_button);
					//add_basket_button.val(add_basket_button_text + ' (' + detect_options.amount + ')');
					add_basket_button.val(add_basket_button_text);
					add_basket_button.attr("disabled","");
				} else add_basket_button.val(add_basket_button_text + ' (' + detect_options.amount + ')');
			}
			if (rem_item) {
				if (cart_item = jQuery('.cart_item_' + id)) {
					if(related_goods = jQuery('.cart_item_' + id + ' + div.related-goods')) {
						related_goods.remove();
					}
					cart_item.remove();
					cart_summary.text(text);
					cart_discount.text(discount);
					goods_discount_price.text(goods_discount);
					jQuery('.basket div').removeClass('even');
					jQuery('div[class^="cart_item_"]:odd').addClass('even');
					jQuery('div[class^="cart_item_"]:odd + .related-goods').addClass('even');
				}
			} else {
				jQuery('.cart_item_price_' + id).text(item_total_price);
				jQuery('.cart_item_discount_' + id).text(item_discount);
				cart_summary.text(text);
				cart_discount.text(discount);
				goods_discount_price.text(goods_discount);
			}
			//text = e.summary.amount + ' шт товаров на сумму ' + (e.summary.price.prefix||'') + ' ' + text + ' ' + (e.summary.price.suffix||'');
			text = '<span class="basket_info_summary"> ('+  e.summary.amount +')</span>';
		} else {
			text = '(0)';
			if (basket = jQuery('.basket')) {
			         location.href = '/';
				//basket.html('<div class="headline"><h3>В избранном ничего нет</h3></div>');
			}
		}
		jQuery('.basket_info_summary').html(text);
		site.basket.modify.complete = true;
	};
};

site.basket.add = function(id, form, popup) {
	var e_name, options = {};
	if (form) {
		var elements = jQuery(':radio:checked', form);
		for (var i = 0; i < elements.length; i++) {
			e_name = elements[i].name.replace(/^options\[/, '').replace(/\]$/, '');
			options[e_name] = elements[i].value;
		}
	}
	basket.putElement(id, options, this.replace(id));
	if (popup) jQuery('#add_options_' + id).remove();
};

site.basket.list = function(link) {
	var id = (link.id.indexOf('add_basket') != -1) ? link.id.replace(/^add_basket_/, '') : link;
	if (!id) return false;
	if (jQuery(link).hasClass('options_true')) {
		if (jQuery('#add_options_' + id).length == 0) {
			jQuery.ajax({
				url: '/upage//' + id + '?transform=modules/catalog/popup-add-options.xsl',
				dataType: 'html',
				success: function (data) {
					site.message({
						id: 'add_options_' + id,
						header: 'Выбор опций',
						width: 400,
						content: data,
						async: false
					});
					jQuery('form.options').submit(function() {
						if(!site.basket.is_cart) {
							site.basket.add(id, this, true);
							return false;
						}
					});
				}
			});
		}
	}
	else this.add(id);
};

site.basket.modify = function(id, amount_new, amount_old) {
	if (amount_new.replace(/[\d]+/) == 'undefined' && amount_new != amount_old) {
		basket.modifyItem(id, {amount:amount_new}, this.replace(id));
	}
	else this.modify.complete = true;
};

site.basket.modify.complete = true;

site.basket.remove = function(id) {
	if (id == 'all') basket.removeAll(this.replace(id));
	else basket.removeItem(id, this.replace(id));
};

site.basket.init = function() {
	this.is_cart = (!!jQuery('.basket table').length);
	jQuery('.basket_list').click(function(){
		if (!site.basket.is_cart || !jQuery(this).hasClass('options_false')) {
			site.basket.list(this);
			return false;
		}
	});
	jQuery('form.options').submit(function(){
		var id = (this.id.indexOf('add_basket') != -1) ? this.id.replace(/^add_basket_/, '') : this;
		site.basket.add(id, this);
		return false;
	});
	jQuery('a.del_from_fav').click(function(){
		site.basket.remove(this.id.match(/\d+/).pop());
		return false;
	});
	jQuery('a.basket_remove_all').click(function(){
		site.basket.remove('all');
		return false;
	});
	jQuery('div.basket input.amount').bind('keyup', function() {
		if(0 > parseInt(this.value))
			this.value = Math.abs(this.value);
		if (site.basket.modify.complete) {
			site.basket.modify.complete = false;
			var amountThis = this;
			setTimeout(function() {
				var id = parseInt(amountThis.parentNode.parentNode.className.split('_').pop()),
				e = jQuery(amountThis).next('input'),
				old = e.val();
				e.val(amountThis.value);
				site.basket.modify(id, amountThis.value, old);
			}, 500)
		}
	});
	jQuery('.change-amount .top').click(function(){
		if (site.basket.modify.complete) {
			site.basket.modify.complete = false;
			var id = parseInt(this.parentNode.parentNode.parentNode.className.split('_').pop()),
			e = this.parentNode.previousSibling,
			old = e.value;
			e.value = (parseInt(old) + 1);
			e.previousSibling.value = e.value;
			site.basket.modify(id, e.value, old);
		}
	});
	jQuery('.change-amount .bottom').click(function(){
		if (site.basket.modify.complete) {
			site.basket.modify.complete = false;
			var id = parseInt(this.parentNode.parentNode.parentNode.className.split('_').pop()),
			e = this.parentNode.previousSibling,
			old = e.value;
			e.value = (parseInt(old) - 1);
			e.previousSibling.value = e.value;
			site.basket.modify(id, e.value, old);
		}
	});
};

jQuery(document).ready(function(){site.basket.init()});