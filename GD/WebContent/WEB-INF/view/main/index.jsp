<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
        <script src="/socket/sockjs-0.3.4.js"></script>
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
                </div>
            </div>
            <div class="gnb">
                <div class="inner">
                    <ul>
<!--                         <li onclick="Frameset('/elementary')"> -->
                        <li onclick="location.href='/elementary'">
                            <div class="txt">초등학원</div>
                        </li>
<!--                         <li onclick="Frameset('/middle')"> -->
						<li onclick="location.href='/middle'">
                            <div class="txt">중등학원</div>
                        </li>
<!--                         <li onclick="Frameset('/high')"> -->
                        <li onclick="location.href='/high'">
                            <div class="txt">고등학원</div>
                        </li>
<!--                         <li onclick="Frameset('/information')"> -->
                        <li onclick="location.href='/information'">
                            <div class="txt">입시정보</div>
                        </li>
<!--                         <li onclick="Frameset('/community')"> -->
                        <li onclick="location.href='/community'">
                            <div class="txt">커뮤니티</div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="main">
            <div class="inner">
                <div class="contents">
                    <div class="main_slider">
                        <div class="main_slider_inner">
                            <div class="main_slide main_slide_sel">
                                <img src="/img/main_slide1.png">
                            </div>
                            <div class="main_slide">
                                <img src="/img/main_slide1.png">
                            </div>
                            <div class="main_slide">
                                <img src="/img/main_slide1.png">
                            </div>
                            <div class="main_slide">
                                <img src="/img/main_slide1.png">
                            </div>
                            <div class="main_slide">
                                <img src="/img/main_slide1.png">
                            </div>
                        </div>
                        <div class="circle_wrap">
                            <div class="slide_circle circle_sel"></div>
                            <div class="slide_circle"></div>
                            <div class="slide_circle"></div>
                            <div class="slide_circle"></div>
                            <div class="slide_circle"></div>
                        </div>
                    </div>
                    <div class="rec">
                        <div class="tit">
                            <div class="circle"></div>
                            <div class="txt">이달의 추천학원</div>
                        </div>
                        <div class="container">
                            <div class="sub_tit" id="recom">초등</div>
                            <div class="arrow_wrap">
                                <div class="arrow prev">
                                    <img src="/img/arrow_prev.png" onclick="prev()" id="recPrev" style="display: none">
                                </div>
                                <div class="arrow next">
                                    <img src="/img/arrow_next.png" onclick="next()" id="recNext">
                                </div>
                            </div>
                            <div class="rec_slider">
                                <div class="rec_slider_inner">
                                    <div class="rec_slide">
<!--                                         <div class="img" onclick="recomAcademy(${t.NUM })"></div> -->
                                        <div class="img" onclick="academy(this)"></div>
                                        <div class="txt" onclick="academy(this)">강남대치학원</div>
                                    </div>
                                    <div class="rec_slide">
                                        <div class="img" onclick="academy(this)"></div>
                                        <div class="txt" onclick="academy(this)">강남대치학원</div>
                                    </div>
                                    <div class="rec_slide">
                                        <div class="img" onclick="academy(this)"></div>
                                        <div class="txt" onclick="academy(this)">강남대치학원</div>
                                    </div>
                                    <div class="rec_slide">
                                        <div class="img" onclick="academy(this)"></div>
                                        <div class="txt" onclick="academy(this)">강남대치학원</div>
                                    </div>
                                    <div class="rec_slide">
                                        <div class="img" onclick="academy(this)"></div>
                                        <div class="txt" onclick="academy(this)">강남대치학원</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="info">
                        <div class="tit">
                            <div class="circle"></div>
                            <div class="txt">입시정보</div>
                        </div>
                        <div class="container">
                            <div class="txt_wrap">
                                <div class="dot"></div>
