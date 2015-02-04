jQuery(document).ready(function () {
    
    $('input[name="fields_filter[cena][1]"]').keyup(function () {
        var text = $('input[name="fields_filter[cena][1]"]').val();
        $('input[name="fields_filter[stoimost_max][0]"]').val(text);
        //$('input[name="data[new][h1]"]').val(text);
    })
});