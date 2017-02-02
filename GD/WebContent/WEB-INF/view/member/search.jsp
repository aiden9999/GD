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
        <div class="search">
            <div class="inner">
                <div class="id_wrap">
                    <div class="tit">아이디 찾기</div>
                    <div class="line"></div>
                    <div class="input_wrap">
                        <div class="input">
                            <input type="text" id="name" placeholder="이름 ex) 홍길동">
                        </div>
                        <div class="input">
                            <input type="text" id="phone" placeholder="휴대폰번호 ex) 010-1234-5678">
                        </div>
                    </div>
                    <div class="btn">
                        <div class="txt" onclick="idSearch()">확인</div>
                    </div>
                </div>
                <div class="pw_wrap">
                    <div class="tit">비밀번호 찾기</div>
                    <div class="line"></div>
                    <div class="btn">
                        <div class="txt" onclick="pwSearch()">휴대폰 인증</div>
                    </div>
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
        
	    <!-- 아이디 찾기 팝업 -->
	    <div class="popup_cover" style="display: none" id="idpop"></div>
	    <div class="popup_wrap search_popup" style="display: none" id="idpop2">
	    </div>
	    
	    <!-- 비밀번호찾기 팝업 -->
	    <div class="popup_cover" style="display: none" id="pwpop"></div>
        <div class="popup_wrap search_popup pwsearch_popup" style="display: none" id="pwpop2">
            <div class="tit_wrap">
                <div class="tit">비밀번호 찾기</div>
                <div class="logo"><label><span >L</span>ogo</label></div>
            </div>
            <div class="intro_txt">
                비밀번호 찾기는 본인인증 후 이용할 수 있습니다.<br>
                본인인증이 완료되면 아래에 입력하신 핸드폰으로 임시 비밀번호가 전송됩니다.
            </div>
            <div class="input_wrap">
                <div class="input_box">
                    <div class="input_txt">아이디</div>
                    <input type="text" id="pw_id">
                </div>
                <div class="input_box">
                    <div class="input_txt">이름</div>
                    <input type="text" id="pw_name">
                </div>
            </div>
            <div class="phone_wrap" onclick="certification()">
                <div class="inner">
                    <div class="img"><img src="/img/join01_01_phone.png"></div>
                    <div class="txt">휴대폰 인증하기</div>
                </div>
            </div>
            <div class="close_btn" onclick="$('#pwpop').hide(), $('#pwpop2').hide(), $('#pw_id').val(''), $('#pw_name').val('')">닫기</div>
        </div>
    
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
	    	// 핸드폰번호 입력에서 엔터
	    	$("#phone").keyup(function(txt){
	    		if(txt.keyCode==13){
	    			idSearch();
	    		}
	    	});
	    	// 아이디 찾기
	    	function idSearch(){
	    		var name = $("#name").val();
	    		var phone = $("#phone").val();
	    		if(name!="" && phone!=""){
	    			$.ajax({
	    				type : "post",
	    				url : "/member/searchId/"+name+"/"+phone,
	    				async : false,
	    				success : function(txt){
				    		$("#idpop").show();
				    		$("#idpop2").show();
				    		$("#idpop2").html(txt);
				    		$("#pwpop").hide();
				    		$("#pwpop2").hide();
	    				}
	    			});
	    		} else {
	    			alert("이름 / 휴대폰번호를 입력해주세요.");
	    		}
	    	}
	    	// 비밀번호 찾기
	    	function pwSearch(){
	    		$("#idpop").hide();
	    		$("#idpop2").hide();
	    		$("#pwpop").show();
	    		$("#pwpop2").show();
	    	}
	    	// 이름 입력에서 엔터
	    	$("#pw_name").keyup(function(txt){
	    		if(txt.keyCode==13){
	    			certification();
	    		}
	    	});
	    	// 본인인증
	    	function certification(){
	    		var id = $("#pw_id").val();
	    		var name = $("#pw_name").val();
	    		if(id!="" && name!=""){
	    			$.ajax({
	    				type : "post",
	    				url : "/member/searchPw/"+id+"/"+name,
	    				async : false,
	    				success : function(txt){
	    					if(txt){
					    		alert("인증");
	    					} else {
	    						alert("입력하신 정보화 일치하는 회원이 없습니다.");
	    					}
	    				}
	    			});
	    		} else {
	    			alert("아이디 / 이름을 입력해주세요.");
	    		}
	    	}
	    </script>
        
    </body>
</html>