<!--                                 <div class="txt" onclick="information(${t.NUM })"> 2018학년도 수능 최저 등급 </div> -->
                                <div class="txt" onclick="information(this)"> 2018학년도 수능 최저 등급 </div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="information(this)"> 2018학년도 수능 최저 등급 2018학년도 수능 최저 등급</div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="information(this)"> 2018학년도 수능 최저 등급 2018학년도 수능 최저 등급 2018학년도 수능 최저 등급</div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="information(this)"> 2018학년도 수능 최저 등급 2018학년도 수능 최저 등급 </div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="information(this)"> 2018학년도 수능 최저 등급 </div>
                            </div>
                        </div>
                        <div class="choice">
                            <select id="grade">
                                <option value="first">1학년</option>
                                <option value="second">2학년</option>
                                <option value="third">3학년</option>
                            </select>
                            <select id="subject">
                                <option value="korean">국어</option>
                                <option value="english">영어</option>
                                <option value="math">수학</option>
                                <option value="social">사회</option>
                                <option value="science">과학</option>
                            </select>
                            <select id="total">
                                <option value="korean">국어</option>
                                <option value="english">영어</option>
                                <option value="math">수학</option>
                            </select>
                            <select id="align">
                                <option value="korean">국어</option>
                                <option value="english">영어</option>
                                <option value="math">수학</option>
                            </select>
                            <div class="search_box">
                                <div class="txt" onclick="searchAcademy()">검색</div>
                            </div>
                        </div>
                        <div class="info10 elem">
                            <div class="tit_wrap">
                                <div class="txt">초등학원</div>
                                <div class="underline"></div>
                            </div>
                            <c:forEach var="i" begin="1" end="3">
                            	<div class="academy big">
	                                <div class="number">${i }.</div>
	                                <div class="img_wrap">
