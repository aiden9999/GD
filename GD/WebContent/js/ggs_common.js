//$(document).ready(function(){
//    var sn = 0;
//    setTimeout(slider_ani, 2000);
//    
//    function slider_ani(){
//        sn++;
//        $(".main_slider_inner").stop().animate({
//            left: -699 * sn
//        }, 1000, function(){
//            if(sn == 4) {
//                sn = 0;
//                $(".main_slider_inner").css("left", 0);
//            }
//            setTimeout(slider_ani, 2000);
//        });
//        
//        $(".main_slide_sel").removeClass("main_slide_sel");
//        $(".main_slide").eq(sn).addClass("main_slide_sel");
//        $(".circle_sel").removeClass("circle_sel");
//        $(".slide_circle").eq(sn).addClass("circle_sel");
//    };
//    
//    $(".slide_circle").click(function(){
//    sn = $(this).index();
//    $(".circle_sel").removeClass("circle_sel");
//    $(this).addClass("circle_sel");
//    $(".main_slide_sel").removeClass("main_slide_sel");
//    $(".main_slide").eq(sn).addClass("main_slide_sel");
//    });
//});

$(document).ready(function(){
	var lsn = 0;
	setTimeout(slide_auto, 1000);
	$("#circle0").click(function(){slide(0)});
	$("#circle1").click(function(){slide(1)});
	$("#circle2").click(function(){slide(2)});
	$("#circle3").click(function(){slide(3)});
	$("#circle4").click(function(){slide(4)});
	
	function slide_auto(){
		lsn++;
        $(".main_slider_inner").stop().animate({
            left: -699 * lsn
        }, 1000, function(){
        	setTimeout(slide_auto, 1000);
            if(lsn == 4) {
                lsn = 0;
                $(".main_slider_inner").css("left", 0);
            }
        });
        
        $(".main_slide_sel").removeClass("main_slide_sel");
        $(".main_slide").eq(lsn).addClass("main_slide_sel");
        $(".circle_sel").removeClass("circle_sel");
        $(".slide_circle").eq(lsn).addClass("circle_sel");
	}
	
	function slide(num){
		$(".main_slider_inner").stop().animate({
			left : -699*num
		}, 1000);
		$(".circle_sel").removeClass("circle_sel");
		$("#circle"+num).addClass("circle_sel");
		lsn==num;
	}
});


$(document).ready(function(){
    var tsn = 0;
    $(".th_arrow_down").click(function(){
        tsn++;
        $(".thumbs_inner").stop().animate({
            top: -461 * tsn
        });
    });
    $(".th_arrow_up").click(function(){
        tsn--;
        $(".thumbs_inner").stop().animate({
            top: -461 * tsn
        });
    });
});

// ajax 로딩
$(document).ready(function(){
	// 로딩이미지 숨김
	var loading = $('<div id="ajaxLoadingDiv"><img src="/ajaxLoading/ajax-loader.gif" id="ajaxLoading"/></div>').appendTo(document.body).hide();
	// 로딩이미지 css
	$("#ajaxLoadingDiv").css({"top" : 0, "left" : 0, "right" : 0, "bottom" : 0, "position" : "absolute"});
	$("#ajaxLoading").css({"position" : "absolute", "top" : "50%", "left" : "50%", "transform" : "translate3d(-50%, -50%, 0)"});
	
	// ajax 실행시 로딩이미지 보여주기
	$(window).ajaxStart(function(){
		loading.fadeIn(500);
		$("header").css("z-index", "1");
	})
	// ajax 종료시 로딩이미지 숨기기
	.ajaxStop(function(){
		loading.fadeOut(500);
	});
});