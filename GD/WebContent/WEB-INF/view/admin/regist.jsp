<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/css/style.css" type="text/css">
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
        <title></title>
        
        <style>
            
        </style>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/common.js"></script>
    </head>
     
    <body>
        <header>
            <div class="header_top">
                <div class="inner">
                	<c:if test="${login==null }">
	                	<div class="txt" onclick="login()">로그인</div>
                	</c:if>
                    <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                    <div class="search">
                        <input type="text" id="hsearch" style="border: 2px solid #888f8d; height: 24px; " maxlength="10">
                        <img class="hsearch" src="/img/search.png" onclick="search()">
                    </div>
                </div>
            </div>
            <div class="gnb">
                <div class="inner">
                    <ul>
                        <li onclick="location.href='/elementary'" class="gnb_menu">
                            <div class="txt">초등학원</div>
                        </li>
						<li onclick="location.href='/middle'" class="gnb_menu">
                            <div class="txt">중등학원</div>
                        </li>
                        <li onclick="location.href='/high'" class="gnb_menu">
                            <div class="txt">고등학원</div>
                        </li>
                        <li class="gnb_menu">
                            <div class="txt">입시정보</div>
                            <ul>
                                <li class="drop_menu" onclick="location.href='/highExam'">
                                    <div class="txt1">고등입시</div>
                                </li>
                                <li class="drop_menu" onclick="location.href='/univExam'">
                                    <div class="txt1">대학입시</div>
                                </li>
                            </ul>
                        </li>
                        <li class="gnb_menu">
                            <div class="txt">커뮤니티</div>
                            <ul>
                                <li class="drop_menu" onclick="location.href='/waggle'">
                                    <div class="txt1">수다방</div>
                                </li>
                                <li class="drop_menu" onclick="location.href='/worry'">
                                    <div class="txt1">고민상담</div>
                                </li>
                                <li class="drop_menu" onclick="location.href='/notice'">
                                    <div class="txt1">공지사항</div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="join02">
            <div class="inner">
                <div class="prize_tit">
                    <div class="img">
                        <img src="/img/prize.png">
                    </div>
                    <div class="txt">학원등록</div>
                </div>
                <div class="save_section">
                    <div class="save_box save_name">
                        <div class="txt">학원이름</div>
                        <input type="text" id="save_name" placeholder="ex) 강남대치학원">
                    </div>
                    <div class="save_box save_address">
                        <div class="txt">학원주소</div>
                        <input type="text" id="save_address" placeholder="우편번호 클릭" readonly="readonly">
                        <div class="btn">우편번호</div>
                    </div>
                    <div class="save_box save_address1">
                        <div class="txt">상세주소</div>
                        <input type="text" id="save_address1" placeholder="ex) 3~5층">
                    </div>
                    <div class="save_box save_phone">
                        <div class="txt">학원 전화번호</div>
                        <input type="text" id="save_phone" placeholder="ex) 02-123-4567">
                    </div>
                    <div class="save_box save_sort">
                        <div class="txt">분류1</div>
                        <select>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="save_box save_sort save_sort1">
                        <div class="txt">분류2</div>
                        <select>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="save_box save_homepage">
                        <div class="txt">홈페이지주소</div>
                        <div class="txt1">http://</div>
                        <input type="text" id="save_homepage" placeholder="gogosky.co.kr">
                    </div>
                    <div class="save_box save_logo">
                        <div class="txt">학원로고</div>
                        <div class="btn">파일선택</div>
                        <div class="txt1">5mb 이하 파일을 선택해주세요. (373px x 186px 사이즈로 업로드 해주십시오.)</div>
                    </div>
                    <div class="save_box save_intro">
                        <div class="txt">학원 소개</div>
                        <textarea id="save_intro" placeholder="최대 500자 까지 가능합니다." maxlength="500" style="resize: none"></textarea>
                    </div>
                    <div class="save_box save_img">
                        <div class="txt">학원이미지</div>
                        <div class="plus_box">
                            <div class="plus_circle">
                                <div class="plus">+</div>
                            </div>
                        </div>
                        <div class="plus_box">
                            <div class="plus_circle">
                                <div class="plus">+</div>
                            </div>
                        </div>
                        <div class="plus_box">
                            <div class="plus_circle">
                                <div class="plus">+</div>
                            </div>
                        </div>
                        <div class="plus_box">
                            <div class="plus_circle">
                                <div class="plus">+</div>
                            </div>
                        </div>
                        <div class="plus_box">
                            <div class="plus_circle">
                                <div class="plus">+</div>
                            </div>
                        </div>
                        <div class="txt1">최소1장 ~ 최대5장 까지 등록 가능합니다. (795px x 510px 사이즈로 업로드 해주십시오.</div>
                    </div>
                    <div class="save_box save_target">
                        <div class="txt">수업대상</div>
                        <input type="text" id="save_target" placeholder="초등,중등,고등">
                    </div>
                    <div class="save_box save_subject">
                        <div class="txt">수업과목</div>
                        <input type="text" id="save_subject" placeholder="국어,영어,수학">
                    </div>
                    <div class="txt2">※사진을 업로드 하실때 위 사이즈가 아니면 화질이 깨지거나 사진이 늘어날 수 있습니다.※</div>
                </div>
                <div class="cannext_wrap">
                    <div class="btn cancel" onclick="history.back()">취 소</div>
                    <div class="btn next">등 록</div>
                </div>
            </div>
        </div>
        <footer>
            <div class="inner">
                <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
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
	    			location.href="/search/"+search;
	    		}
			}
		});
		// 검색버튼 클릭
		function search(){
			var search = $("#hsearch").val();
			if(search!=""){
				location.href="/search/"+search;
			}
		}
	  	// 로그인
	  	function login(){
	  		// 회원가입 페이지로 이동
	  		location.href="/join";
	  	}
    </script>
    
</html>