<!-- 	                                    <div class="img" onclick="academy(${t.NUM })">학원 로고</div> -->
	                                    <div class="img" onclick="academy(this)">학원 로고</div>
	                                    <div class="name">강남대치학원 멘토클리닉</div>
	                                    <div class="sub">수업과목 : 전과목</div>
	                                </div>
	                            </div>
                            </c:forEach>
                            <c:forEach var="i" begin="4" end="5">
                            	<div class="academy mid">
	                                <div class="number">${i }.</div>
	                                <div class="img_wrap">
	                                    <div class="img" onclick="academy(this)">(로고) (학원명)</div>
	                                    <div class="sub">수업과목 : 전과목</div>
	                                </div>
	                            </div>
                            </c:forEach>
                             <c:forEach var="i" begin="6" end="10">
	                            <div class="academy low">
	                                <div class="number">${i }.</div>
	                                <div class="txt" onclick="academy(this)">강남대치학원 멘토클리닉</div>
	                            </div>
                            </c:forEach>
                        </div>
                        <div class="info10 mid">
                            <div class="tit_wrap">
                                <div class="txt">중등학원</div>
                                <div class="underline"></div>
                            </div>
                            <c:forEach var="i" begin="1" end="3">
                            	<div class="academy big">
	                                <div class="number">${i }.</div>
	                                <div class="img_wrap">
	                                    <div class="img" onclick="academy(this)">학원 로고</div>
	                                    <div class="name">강남대치학원 멘토클리닉</div>
	                                    <div class="sub">수업과목 : 전과목</div>
	                                </div>
	                            </div>
                            </c:forEach>
                            <c:forEach var="i" begin="4" end="5">
                            	<div class="academy mid">
	                                <div class="number">${i }.</div>
	                                <div class="img_wrap">
	                                    <div class="img" onclick="academy(this)">(로고) (학원명)</div>
	                                    <div class="sub">수업과목 : 전과목</div>
	                                </div>
	                            </div>
                            </c:forEach>
                            <c:forEach var="i" begin="6" end="10">
	                            <div class="academy low">
	                                <div class="number">${i }.</div>
	                                <div class="txt" onclick="academy(this)">강남대치학원 멘토클리닉</div>
	                            </div>
                            </c:forEach>
                        </div>
                        <div class="info10 high">
                            <div class="tit_wrap">
                                <div class="txt">고등학원</div>
                                <div class="underline"></div>
                            </div>
                           <c:forEach var="i" begin="1" end="3">
                            	<div class="academy big">
	                                <div class="number">${i }.</div>
	                                <div class="img_wrap">
	                                    <div class="img" onclick="academy(this)">학원 로고</div>
	                                    <div class="name">강남대치학원 멘토클리닉</div>
	                                    <div class="sub">수업과목 : 전과목</div>
	                                </div>
	                            </div>
                            </c:forEach>
                            <c:forEach var="i" begin="4" end="5">
                            	<div class="academy mid">
	                                <div class="number">${i }.</div>
	                                <div class="img_wrap">
	                                    <div class="img" onclick="academy(this)">(로고) (학원명)</div>
	                                    <div class="sub">수업과목 : 전과목</div>
	                                </div>
	                            </div>
                            </c:forEach>
                            <c:forEach var="i" begin="6" end="10">
	                            <div class="academy low">
	                                <div class="number">${i }.</div>
	                                <div class="txt" onclick="academy(this)">강남대치학원 멘토클리닉</div>
	                            </div>
                            </c:forEach>
                        </div>
                        </div>
                    </div>
                <aside>
                	<c:choose>
                		<c:when test="${login!=null }">
                			<div class="login_wrap login_on">
		                        <div class="login_section">
		                            <div class="greeting">
		                                <span>${login.NICK }</span>님 환영합니다.
		                            </div>
		                            <div class="member_wrap">
		                                <div class="member_inner">
		                                    <div class="trophy_wrap sub_box">
		                                        <div class="img">
		                                            <img src="img/trophy.png">
		                                        </div>
		                                        <c:choose>
		                                        	<c:when test="${login.GRADE=='관리자' }">
				                                        <div class="txt" onclick="location.href='/admin'">등급<span> ${login.GRADE }</span></div>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<div class="txt" style="cursor: default;">등급<span> ${login.GRADE }</span></div>
		                                        	</c:otherwise>
		                                        </c:choose>
		                                    </div>
		                                    <div class="point_wrap sub_box">
		                                        <div class="img">
		                                            <img src="img/point.png">
		                                        </div>
		                                        <div class="txt" onclick="point()">포인트<span> ${login.VISIT }p</span></div>
		                                    </div>
		                                    <div class="write_wrap sub_box">
		                                        <div class="img">
		                                            <img src="img/page.png">
		                                        </div>
		                                        <div class="txt" onclick="board()">내 글<span> 5</span></div>
		                                    </div>
		                                    <div class="reply_wrap sub_box">
		                                        <div class="img">
		                                            <img src="img/reply.png">
		                                        </div>
		                                        <div class="txt" onclick="reply()">내 댓글<span> 3</span></div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="logout_wrap">
		                                <div class="txt" onclick="info()">내 정보</div>
		                                <div class="txt" onclick="logout()">로그아웃</div>
		                            </div>
		                        </div>
		                    </div>
                		</c:when>
                		<c:otherwise>
                			<div class="login_wrap">
		                        <div class="logo"><span>L</span>ogo</div>
		                        <div class="login_box">
		                            <div class="id_box">
		                            	<c:choose>
		                            		<c:when test="${save!=null }">
		                            			<!-- 아이디 저장 -->
		                            			<div class="id"><input type="text" id="user_id" placeholder="아이디" maxlength="12" value="${save }"></div>
				                                <div class="id pw"><input type="password" id="pw" placeholder="비밀번호" maxlength="16"></div>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<!-- 기본 -->
				                                <div class="id"><input type="text" id="user_id" placeholder="아이디" maxlength="12"></div>
				                                <div class="id pw"><input type="password" id="pw" placeholder="비밀번호" maxlength="16"></div>
		                            		</c:otherwise>
		                            	</c:choose>
		                            </div>
		                            <div class="submit"><input type="button" value="로그인" onclick="login()"></div>
		                        </div>
		                        <div align="center" style="display: none" id="loginFail">
		                        	<font style="color: red; font-size:12px">아이디/비밀번호를 확인해주세요.</font>
		                        </div>
		                        <div class="txt_wrap">
		                            <div class="txt" onclick="searchId()">아이디/비밀번호찾기</div>
		                            <div class="txt" onclick="join()">회원가입</div>
		                        </div>
		                        <div class="check_box">
		                            <label class="check">
		                                <input type="checkbox" name="pre" value="auto" id="auto">
		                                <div class="txt">자동 로그인</div>
		                            </label>
		                            <label class="check">
		                            	<c:choose>
		                            		<c:when test="${save!=null }">
				                                <input type="checkbox" name="pre" value="save" id="save" checked="checked">
		                            		</c:when>
		                            		<c:otherwise>
		                            			<input type="checkbox" name="pre" value="save" id="save">
		                            		</c:otherwise>
		                            	</c:choose>
		                                <div class="txt">아이디 저장</div>
		                            </label>
		                        </div>
		                    </div>
                		</c:otherwise>
                	</c:choose>
                    <div class="board_wrap notice_wrap">
                        <div class="tit_wrap">
                            <div class="tit">
                                <div class="txt">공지사항</div>
                                <div class="img"><img src="/img/new.png"></div>
                            </div>
                            <div class="more" onclick="more('notice')">더보기+</div>
                        </div>
                        <div class="txt_box">
                            <div class="txt_wrap">
                                <div class="dot green"></div>
