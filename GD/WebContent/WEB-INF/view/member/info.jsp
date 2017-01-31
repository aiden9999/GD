<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            $(document).ready(function(){
                var selectTarget = $('.select_box select');
                
                    selectTarget.change(function(){
                        var select_name = $(this).children('option:selected').text();
                        $(this).siblings('label').text(select_name);
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
                    <c:if test="${login==null }">
	                    <div class="txt" onclick="login()">로그인</div>
                    </c:if>
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
        <div class="info_page">
            <div class="inner">
                <aside class="side_menu">
                    <ul>
                        <li class="sel" onclick="tab(1)" id="t1">
                            <span>회원 정보변경</span>
                        </li>
                        <li onclick="tab(2)" id="t2">
                            <span>나의 학원정보</span>
                        </li>
                        <li onclick="tab(3)" id="t3">
                            <span>나의 게시글</span>
                        </li>
                        <li onclick="tab(4)" id="t4">
                            <span>나의 댓글</span>
                        </li>
                        <li onclick="tab(5)" id="t5">
                            <span>회원탈퇴</span>
                        </li>
                    </ul>
                </aside>
                <div class="container" id="tab1">
                    <div class="tit">회원 정보변경</div>
                    <div class="welcome_wrap">
                        <div class="txt">${type }회원</div>
                        <div class="txt"><span>${login.ID }님</span> 환영합니다.</div>
                        <div class="txt1">회원 정보변경</div>
                    </div>
                    <div class="devide_wrap">
                        <div class="txt_wrap">
                            <div class="circle"></div>
                            <div class="txt">
                                <span class="txt1">회원등급</span>
                                <span class="txt2">${login.GRADE }</span>
                            </div>
                        </div>
                        <div class="txt_wrap">
                            <div class="circle"></div>
                            <div class="txt">
                                <span class="txt1">가입일</span>
                                <span class="txt2">${login.DAY }</span>
                            </div>
                        </div>
                        <div class="txt_wrap">
                            <div class="circle"></div>
                            <div class="txt">
                                <span class="txt1">최근방문일</span>
                                <span class="txt2">${lastVisit }</span>
                            </div>
                        </div>
                        <div class="txt_wrap">
                            <div class="circle"></div>
                            <div class="txt">
                                <span class="txt1">방문일수</span>
                                <span class="txt2">총 <span class="txt3">${visit.size() }</span>일</span>
                            </div>
                        </div>
                        <div class="txt_wrap">
                            <div class="circle"></div>
                            <div class="txt">
                                <span class="txt1">이번달 방문일</span>
                                <span class="txt2">총 <span class="txt3">${monthVisit.size() }</span>일</span>
                            </div>
                        </div>
                        <div class="txt_wrap">
                            <div class="circle"></div>
                            <div class="txt">
                                <span class="txt1">6개월간 포인트</span>
                                <span class="txt2"><span class="txt3">${point }</span></span>
                            </div>
                        </div>
                    </div>
                </div>
<!--                 <div id="tab2" style="display: none"></div> -->
				<div class="container" id="tab2" style="display: none">
                    <div class="tit">나의 학원정보</div>
                    <div class="bulletin_wrap">
                        <div class="bulletin_header">
                            <div class="bulletin_tit">
                                <div class="circle"></div>
                                <div class="txt">학원리뷰</div>
                            </div>
                            <div class="bulletin_date">
                                <span>작성일</span>
                            </div>
                        </div>
                        <div class="board_txt">
                            작성하신 글이 없습니다.
                        </div>
                    </div>
                    <div class="bulletin_wrap">
                        <div class="bulletin_header">
                            <div class="bulletin_tit">
                                <div class="circle"></div>
                                <div class="txt">한줄평가</div>
                            </div>
                            <div class="bulletin_date">
                                <span>작성일</span>
                            </div>
                        </div>
                        <div class="board_txt2">
                            <div class="board_tit2">
                                <div class="star_wrap">
                                    <div class="star">
                                        <img src="/img/main01_03_star.png">
                                    </div>
                                    <div class="star">
                                        <img src="/img/main01_03_star.png">
                                    </div>
                                    <div class="star">
                                        <img src="/img/main01_03_star.png">
                                    </div>
                                    <div class="star">
                                        <img src="/img/main01_03_star.png">
                                    </div>
                                    <div class="star">
                                        <img src="/img/main01_03_star1.png">
                                    </div>
                                </div>
                            </div>
                            <div class="txt">상담 잘 받았습니다.</div>
                            <div class="bulletin_date">
                                <span>2017-01-12</span>
                            </div>
                        </div>
                    </div>
                </div>
               	<div class="container" id="tab3" style="display: none">
                    <div class="tit">나의 게시글</div>
                    <div class="bulletin_wrap">
                        <div class="bulletin_header">
                            <div class="bulletin_tit">
                                <div class="circle"></div>
                                <div class="txt">수다방</div>
                            </div>
                            <div class="bulletin_date">
                                <span>작성일</span>
                            </div>
                        </div>
                        <div class="board_txt">
                            작성하신 글이 없습니다.
                        </div>
                    </div>
                    <div class="bulletin_wrap">
                        <div class="bulletin_header">
                            <div class="bulletin_tit">
                                <div class="circle"></div>
                                <div class="txt">고민상담</div>
                            </div>
                            <div class="bulletin_date">
                                <span>작성일</span>
                            </div>
                        </div>
                        <div class="board_txt">
                            <div class="board_tit">우리아이가 달라졌어요<span>(3)</span></div>
                            <div class="bulletin_date">
                                <span>2017-01-12</span>
                            </div>
                        </div>
                    </div>
                </div>
               	<div class="container" id='tab4' style="display: none">
                    <div class="tit">나의 댓글</div>
                    <div class="bulletin_wrap">
                        <div class="bulletin_header">
                            <div class="bulletin_tit">
                                <div class="circle"></div>
                                <div class="txt">수다방</div>
                            </div>
                            <div class="bulletin_date">
                                <span>작성일</span>
                            </div>
                        </div>
                        <div class="board_txt">
                            작성하신 글이 없습니다.
                        </div>
                    </div>
                    <div class="bulletin_wrap">
                        <div class="bulletin_header">
                            <div class="bulletin_tit">
                                <div class="circle"></div>
                                <div class="txt">고민상담</div>
                            </div>
                            <div class="bulletin_date">
                                <span>작성일</span>
                            </div>
                        </div>
                        <div class="board_txt">
                            <div class="board_tit">우리아이가 달라졌어요<span>(3)</span></div>
                            <div class="bulletin_date">
                                <span>2017-01-12</span>
                            </div>
                        </div>
                    </div>
                </div>
<!--                 <div id="tab5" style="display: none"></div> -->
            </div>
        </div>
        <footer class="info_footer">
            <div class="inner">
                <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                <div class="txt">주소 : 서울 강남구 테헤란로 407 EK타워 4층 미래로입시컨설팅대표이사 : 이혁진 
<br>상담시간 : 월 ~ 금 - 오전 10시 ~ 오후 9시 ( 점심시간 오전 11시 30분 ~ 오후 1시)   토 - 오전 10시 ~ 오후 5시
<br>Copyright(c) TS group. All Rights Reserved.</div>
            </div>
        </footer>
    </body>
    
    <script>
    	// 탭 클릭
    	function tab(num){
    		for(var i=1; i<=5; i++){
    			var x = document.getElementById("t"+i);
            	if(i==num){
            		if(x.className.indexOf("sel") == -1){
            			x.className += "sel";
            			$("#tab"+i).show();
            		}
            	} else {
            		x.className = x.className.replace("sel", "");
            		$("#tab"+i).hide();
            	}
    		}
    	}
    </script>
    
</html>