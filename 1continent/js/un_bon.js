$(document).ready(function () {
    var r_id = $('.detail_info').attr('id');
    var id = r_id.split('_');
    var needKey = "unikalnye_bonusy";
    var needGroup, html;

    var path = '/upage:/' + id[1] + '.json';
    $.ajax({
        url: path,
        method: 'GET',
        //data: {"p" : num},
        dataType: 'JSON',
        success: function (data) {
            if (data.page) {
                var groups = data.page.properties;

                $.each(groups.group, function (index, property){
                    //console.log(index, property.name);
                    if(property.name == needKey)
                        needGroup = property;
                })

            }
            console.log(needGroup);
            if (typeof needGroup == 'object') {
                $.each(needGroup.property, function(index){
                    if(this.type == 'img_file'){
                        var text = this.value.value;
                        //console.log(this.value.value);
                        $('.unikalnye_bonusy').append('<div>'+'<div style="background-image: url(&quot;'+ text +'&quot;)" class="b_img"></div>'+'</div>')
                    }

                    if(this.type == 'wysiwyg'){
                        var text = this.value.value;
                        //console.log(this.value.value);
                        $('.unikalnye_bonusy > div').last().append('<div>'+ text +'</div><div class="clear"></div>')
                    }

                })

            }


        }



    })

    //console.log(id[1]);

});
