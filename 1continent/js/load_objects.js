$(document).ready(function () {
    /*
    $(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() + $('.footer').height() + 50 >= $(document).height() && !inProcess) {
    loadObjects();
    }
    });
     */
    $('div.upload').on('click', function () {
        var id = $(this).attr('id').match(/\d+\S*/);
        loadObjects(id);
    })
});

var inProcess = false;
var num = 1;

function loadObjects(id) {
    var id_a = explode('_', id.toString());
    var url_r = document.location.href;
    var num_d = num + parseFloat(id_a[1]);
    if (url_r.match(/\?\S+/))
        var query = '&' + url_r.match(/\?(\S*)(fields_filter\S+)/)[2]; 
    else
        var query = '';
    var path = '/udata://catalog/getObjectsListAjax/notemplate/' + id_a[0] + '/5/.json?p=' + num_d + query + '';
    $.ajax({
        //url: '/udata://catalog/getObjectsListAjax/notemplate/' + id + '/2.json',
        url: path,
        method: 'GET',
        //data: {"p" : num},
        dataType: 'JSON',
        beforeSend: function () {
            inProcess = true;
        },
        success: function (data) {
            if (data.lines) {
                var items = data.lines.item;
                $.each(items, function (index, item) {
                    var ipoteca = '',
                    pic = '',
                    obj_title = '',
                    obj_desc = '',
                    obj_price = '',
                    obj_sub_price = '',
                    obj_info = '',
                    obj_rajon = '',
                    last_obj = '';
                    
                    if (item.ipoteka) {
                        var ipoteca = '<div class="cat_ipoteca"></div>';
                    }
                    pic = '<div class="obj_photo">' + ipoteca + '<a href="' + item.link + '"><img title="' + item.text + '" alt="' + item.text + '" src="' + item.pic + '"></a></div>';
                    obj_title = '<h4 class="obj_title"><a href="' + item.link + '" title="' + item.text + '">' + item.text + '</a></h4>';
                    obj_rajon = '<div class="obj_distinct">Район: ' + item.rajon + '</div>';
                    if (item.desc) {
                        obj_desc = '<div class="obj_desc">' + item.desc + '</div>';
                    } else {
                        obj_desc = '<div class="obj_desc"></div>';
                    }
                    if (item.tip_realizacii) {
                        if (item.tip_realizacii == '401') {
                            //аренда
                            if (item.price != '0')
                            obj_price = '<div class="obj_price"><span>Стоимость аренды: </span>' + item.price + ' руб. за м<sup>2</sup></div>';
                        } else {
                            //продажа
                            if (item.price != '0') {
                                obj_price = '<div class="obj_price"><span>Стоимость: </span>' + item.price + ' руб.</div>';
                                if (item.obj_sub_price != '0')
                                obj_sub_price = '<div class="obj_sub_price">(' + item.obj_sub_price + ' руб. за м<sup>2</sup>)</div>';
                            } else {
                                if (item.obj_sub_price != '0')
                                obj_price = '<div class="obj_price"><span>Цена: </span>' + item.obj_sub_price + ' руб. за м<sup>2</sup></div>';
                            }
                        }
                    } else {
                        if (item.price != '0') {
                            obj_price = '<div class="obj_price"><span>Стоимость: </span>' + item.price + ' руб.</div>';
                            if (item.obj_sub_price != '0')
                            obj_sub_price = '<div class="obj_sub_price">(' + item.obj_sub_price + ' руб. за м<sup>2</sup>)</div>';
                        } else {
                            if (item.obj_sub_price != '0')
                            obj_price = '<div class="obj_price"><span>Цена: </span>' + item.obj_sub_price + ' руб. за м<sup>2</sup></div>';
                        }
                    }
                    var obj_button = '<div class="obj_button"><a class="summit" href="#summit">Договориться о встрече в офисе</a></div>';
                    obj_info = '<div class="obj_info">' + obj_title + obj_rajon + obj_desc + obj_price + obj_sub_price + obj_button + '</div>';
                    //var obj = $("#news_list .wrapper > div[style = 'clear:both']");
                    //obj.before().css('color', '#f00');
                    last_obj = $(".content .wrapper div.catalog div.object").last('div.object');
                    //last_obj.after('<div class="news_block"> '+ pic + nb_anons + ' </div>') ;
                    last_obj.after('<div class="object">' + pic + obj_info + '</div>');
                });
                inProcess = false;
                num += 1;
            }
        }
    });
}
function explode(delimiter, string) {

	var emptyArray = { 0: '' };

	if ( arguments.length != 2
		|| typeof arguments[0] == 'undefined'
		|| typeof arguments[1] == 'undefined' )
	{
		return null;
	}

	if ( delimiter === ''
		|| delimiter === false
		|| delimiter === null )
	{
		return false;
	}

	if ( typeof delimiter == 'function'
		|| typeof delimiter == 'object'
		|| typeof string == 'function'
		|| typeof string == 'object' )
	{
		return emptyArray;
	}

	if ( delimiter === true ) {
		delimiter = '1';
	}

	return string.toString().split ( delimiter.toString() );
}
