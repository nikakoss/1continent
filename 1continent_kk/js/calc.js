jQuery(document).ready(function(){
    jQuery('#calc_form input[name="calc_cost"]').keyup(function() {
        result();
    });
    jQuery('#calc_form input[name="calc_pre"]').keyup(function() {
        result();
    });
    jQuery('#calc_form select[name="calc_time"]').change(function() {
        result();
    });



    function result(){

        var calc_cost = $('input[name="calc_cost"]').val();
        var calc_pre = $('input[name="calc_pre"]').val();
        var calc_time = $('select[name="calc_time"]').val();

        if(calc_cost != 0){
            var summ =  calc_cost - calc_pre + '';

            var pay = summ * 0.0125/(1-1.0125/Math.pow(1.0125, calc_time));

            pay = round(pay, 2)+'';

            pay = pay.replace(/.+?(?=\D|$)/, function(f) {
                return f.replace(/(\d)(?=(?:\d\d\d)+$)/g, "$1 ");
            });

            summ = summ.replace(/.+?(?=\D|$)/, function(f) {
                return f.replace(/(\d)(?=(?:\d\d\d)+$)/g, "$1 ");
            });


            $('#summ').html(summ);
            $('#pay').html(pay);
        }


    }


    function round(a,b) {
        b=b || 0;
        return Math.round(a*Math.pow(10,b))/Math.pow(10,b);
    }

    result();
});