<!--                                 <div class="txt green" onclick="notice(${t.NUM })">11월 12일, 11월 19일 입시 -->
                                <div class="txt green" onclick="notice(this)"><label>11월 12일, 11월 19일 입시
                                    <br> 설명회 중등부12일 고등부 19일 ‥</label></div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="notice(this)"><label>2017년 겨울방학 특강 시간표</label></div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="notice(this)"><label>2017년 수능 고3 미적분1 + 확률통계
                                    수능 족집게 개념 강의</label></div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="notice(this)"><label>2017년 겨울방학 특강 시간표</label></div>
                            </div>
                        </div>
                    </div>
                    <div class="banner">
                        <img src="/img/banner1.png">
                    </div>
                    <div class="chat_wrap">
                        <div class="tit_wrap">
                            <div class="img"><img src="/img/talk.png"></div>
                            <div class="txt">실시간 채팅</div>
                        </div>
                        <div class="txt_box">
	                        <!-- 채팅창에 표시할때 내 아이디는 색 다르게 -->
                            <div class="txt" id="chat" style="max-height: 280px; overflow-y: auto"></div>
                        </div>
                        <div class="submit_wrap">
                           	<c:choose>
                           		<c:when test="${login==null }">
         		                   <div class="txt">
		                                <input type="text" id="txt" placeholder="채팅에 참여하시려면 로그인을 해주세요." maxlength="38" readonly="readonly">
		                            </div>
		                            <div class="submit">
		                                <input type="button" value="전송" disabled="disabled">
		                            </div>
                           		</c:when>
                           		<c:otherwise>
                           			<div class="txt">
		                                <input type="text" id="txt" placeholder="채팅을 입력하세요." maxlength="38" style="font-size: 12px">
		                            </div>
		                            <div class="submit">
		                                <input type="button" value="전송" onclick="send()">
		                            </div>
                           		</c:otherwise>
                           	</c:choose>
                        </div>
                    </div>
                    <div class="board_wrap chatter_wrap">
                        <div class="tit_wrap">
                            <div class="tit">
                                <div class="txt">자유 수다방</div>
                                <div class="img"><img src="/img/new1.png"></div>
                            </div>
                            <div class="more" onclick="more('waggle')">더보기+</div>
                        </div>
                        <div class="txt_box">
                            <div class="txt_wrap">
                                <div class="dot"></div>
<!--                                 <div class="txt" onclick="waggle(${t.NUM })">11월 12일, 11월 19일 입시 -->
                                <div class="txt" onclick="waggle(this)"><label>11월 12일, 11월 19일 입시
                                    <br> 설명회 중등부12일 고등부 19일 ‥</label></div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot green"></div>
                                <div class="txt green" onclick="waggle(this)"><label>2017년 겨울방학 특강 시간표</label></div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="waggle(this)"><label>2017년 수능 고3 미적분1 + 확률통계
                                    수능 족집게 개념 강의</label></div>
                            </div>
                            <div class="txt_wrap">
                                <div class="dot"></div>
                                <div class="txt" onclick="waggle(this)"><label>2017년 겨울방학 특강 시간표</label></div>
                            </div>
                        </div>
                    </div>
                    <div class="banner">
                        <img src="/img/banner2.png">
                    </div>
                    <div class="banner">
                        <img src="/img/banner3.png">
                    </div>
                </aside>
            </div>
        </div>
        <footer>
            <div class="inner">
                <div class="logo"><label onclick="location.href='/'"><span >L</span>ogo</label></div>
                <div class="txt">주소 : 서울 강남구 테헤란로 407 EK타워 4층 미래로입시컨설팅대표이사 : 이혁진 
<br>상담시간 : 월 ~ 금 - 오전 10시 ~ 오후 9시 ( 점심시간 오전 11시 30분 ~ 오후 1시)   토 - 오전 10시 ~ 오후 5시
<br>Copyright(c) TS group. All Rights Reserved.</div>
            </div>
        </footer>
    </body>
    
    <script>
    	// 홈페이지 접속시 웹소캣 서버 연결
