$(document).ready(function () {
    
    $("form.formId130").validate({
        rules: {
            'data[new][s_phone]': {
                required: true
            }
        },
        
        messages: {
            'data[new][s_phone]': {
                required: "Необходимо заполнить",
                email: "Адрес некорректный",
            }
        },
        submitHandler: function (form) {
            //form.submit();
            $.ajax({
                type: "POST", //Тип запроса
                dataType: "html", //Тип данных
                data: $('form.formId130').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId130 .submit input").attr("disabled","disabled");
                    //disabled=""
                    var phone = $('.formId130 :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId130 :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId130 :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId130");
                    //alert('Сообщение отправлено');
                    $('.formId130 :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId130 .submit input").removeAttr("disabled");
                }
            })
        }
    });
    //====================================================================
    $("form.formId131").validate({
        rules: {
            'data[new][s_phone]': {
                required: true
            }
        },
        
        messages: {
            'data[new][s_phone]': {
                required: "Необходимо заполнить",
                email: "Адрес некорректный",
            }
        },
        submitHandler: function (form) {
            //form.submit();
            $.ajax({
                type: "POST", //Тип запроса
                dataType: "html", //Тип данных
                data: $('form.formId131').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId131 .submit input").attr("disabled","disabled");
                    var phone = $('.formId131 :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId131 :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId131 :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId131");
                    //alert('Сообщение отправлено');
                    $('.formId131 :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId131 .submit input").removeAttr("disabled");
                }
            })
        }
    });
    //====================================================================
    $("form.formId132").validate({
        rules: {
            'data[new][s_phone]': {
                required: true
            }
        },
        
        messages: {
            'data[new][s_phone]': {
                required: "Необходимо заполнить",
                email: "Адрес некорректный",
            }
        },
        submitHandler: function (form) {
            //form.submit();
            $.ajax({
                type: "POST", //Тип запроса
                dataType: "html", //Тип данных
                data: $('form.formId132').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId132 .submit input").attr("disabled","disabled");
                    var phone = $('.formId132 :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId132 :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId132 :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId132");
                    //alert('Сообщение отправлено');
                    $('.formId132 :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId132 .submit input").removeAttr("disabled");
                }
            })
        }
    });
    //====================================================================
    $("form.formId_calc").validate({
        rules: {
            'data[new][s_phone]': {
                required: true
            }
        },
        
        messages: {
            'data[new][s_phone]': {
                required: "Необходимо заполнить",
                email: "Адрес некорректный",
            }
        },
        submitHandler: function (form) {
            //form.submit();
            $.ajax({
                type: "POST", //Тип запроса
                dataType: "html", //Тип данных
                data: $('form.formId_calc').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId132 .submit input").attr("disabled","disabled");
                    var phone = $('.formId_calc :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId_calc :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId_calc :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId_calc");
                    //alert('Сообщение отправлено');
                    $('.formId_calc :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId_calc .submit input").removeAttr("disabled");
                }
            })
        }
    });
    //====================================================================
});