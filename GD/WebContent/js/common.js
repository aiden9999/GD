                
var sn = 0;

setTimeout(slider_ani, 2000);

function slider_ani(){

    sn++;

    $(".main_slider_inner").stop().animate({
        top: -184 * sn
    }, 800, function(){
        if(sn == 4) {
            sn = 0;
            $(".slider_inner").css("top", 0);
        }
        setTimeout(slider_ani, 2000);
    });

    $(".main_slide_sel").removeClass("main_slide_sel");
    $(".main_slide").eq(sn).addClass("main_slide_sel");

    slider_time =  setTimeout(slider_ani, slider_speed);

    $(".circle_sel").removeClass("circle_sel");
    $(".slide_circle").eq(sn).addClass("circle_sel");

};

$(document).ready(function(){
    $(".slide_circle").click(function(){

    sn = $(this).index();
    $(".circle_sel").removeClass("circle_sel");
    $(this).addClass("circle_sel");

    $(".main_slide_sel").removeClass("main_slide_sel");
    $(".main_slide").eq(sn).addClass("main_slide_sel");

    });
});