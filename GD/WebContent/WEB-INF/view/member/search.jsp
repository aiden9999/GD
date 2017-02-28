<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
		<link rel="stylesheet" href="/css/ggs_style.css" type="text/css">
		<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
			rel='stylesheet' type='text/css'>
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<meta name="robots" content="follow">
		<meta name="description"
			content="대치동수학학원 대치동영어학원 대치동과학학원 대치동논술학원 강남재수학원">
		<meta name="keywords" content="대치동수학학원 대치동영어학원 대치동과학학원 대치동논술학원 강남재수학원">
		<meta property="og:type" content="website">
		<meta property="og:title" content="강남에서 대학가기">
		<meta property="og:description" content="대치동수학학원 대치동영어학원 대치동과학학원 대치동논술학원 강남재수학원">
		<meta property="og:image" content="http://www.mysite.com/myimage.jpg">
		<meta property="og:url" content="http://www.gogosky.co.kr">
		<meta name="naver-site-verification" content="845557ce7747caed7b061d3a096c9396db155afd"/>
        <title></title>
        
        <style>
            
        </style>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/ggs_common.js"></script>
    </head>
     
    <body>
        <header>
			<c:import url="/WEB-INF/view/main/header.jsp"/>
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
            <c:import url="/WEB-INF/view/main/footer.jsp"/>
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
                <div class="logo">
					<img src="/img/loginLogo.png" style="width: 129px; height: 45px"/>
				</div>
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
	    	// 로그인
	     	function login(){
	     		// 회원가입 페이지로 이동
	     		location.href="/join";
	     	}
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