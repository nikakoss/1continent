$(document).ready(function () {
    
    $("form.formId144").validate({ //заказ обратного звонка
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
                data: $('form.formId144').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId144 .submit input").attr("disabled","disabled");
                    //disabled=""
                    var phone = $('.formId144 :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId144 :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId144 :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId144");
                    //alert('Сообщение отправлено');
                    $('.formId144 :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId144 .submit input").removeAttr("disabled");
                }
            })
        }
    });
    //====================================================================
    $("form.formId145").validate({ // Задать вопрос специалисту
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
                data: $('form.formId145').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId145 .submit input").attr("disabled","disabled");
                    var phone = $('.formId145 :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId145 :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId145 :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId145");
                    //alert('Сообщение отправлено');
                    $('.formId145 :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId145 .submit input").removeAttr("disabled");
                }
            })
        }
    });
    //====================================================================
    $("form.formId146").validate({ // Договориться о встрече в офисе
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
                data: $('form.formId146').serialize(),
                url: "/udata://webforms/send/",
                beforeSend: function () {
                    $("form.formId146 .submit input").attr("disabled","disabled");
                    var phone = $('.formId146 :input[name="data[new][s_phone]"]').val();
                    var mail = $('.formId146 :input[name="data[new][s_mail]"]').val();
                    var name = $('.formId146 :input[name="data[new][s_name]"]').val();
                },
                success: function (msg) {
                    $('<div class="alert">Сообщение отправлено</div>').appendTo("form.formId146");
                    //alert('Сообщение отправлено');
                    $('.formId146 :input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    $("form.formId146 .submit input").removeAttr("disabled");
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