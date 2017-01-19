<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/css/style.css" type="text/css">
        <link rel="stylesheet" href="/css/swiper.min.css">
        <link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="robots" content="follow">
        <meta name="description" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
        <meta name="keywords" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
        <meta property="og:type" content="website">
        <meta property="og:title" content="강남대치학원 멘토클리닉">
        <meta property="og:description" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
        <meta property="og:image" content="http://www.mysite.com/myimage.jpg">
        <meta property="og:url" content="http://mentorschool.co.kr">
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=i9nljBxxeJZYnyH27RC1"></script>
        <title></title>
        
        <style>
            
        </style>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/common.js"></script>
        <script type="text/javascript">
            var currentImage;
            var currentIndex = -1;
            var interval;
            function showImage(index){
                if(index < $('.bigPic_img').length){
                    var indexImage = $('.bigPic_img')[index]
                    if(currentImage){   
                        if(currentImage != indexImage ){
                            $(currentImage).css('z-index',2);
                            clearTimeout(myTimer);
                            $(currentImage).fadeOut(250, function() {
                                myTimer = setTimeout("showNext()", 2000000);
                                $(this).css({'display':'none','z-index':1})
                            });
                        }
                    }
                    $(indexImage).css({'display':'block', 'opacity':1});
                    currentImage = indexImage;
                    currentIndex = index;
                    $('#thumbs li').removeClass('active');
                    $($('#thumbs li')[index]).addClass('active');
                }
            }

            function showNext(){
                var len = $('.bigPic_img').length;
                var next = currentIndex < (len-1) ? currentIndex + 1 : 0;
                showImage(next);
            }

            var myTimer;

            $(document).ready(function() {
                myTimer = setTimeout("showNext()", 2000000);
                showNext(); //loads first image
                $('#thumbs li').bind('click',function(e){
                    var count = $(this).attr('rel');
                    showImage(parseInt(count)-1);
                });
            });
        </script>
    </head>
     
    <body>
        <header>
            <div class="header_top">
                <div class="inner">
                    <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                    <div class="search">
                        <input type="text" id="hsearch" style="border: 2px solid #888f8d; height: 24px; " maxlength="10">
                        <img class="hsearch" src="/img/search.png" onclick="search()">
                    </div>
                    <div class="txt" onclick="login()">로그인</div>
                </div>
            </div>
            <div class="gnb">
                <div class="inner">
                    <ul>
                        <li onclick="location.href='/elementary'">
                            <div class="txt">초등학원</div>
                        </li>
                        <li onclick="location.href='/middle'">
                            <div class="txt">중등학원</div>
                        </li>
                        <li onclick="location.href='/high'">
                            <div class="txt">고등학원</div>
                        </li>
                        <li onclick="location.href='/information'">
                            <div class="txt">입시정보</div>
                        </li>
                        <li onclick="location.href='/community'">
                            <div class="txt">커뮤니티</div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="sub01">
            <div class="inner">
                <div class="aca_name">강남대치학원</div>
                <section class="intro_section">
                    <div class="intro_wrap">
                        <div class="address_wrap">
                            <div class="tit"> 주소</div>
                            <div class="txt"> 서울특별시 강남구 도곡로 444<br><span>지번</span>서울특별시 강남구 대치동 1021 5층</div>
                        </div>
                        <div class="number_wrap">
                            <div class="tit">전화번호</div>
                            <div class="txt">02-555-4423</div>
                        </div>
                        <div class="category_wrap">
                            <div class="tit">분류</div>
                            <div class="txt">교육,학문 > 교습학원</div>
                        </div>
                        <div class="homepage_wrap">
                            <div class="tit">홈페이지</div>
                            <a href="http://mentorschool.co.kr/">
                                <div class="txt">http://mentorschool.co.kr/</div>
                            </a>
                        </div>
                    </div>
                    <div class="logo_box">
                        <div class="img">
                            <img src="/img/sub01_logo.png">
                        </div>
                    </div>
                </section>
                <section class="info_section">
                    <div class="gnb_wrap">
                        <ul>
                            <li class="gnb sel" onclick="tab(this)" id="1">
                                <div class="txt">상세 정보</div>
                            </li>
                            <li class="gnb" onclick="tab(this)" id="2">
                                <div class="txt">학원 소식</div>
                            </li>
                            <li class="gnb" onclick="tab(this)" id="3">
                                <div class="txt">학원 리뷰</div>
                            </li>
                            <li class="gnb" onclick="tab(this)" id="4">
                                <div class="txt">한줄 평가</div>
                            </li>
                        </ul>
                    </div>
                    <div id="tab1">
	                    <div class="txt_info">스스로 암기하는 것이 답! 하지만 스스로 암기하지 않는 것이 가장 큰 문제 입니다<br>
	멘토클리닉은 강의하는 수업이 아닙니다.학생이 스스로 암기하도록 도와주는 수업입니다</div>
	                    <div class="pic_info">
	                        <div class="tit_wrap">
	                            <div class="tit">사진정보</div>
	                            <div class="line"></div>
	                        </div>
	                        <div class="thums_box">
	                            <div id="bigPic">
	                                <div class="bigPic_wrap">
	                                    <div class="bigPic_img"></div>
	                                    <div class="bigPic_img"></div>
	                                    <div class="bigPic_img"></div>
	                                    <div class="bigPic_img"></div>
	                                    <div class="bigPic_img"></div>
	                                    <div class="bigPic_img"></div>
	                                    <div class="bigPic_img"></div>
	                                </div>
	                            </div>
	                            <ul id="thumbs" class="thumbs">
	                                <div class="thumbs_wrap">
	                                    <li class="item active" rel="1"></li>
	                                    <li class="item" rel="2"></li>
	                                    <li class="item" rel="3"></li>
	                                    <li class="item" rel="4"></li>
	                                    <li class="item" rel="5"></li>
	                                    <li class="item" rel="6"></li>
	                                    <li class="item" rel="7"></li>
	                                </div>
	                                <div class="arrow_wrap">
	                                    <div class="arrow up">
	                                        <img src="/img/arrow_up.png" onclick="up()">
	                                    </div>
	                                    <div class="arrow down">
	                                        <img src="/img/arrow_down.png" onclick="down()">
	                                    </div>
	                                </div>
	                            </ul>
	                        </div>
	                        <div class="tit_wrap road_wrap">
	                            <div class="tit">찾아가는길</div>
	                            <div class="line"></div>
	                        </div>
	                        <div class="map">
	                            <div class="naver_map" id="map"></div>
	
	                            <script type="text/javascript">
	                            var HOME_PATH = window.HOME_PATH || '.';
	                            var cityhall = new naver.maps.LatLng(37.497936, 127.0590851),
	                                map = new naver.maps.Map('map', {
	                                    center: cityhall,
	                                    zoom: 10
	                                }),
	                                marker = new naver.maps.Marker({
	                                    map: map,
	                                    position: cityhall
	                                });
	
	                            var contentString = [
	                                    '<div class="iw_inner">',
	                                    '<img src="'+ HOME_PATH +'/img/map_logo.png" width="200" height="28" alt="멘토클리닉" class="thumb" /><br />',
	                                    '</div>'
	                                ].join('');
	
	                            var infowindow = new naver.maps.InfoWindow({
	                                content: contentString,
	                                maxWidth: 200,
	                                backgroundColor: "#eee",
	                                borderColor: "#2db400",
	                                borderWidth: 2,
	                                anchorSize: new naver.maps.Size(30, 30),
	                                anchorSkew: true,
	                                anchorColor: "#eee",
	                                pixelOffset: new naver.maps.Point(70, 60)
	                            });
	
	                            naver.maps.Event.addListener(marker, "click", function(e) {
	                                if (infowindow.getMap()) {
	                                    infowindow.close();
	                                } else {
	                                    infowindow.open(map, marker);
	                                }
	                            });
	
	                            </script>
	                        </div>
	                        <div class="traffic_wrap">
	                            <div class="subway_wrap">
	                                <div class="tit">주변 지하철역</div>
	                                <div class="txt_wrap">
	                                    <div class="circle_wrap">
	                                        <div class="circle">2</div>
	                                        <div class="txt">2호선 (선릉역)</div>
	                                    </div>
	                                    <div class="circle_wrap">
	                                        <div class="circle">3</div>
	                                        <div class="txt">3호선 (대치역)</div>
	                                    </div>
	                                    <div class="circle_wrap">
	                                        <div class="circle">분당</div>
	                                        <div class="txt">분당선 (한티역)</div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="bus_wrap">
	                                <div class="tit">주변 버스정류장</div>
	                                <div class="txt_wrap">대치삼성아파트입구(23-223)
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                   	</div>
                   	<div id="tab2" style="display: none">asdfasdfasdfsa</div>
                   	<div id="tab3" style="display: none">dcc</div>
                   	<div id="tab4" style="display: none">ㄴㅁㅇㄻㄴㅇㄹ</div>
                </section>
            </div>
        </div>
        <footer>
            <div class="inner">
                <div class="logo" onclick="location.href='/'"><span >L</span>ogo</div>
                <div class="txt">주소 : 서울 강남구 테헤란로 407 EK타워 4층 미래로입시컨설팅대표이사 : 이혁진 
