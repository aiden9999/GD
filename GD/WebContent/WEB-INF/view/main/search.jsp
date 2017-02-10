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
        <script>
            function select() { 
                var x =document.getElementById("dropdown");
                if (x.className.indexOf("drop_show") == -1) {
                    x.className += " drop_show";
                }
            }
            function clo() {
                var x = document.getElementById("dropdown");
                x.className = x.className.replace("drop_show", "");
            }
        </script>
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
                        <li onclick="location.href='/el'" class="gnb_menu">
                            <div class="txt">초등학원</div>
                        </li>
						<li onclick="location.href='/mi'" class="gnb_menu">
                            <div class="txt">중등학원</div>
                        </li>
                        <li onclick="location.href='/hi'" class="gnb_menu">
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
        <div class="search02">
            <div class="inner">
                <div class="search02_tit"><span>'${searchWord }'</span> 검색결과</div>
                <section class="info_section">
                    <div class="section_aca" id="acaSection">
                        <div class="aca_header">
                            <div class="circle"></div>
                            <div class="txt">학원</div>
                        </div>
                        <div class="txt_wrap">
                        	<c:forEach var="t" items="${academy }">
	                            <div class="txt" onclick="academy('${t.NUM }')"><span>${t.NAME }</span>(${t.SITE })</div>
                        	</c:forEach>
                        </div>
                        <div class="page_wrap">
                            <div class="inner">
                                <div class="arrow_wrap">
                                    <div class="arrow prev" onclick="acaPrev(this)" id="acaPrev1" style="display: none">
                                        <img src="/img/sub02_arrow_prev.png">
                                    </div>
                                    <div class="arrow next" onclick="acaNext(this)" id="acaNext1">
                                        <img src="/img/sub02_arrow_next.png">
                                    </div>
                                </div>
                                <div class="num_wrap" id="pages" align="center" style="font-size: 0">
                                	<c:forEach var="i" begin="1" end="${acaPage }">
                                		<c:choose>
                                			<c:when test="${i==1 }">
			                                    <div class="num sel" onclick="acaPage(${i})" id="acaPage${i }" style="width: 33px"><span>${i }</span></div>
                                			</c:when>
                                			<c:otherwise>
			                                    <div class="num" onclick="acaPage(${i})" id="acaPage${i }" style="width: 33px"><span>${i }</span></div>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section_board">
                        <div class="aca_header">
                            <div class="circle"></div>
                            <div class="txt">게시글</div>
                            <div class="drop_wrap" style="width: 150px; display: table; border: 0px">
                                <select id="boardSelect" style="width: 150px; padding: 4px; border: 1px solid #88b04b; font-size: 15px; -webkit-appearance: none;
                                												background: url(../img/sub02_arrow_down.png) no-repeat 95% 50% #fff;">
                                	<option value="notice">공지사항</option>
                                	<option value="highExam">고등입시</option>
                                	<option value="univExam">대학입시</option>
                                	<option value="worry">고민상담</option>
                                	<option value="waggle">수다방</option>
                                	<option value="acaNews">학원소식</option>
                                	<option value="acaComment">한줄평가</option>
                                </select>
                            </div>
                        </div>
                        <div class="board_wrap" id="boardList">
                            <div class="txt_box">
                                <div class="tit txt_number">
                                    <span>카테고리</span>
                                </div>
                                <div class="tit txt_tit">
                                    <span>제목</span>
                                </div>
                                <div class="tit txt_rec">
                                    <span>작성자</span>
                                </div>
                                <div class="tit txt_date">
                                    <span>작성일</span>
                                </div>
                            </div>
                            <c:forEach var="t" items="${notice }">
	                            <div class="txt_box">
	                                <div class="txt txt_number">
	                                    <div class="txt">공지사항</div>
	                                </div>
	                                <div class="txt txt_tit">
	                                    <span>${t.TITLE }</span>
	                                </div>
	                                <div class="txt txt_rec">
	                                    <span>${t.NAME }</span>
	                                </div>
	                                <div class="txt txt_date">
	                                    <span>${t.DAY }</span>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                        <div class="page_wrap"id="boardPages" align="center" style="font-size: 0">
                            <div class="inner" style="width: 420px">
                                <div class="arrow_wrap">
                                    <div class="arrow prev">
                                        <img src="/img/sub02_arrow_prev.png" onclick="boardPrev()" id="boardPrev1" style="display: none">
                                    </div>
                                    <div class="arrow next">
                                        <img src="/img/sub02_arrow_next.png" onclick="boardNext()" id="boardPrev1" style="display: none">
                                    </div>
                                </div>
                                <div class="num_wrap" id="boardPages2" align="center" style="font-size: 0; width: 350px">
                                    <c:forEach var="i" begin="1" end="${listPage>10 ? 10 : listPage }">
                                		<c:choose>
                                			<c:when test="${i==1 }">
			                                    <div class="num sel" onclick="boardPage(${i})" id="boardPage${i }" style="width: 33px"><span>${i }</span></div>
                                			</c:when>
                                			<c:otherwise>
			                                    <div class="num" onclick="boardPage(${i})" id="boardPage${i }" style="width: 33px"><span>${i }</span></div>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
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
		 // 학원 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${acaPage } ? ${acaPage } : start+9;
			if(start==1 && end<10){
				$("#acaPrev"+start).hide();
				$("#acaNext"+start).hide();
			} else {
				if(start==1){
		  			$("#acaPrev"+start).hide();
		  			$("#acaNext"+start).show();
		  		} else if(end>=${acaPage }){
		  			$("#acaPrev"+start).show();
		  			$("#acaNext"+start).hide();
		  		}
			}
		});
	 	// 게시판 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${listPage } ? ${listPage } : start+9;
			if(start==1 && end<10){
				$("#boardPrev"+start).hide();
				$("#boardNext"+start).hide();
			} else {
				if(start==1){
		  			$("#boardPrev"+start).hide();
		  			$("#boardNext"+start).show();
		  		} else if(end>=${listPage }){
		  			$("#boardPrev"+start).show();
		  			$("#boardNext"+start).hide();
		  		}
			}
		});
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
      	// 학원 클릭
      	function academy(num){
      		location.href="/academy/"+num;
      	}
      	// 게시판 선택
      	$("#boardSelect").change(function(){
      		var board = $("#boardSelect").val();
      		$.ajax({
      			type : "post",
      			url : "/search/boardChange/"+board+"/${searchWord }/1",
      			async : false,
      			success : function(txt){
      				$.ajax({
      					type : "post",
      					url : "/boardPage/"+board+"/${searchWord }/1",
      					async : false,
      					success : function(html){
		      				$("#boardList").html(txt);
		      				$("#boardPages").html(html);
      					}
      				});
      			}
      		});
      	});
      	// 학원 페이지 이동
      	function acaPage(num){
     		$.ajax({
     			type : "post",
     			url : "/search/acaPage/${searchWord }/"+num,
     			async : false,
     			success : function(txt){
     				$("#acaSection").html(txt);
     			}
     		});
     	}
      	// 게시판 페이지 이동
      	function boardPage(num){
      		var board = $("#boardSelect").val();
     		$.ajax({
     			type : "post",
     			url : "/search/boardList/${searchWord }/"+num+"/"+board,
     			async : false,
     			success : function(txt){
     				$.ajax({
     					type : "post",
     					url : "/search/boardPage/${searchWord }/"+num+"/"+board,
     					async : false,
     					success : function(html){
		     				$("#boardList").html(txt);
     						$("#boardPage").html(html);
     					}
     				});
     			}
     		});
     	}
   	  	// 학원 이전 클릭
      	function acaPrev(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('v')+1);
      		var start = Number(id)-10;
      		var end = start+9>=${acaPage } ? ${acaPage } : start+9;
    		$("#acaNext"+id).show();
      		if(start==1){
      			$("#acaPrev"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='acaPage("+i+")' id='acaPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='acaPage("+i+")' id='acaPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#acaPrev"+id).prop("id", "acaPrev"+start);
      		$("#acaNext"+id).prop("id", "acaNext"+start);
      		$("#acaPages").html(html);
      	}
      	// 학원 다음 클릭
      	function acaNext(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('t')+1);
      		var start = Number(id)+10;
      		var end = start+9>=${acaPage } ? ${acaPage } : start+9;
   			$("#acaPrev"+id).show();
      		if(end>=${acaPage }){
      			$("#acaNext"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='acaPage("+i+")' id='acaPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='acaPage("+i+")' id='acaPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#acaPrev"+id).prop("id", "acaPrev"+start);
      		$("#acaNext"+id).prop("id", "acaNext"+start);
      		$("#acaPages").html(html);
      	}
    	// 게시판 이전 클릭
      	function boardPrev(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('v')+1);
      		var start = Number(id)-10;
      		var end = start+9>=${listPage } ? ${listPage } : start+9;
    		$("#boardNext"+id).show();
      		if(start==1){
      			$("#boardPrev"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='boardPage("+i+")' id='boardPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='boardPage("+i+")' id='boardPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#boardPrev"+id).prop("id", "boardPrev"+start);
      		$("#boardNext"+id).prop("id", "boardNext"+start);
      		$("#boardPages2").html(html);
      	}
      	// 게시판 다음 클릭
      	function boardNext(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('t')+1);
      		var start = Number(id)+10;
      		var end = start+9>=${listPage } ? ${listPage } : start+9;
   			$("#boardPrev"+id).show();
      		if(end>=${listPage }){
      			$("#boardNext"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='boardPage("+i+")' id='boardPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='boardPage("+i+")' id='boardPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#boardPrev"+id).prop("id", "boardPrev"+start);
      		$("#boardNext"+id).prop("id", "boardNext"+start);
      		$("#boardPages2").html(html);
      	}
    </script>
    
</html>