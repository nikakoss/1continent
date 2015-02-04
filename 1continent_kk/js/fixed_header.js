$(function () {
    var header = $('.header'),
    pos = header.offset();
    pos.top = 0;
    $(window).scroll(function () {
        if ($(this).scrollTop() > pos.top + header.height() && header.hasClass('header def')) {
            header.fadeOut('fast', function () {
                $(this).removeClass('def').addClass('fixed').slideDown('9000');
            });
        } else if ($(this).scrollTop() <= pos.top && header.hasClass('fixed')) {
            header.fadeOut('fast', function () {
                $(this).removeClass('fixed').addClass('def').slideDown('9000');
            });
        }
    });
});

$(document).ready(function () {
    var time;
    var url = document.location.href;
    
    $('.phone').hover(function () {
        time = setTimeout(function () {
            if (url == 'http://1-continent.ru/o_kompanii/') {
                yaCounter21668962.reachGoal('read_phone_on_o_kompanii');
            } else {
                yaCounter21668962.reachGoal('read_phone');
            }
        },
        2000);
    },
    function () {
        clearTimeout(time);
    })
    
    $('.h_contacts_mail, .h_contacts_skype').hover(function () {
        time = setTimeout(function () {
            
            
            if (url == 'http://1-continent.ru/kontakty/') {
                yaCounter21668962.reachGoal('read_mail_skype_on_kontakty');
            } else {
                yaCounter21668962.reachGoal('read_mail_skype');
            }
        },
        2000);
    },
    function () {
        clearTimeout(time);
    })
})