<br>상담시간 : 월 ~ 금 - 오전 10시 ~ 오후 9시 ( 점심시간 오전 11시 30분 ~ 오후 1시)   토 - 오전 10시 ~ 오후 5시
<br>Copyright(c) TS group. All Rights Reserved.</div>
            </div>
        </footer>
    </body>
    
    <script>
 		// 검색란에서 엔터입력
		$("#hsearch").keyup(function(txt){
			if(txt.keyCode==13){
	    		var search = $("#hsearch").val();
	    		if(search!=""){
		    		alert(search);
	    		}
			}
		});
		// 검색버튼 클릭
		function search(){
			var search = $("#hsearch").val();
			if(search!=""){
	    		alert($("#hsearch").val());
			}
		}
    	// 로그인
    	function login(){
    		// 회원가입 페이지로 이동
    		alert("login");
    	}
    	// 학원정보 탭
    	function tab(element){
    		// 탭 변경
    		var id = element.id;
    		var ar = new Array("1", "2", "3", "4");
    		for(var i=0; i<ar.length; i++){
    			if(ar[i]==id){
    				$("#tab"+id).show();
    				$("#"+id).prop("class", "gnb sel");
    			} else {
    				$("#tab"+ar[i]).hide();
    				$("#"+ar[i]).prop("class", "gnb");
    			}
    		}
    	}
    	// 사진 위 클릭
    	function up(){
    		alert("up");
    	}
    	// 사진 아래 클릭
    	function down(){
    		alert("down");
    	}
    </script>
    
</html>