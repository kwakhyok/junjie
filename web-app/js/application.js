if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
                $(this).fadeOut();
            });
    })(jQuery);
}
$('.nav-pills > li').click(function(){
    $(this)
        .addClass('active')
        .siblings().removeClass('active')
        .end()
})

$('.main-menu > li').click(function(){
    $(this)
        .addClass('active')
        .siblings().removeClass('active')
        .end()
})

