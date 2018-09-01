
jQuery.expr.filters.offscreen = function(el) {
    var rect = el.getBoundingClientRect();
    return (
        (rect.x + rect.width) < 0
        || (rect.y + rect.height) < 0
        || (rect.x > window.innerWidth || rect.y > window.innerHeight)
    );
};
        window.onscroll = function () {
            if($('#top').is(':offscreen'))
                $('.mobile-filter').addClass('scroll');
            else
                $('.mobile-filter').removeClass('scroll');
        };
        $('.mobile-filter').click(function () {
            if ($('#column-left').is(':hidden')){
                $('#column-left').addClass('show');
                $('body').addClass('filter');
            }
            else{
                $('#column-left').removeClass('show');
                $('body').removeClass('filter');
            }


        });

