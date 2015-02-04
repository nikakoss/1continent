jQuery(document).ready(function(){
    $('.os118 .input_button').on('click', function(){
        var type = $('select[name="type"]').val();
        var rajon = $('select[name="rajon"]').val();
        var url =  type+'/?fields_filter[rajon_k]='+rajon;
        location.href='/krasnodar/'+url;
    })
});