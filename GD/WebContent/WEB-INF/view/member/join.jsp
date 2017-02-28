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
        <div class="join">
            <div class="inner">
                <div class="join_top">
                    <div class="logo" onclick="location.href='/'">
                    	<img src="/img/joinLogo.png" style="width: 204px; height: 58px"/>
                    </div>
                    <div class="login_wrap">
                        <div class="log_box">
                            <c:choose>
                           		<c:when test="${save!=null }">
                           			<!-- 아이디 저장 -->
                           			<div class="id"><input type="text" id="id" placeholder="아이디" maxlength="12" value="${save }"></div>
                           		</c:when>
                           		<c:otherwise>
                           			<!-- 기본 -->
	                                <div class="id"><input type="text" id="id" placeholder="아이디" maxlength="12"></div>
                           		</c:otherwise>
                           	</c:choose>
                        </div>
                        <div class="log_box">
                            <input type="password" id="pw" placeholder="비밀번호">
                        </div>
                        <div class="login_btn">
                            <div class="txt" onclick="login()">로그인</div>
                        </div>
                        <div align="center" style="display: none" id="loginFail">
                        	<font style="color: red; font-size:12px">아이디/비밀번호를 확인해주세요.</font>
                        </div>
                        <div class="idpw_search">
<!--                             <span onclick="searchId()">아이디 / 비밀번호 찾기</span> -->
                            <span onclick="javascript: alert('준비중입니다.')">아이디 / 비밀번호 찾기</span>
                        </div>
                        <div class="checks_wrap">
                            <div class="checks">
                                <c:choose>
                            		<c:when test="${save!=null }">
		                                <input type="checkbox" name="pre" value="save" id="save" checked="checked">
                            		</c:when>
                            		<c:otherwise>
                            			<input type="checkbox" name="pre" value="save" id="save">
                            		</c:otherwise>
                            	</c:choose>
                                <label for="save">아이디저장</label>
                            </div>
                            <div class="checks auto_login">
                                <input type="checkbox" id="auto" name="pre" value="auto">
                                <label for="auto">자동 로그인</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="join_bottom">
                    <div class="tit"><span>강남에서 대학가기 </span>회원가입</div>
                    <div class="join_type">
                        <div class="type_wrap">
<!--                             <div class="type" onclick="student()"> -->
                            <div class="type" onclick="javascript: alert('준비중입니다.')">
                                <div class="stu img"></div>
                                <div class="txt">
                                    <span>학생 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
<!--                             <div class="type" onclick="parent()"> -->
                            <div class="type" onclick="javascript: alert('준비중입니다.')">
                                <div class="par img"></div>
                                <div class="txt">
                                    <span>학부모 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
<!--                             <div class="type" onclick="teacher()"> -->
                            <div class="type" onclick="javascript: alert('준비중입니다.')">
                                <div class="tea img"></div>
                                <div class="txt">
                                    <span>선생님 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
<!--                             <div class="type" onclick="normal()"> -->
                            <div class="type" onclick="javascript: alert('준비중입니다.')">
                                <div class="per img"></div>
                                <div class="txt">
                                    <span>일반 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
<!--                             <div class="type" onclick="academy()"> -->
                            <div class="type" onclick="javascript: alert('준비중입니다.')">
                                <div class="aca img"></div>
                                <div class="txt">
                                    <span>학원 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
<!--                             <div class="type" onclick="school()"> -->
                            <div class="type" onclick="javascript: alert('준비중입니다.')">
                                <div class="sch img"></div>
                                <div class="txt">
                                    <span>학교/법인 회원가입</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <c:import url="/WEB-INF/view/main/footer.jsp"/>
        </footer>
        
        <div class="popup_cover" id="modal1" style="display: none"></div>
        <div class="popup_wrap search_popup school_popup" id="modal2" style="display: none">
            <div class="tit_wrap">
                <div class="tit">학교,학원/법인 가입안내</div>
                <div class="logo"><span >L</span>ogo</div>
            </div>
            <div class="txt_wrap">
                <div class="txt">
                    <span class="txt1">학교,학원/법인 가입
                    </span>은 고객센터로<br> 문의주시기 바랍니다.
                </div>
            </div>
            <div class="phone_wrap">
                <div class="img">
                    <img src="/img/phone.png">
                </div>
                <div class="txt">02-1234-4567</div>
            </div>
            <div class="close_btn" onclick="$('#modal1').hide(), $('#modal2').hide()">닫기</div>
        </div>
        
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
    		var id = $("#id").val();
    		var pw = $("#pw").val();
    		var auto = $("#auto").prop("checked");
    		var save = $("#save").prop("checked");
    		$.ajax({
    			type : "post",
    			url : "/login/"+id+"/"+pw+"/"+auto+"/"+save,
    			async : false,
    			success : function(txt){
    				if(txt){
    					location.href="/";
    					$("#loginFain").hide();
    				} else {
    					$("#loginFail").show();
    				}
    			}
    		});
    	}
    	// 비밀번호에서 엔터
    	$("#pw").keyup(function(txt){
    		if(txt.keyCode==13){
    			login();
    		}
    	});
    	// 자동로그인 클릭
    	$("#auto").change(function(){
    		if($("#auto").prop("checked")){
    			$("#save").prop("checked", false);
    		}
    	});
    	// 아이디/비밀번호 찾기
    	function searchId(){
    		location.href="/member/search";
    	}
    	// 학생
    	function student(){
    		location.href="/join/student";
//     		Frameset("/join/student");
    	}
    	// 학부모
    	function parent(){
    		location.href="/join/parent";
//     		Frameset("/join/parent");
    	}
    	// 선생님
    	function teacher(){
    		location.href="/join/teacher";
//     		Frameset("/join/teacher");
    	}
    	// 일반
    	function normal(){
    		location.href="/join/normal";
// 			Frameset("/join/normal");
    	}
    	// 학원
    	function academy(){
    		$("#modal1").show();
    		$("#modal2").show();
    	}
    	// 학교, 법인
    	function school(){
    		$("#modal1").show();
    		$("#modal2").show();
    	}
    	// 페이지 주소 숨김
//     	function Frameset(page) { 
// 			framecode = "<frameset rows='1*' id='join'>" 
// 			+ "<frame name=main src='" + page + "'>" 
// 			+ "</frameset>"; 
			
// 			document.write(framecode); 
// 			document.close(); 
// 		}
    </script>
    
</html>