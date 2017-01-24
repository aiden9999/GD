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
                    <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                    <div class="search">
                        <input type="text" id="hsearch" style="border: 2px solid #888f8d; height: 24px; ">
                        <img class="hsearch" src="/img/search.png" onclick="search()">
                    </div>
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
        <div class="join">
            <div class="inner">
                <div class="join_top">
                    <div class="logo" onclick="location.href='/'"><label><span>L</span>ogo</label></div>
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
                            <span onclick="searchId()">아이디 / 비밀번호 찾기</span>
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
                            <div class="type" onclick="student()">
                                <div class="stu img"></div>
                                <div class="txt">
                                    <span>학생 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
                            <div class="type" onclick="parent()">
                                <div class="par img"></div>
                                <div class="txt">
                                    <span>학부모 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
                            <div class="type" onclick="teacher()">
                                <div class="tea img"></div>
                                <div class="txt">
                                    <span>선생님 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
                            <div class="type" onclick="normal()">
                                <div class="per img"></div>
                                <div class="txt">
                                    <span>일반 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
                            <div class="type" onclick="academy()">
                                <div class="aca img"></div>
                                <div class="txt">
                                    <span>학원 회원가입</span>
                                </div>
                            </div>
                        </div>
                        <div class="type_wrap">
                            <div class="type" onclick="school()">
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
    		alert("학원");
    	}
    	// 학교, 법인
    	function school(){
    		alert("학교/법인");
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