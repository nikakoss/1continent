$(document).ready(function() {
    var choice = $.cookie('choice'), 
    c_url = $.cookie('choice_url'), 
    current_url = document.URL;
    //--------------------------------------------------------------
    if(choice != 'true'){
        $("#inline_reg").trigger('click');
    } else {
        if(/kontakty/i.test(current_url) || /blog/i.test(current_url) || /cart/i.test(current_url) || /o_kompanii/i.test(current_url)){
        } else {
            var pattern = new RegExp(c_url, 'ig');
            if(pattern.test(current_url)){
            } else {
                $("#inline_reg").trigger('click');
            }
        }
    }

    $('#region div > a').on('click', function(){
        var url = $(this).attr('href');
        if(url != '/krasnodar') 
            url = '/'
        $.cookie('choice', 'true', { expires: 7, path: '/' });
        $.cookie('choice_url', url, { expires: 7, path: '/' });
    })
})         