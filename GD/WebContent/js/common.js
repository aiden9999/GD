$(document).ready(function(){
    var sn = 0;

    setTimeout(slider_ani, 2000);

    function slider_ani(){

        sn++;

        $(".main_slider_inner").stop().animate({
            left: -699 * sn
        }, 1000, function(){
            if(sn == 4) {
                sn = 0;
                $(".main_slider_inner").css("left", 0);

            }

            setTimeout(slider_ani, 2000);
        });

            $(".main_slide_sel").removeClass("main_slide_sel");
            $(".main_slide").eq(sn).addClass("main_slide_sel");

            $(".circle_sel").removeClass("circle_sel");
            $(".slide_circle").eq(sn).addClass("circle_sel");
    };
    
            $(".slide_circle").click(function(){

            sn = $(this).index();
            $(".circle_sel").removeClass("circle_sel");
            $(this).addClass("circle_sel");

            $(".main_slide_sel").removeClass("main_slide_sel");
            $(".main_slide").eq(sn).addClass("main_slide_sel");

            });
});



//$(document).ready(function(){
//               
//        var bcsn = 1;
//
//        var $cardFirst = $(".rec_slide").first().clone();
//        var $cardLast = $(".rec_slide").last().clone();
//
//        $(".rec_slider_inner").append( $cardFirst );
//        $(".rec_slider_inner").prepend( $cardLast );
//
//        $(".rec_slider_inner").css("left", -565 * bcsn);
//
//        $(".rec_arrow_next").click(function(){                    
//            bcsn++;                    
//            $(".rec_slider_inner").stop().animate({
//                left: -565 * bcsn
//            }, function(){
//                if (bcsn == 6) {
//                    bcsn = 1;
//
//            $(".rec_slider_inner").css("left", -565 * bcsn);        
//                }                        
//            });                    
//        });
//
//        $(".rec_arrow_prev").click(function(){                    
//            bcsn--;                    
//            $(".rec_slider_inner").stop().animate({
//                left: -565 * bcsn
//            }, function(){
//                if (bcsn == 0) {
//                    bcsn = 5;
//            $(".rec_slider_inner").css("left", -565 * bcsn);        
//                }                        
//            });                    
//        }); 
//
//
//
//    });
