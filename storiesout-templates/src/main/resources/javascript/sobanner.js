$(document).ready(function(){


    //IMAGE SWITCHER


    function bannersizeswitcher(){

        var bannerexist = $("div").hasClass("so-banner-cta");
        var logoexist = $("div").hasClass("jahia-product-logo");

        if ((bannerexist == false) && (logoexist == false) && ($(window).width() > 1161)){
            $(".so-banner-content").css("padding","30px 100px 30px 100px");
        }
        else if ((bannerexist == false) && (logoexist == false) && ($(window).width() <= 1161)){

        }
    };


    //FUNCTION CALLS

    //on page load
    bannersizeswitcher();


    jQuery(window).load(function () {
        bannersizeswitcher();
    });


    // on resize
    window.onresize = function(event) {
        bannersizeswitcher();
    };

    // on scroll
    $(window).scroll(function(){

    });


}); //DOCUMENT READY 