//     	var socket;
//     	$(document).ready(function(){
//     		socket = new SockJS("/chatSocket/chatSocket");
//     		socket.onmessage = onMessage;
//     		socket.onclose = onClose;
//     	});
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
    	// 입시정보 글 클릭
    	function information(num){
    		// num을 가지고 입시정보 게시판 상세보기 페이지로 이동
    		alert(num.innerHTML);
    	}
    	// 학원 클릭
    	function academy(num){
    		// num을 가지고 해당학원 페이지로 이동
    		location.href="/academy/"+1;
    	}
    	// 학원 검색
    	function searchAcademy(){
    		var grade = $("#grade").val();
    		var subject = $("#subject").val();
    		var total = $("#total").val();
    		var align = $("#align").val();
    		alert(grade+"/"+subject+"/"+total+"/"+align);
    	}
    	// 로그인
    	function login(){
    		var id = $("#user_id").val();
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
    					$("#loginFail").hide();
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
    	// 회원가입
    	function join(){
    		location.href="/join";
    	}
    	// 로그아웃
    	function logout(){
    		location.href="/logout";
    	}
    	// 더보기
    	function more(txt){
    		if(txt=="notice"){
    			location.href="/information";
    		} else if(txt=="waggle"){
    			alert(txt);
    		}
    	}
    	// 채팅 전송
//     	function send(){
//     		var txt = $("#txt").val();
//     		if(txt!=""){
// 	    		socket.send(txt);
// 	    		$("#txt").val("");
// 	    		$("#chat").scrollTop(999999);
//     		}
//     	}
    	// 채팅창에서 엔터입력
//     	$("#txt").keyup(function(txt){
//     		if(txt.keyCode==13){
//     			if($("#txt").val()!=""){
// 	    			socket.send("${login.ID }~!@id#$%"+$("#txt").val());
// 	    			$("#txt").val("");
// 	    			$("#chat").scrollTop(999999);
//     			}
//     		}
//     	});
    	// 채팅창 키 누르고있을 때
//     	$("#txt").keypress(function(txt){
//     		if(txt.length>38){
//     			$("#txt").val(txt.substring(0, 38));
//     		}
//     	});
    	// 채팅 수신
//     	function onMessage(e){
//     		var html = $("#chat").html();
//     		if(html!=""){
//     			$("#chat").html(html+"<br/>"+e.data);
//     		} else {
// 	    		$("#chat").html(html+e.data);
//     		}
//     		$("#chat").scrollTop(999999);
//     	}
    	// 웹소켓 연결 종료
//     	function onClose(){
//     		console.log("연결 종료");
//     	}
    	// 공지사항
    	function notice(num){
    		alert(num.innerHTML);
    	}
    	// 자유 수다방
    	function waggle(num){
    		alert(num.innerHTML);
    	}
    	// 이전
    	function prev(){
    		var recom = $("#recom").html();
    		if(recom=="초등"){
	    		$("#recom").html("고등");
    			$("#recPrev").show();
    			$("#recNext").hide();
    		} else if(recom=="중등"){
    			$("#recom").html("초등");
	    		$("#recPrev").hide();
	    		$("#recNext").show();
    		} else {
    			$("#recom").html("중등");
    			$("#recPrev").show();
    			$("#recNext").show();
    		}
    	}
    	// 다음
    	function next(){
    		var recom = $("#recom").html();
    		if(recom=="초등"){
	    		$("#recom").html("중등");
	    		$("#recNext").show();
	    		$("#recPrev").show();
    		} else if(recom=="중등"){
    			$("#recom").html("고등");
    			$("#recNext").hide();
    			$("#recPrev").show();
    		} else {
    			$("#recom").html("초등");
    			$("#recNext").show();
    			$("#recPrev").hide();
    		}
    	}
    	// 포인트
    	function point(){
    		alert("point");
    	}
    	// 내 글
    	function board(){
    		alert("board");
    	}
    	// 내 댓글
    	function reply(){
    		alert("reply");
    	}
    	// 내정보
    	function info(){
    		location.href="/member/info/${login.ID }";
    	}
    	// 페이지 경로 숨기기
//     	function Frameset(page) { 
// 			framecode = "<frameset rows='1*'>" 
// 			+ "<frame name=main src='" + page + "'>" 
// 			+ "</frameset>"; 
			
// 			document.write(framecode); 
// 			document.close(); 
// 		}
    </script>
    
</html>