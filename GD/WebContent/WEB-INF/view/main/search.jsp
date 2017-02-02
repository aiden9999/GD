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
        <div class="search02">
            <div class="inner">
                <div class="search02_tit"><span>'${searchWord }'</span> 검색결과</div>
                <section class="info_section">
                    <div class="section_aca">
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
                                    <div class="arrow prev">
                                        <img src="/img/sub02_arrow_prev.png">
                                    </div>
                                    <div class="arrow next">
                                        <img src="/img/sub02_arrow_next.png">
                                    </div>
                                </div>
                                <div class="num_wrap">
                                	<c:forEach var="i" begin="1" end="${acaPage }">
                                		<c:choose>
                                			<c:when test="${i==1 }">
			                                    <div class="num sel"><span>${i }</span></div>
                                			</c:when>
                                			<c:otherwise>
			                                    <div class="num"><span>${i }</span></div>
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
                                	<option value="goHigh">고등입시</option>
                                	<option value="goUniv">대학입시</option>
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
	                                    <span>${t.WRITER }</span>
	                                </div>
	                                <div class="txt txt_date">
	                                    <span>${t.DAY }</span>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                        <div class="page_wrap">
                            <div class="inner">
                                <div class="arrow_wrap">
                                    <div class="arrow prev">
                                        <img src="/img/sub02_arrow_prev.png" onclick="prev()">
                                    </div>
                                    <div class="arrow next">
                                        <img src="/img/sub02_arrow_next.png" onclick="next()">
                                    </div>
                                </div>
                                <div class="num_wrap">
                                    <c:forEach var="i" begin="1" end="${noticePage }">
                                		<c:choose>
                                			<c:when test="${i==1 }">
			                                    <div class="num sel"><span>${i }</span></div>
                                			</c:when>
                                			<c:otherwise>
			                                    <div class="num"><span>${i }</span></div>
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
      			url : "/boardChange/"+board+"/${searchWord }",
      			async : false,
      			success : function(txt){
      				$("#boardList").html(txt);
      			}
      		});
      	});
      	
      	
      	
      	
     	// 페이지 클릭
   		var pageNum = new Array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
     	function page(num){
     		for(var i=0; i<pageNum.length; i++){
				var x = document.getElementById("page"+pageNum[i]);
     			if(pageNum[i]==num){
     				if(x.className.indexOf("sel") == -1){
     					x.className += " sel";
     				}
     			} else {
     				x.className = x.className.replace(" sel", "");
     			}
     		}
     	}
     	// 페이지 이전 클릭
     	function prev(element){
     		var id = element.id;
     		id = id.substring(id.indexOf('v')+1);
     		pageNum = new Array();
     		var html = ""
     		if(Number(id)==1){
     			return;
     		} else {
	     		for(var i=(Number(id)-10); i<Number(id); i++){
	     			if(i==(Number(id)-10)){
	     				html += "<div class='num sel' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
	     			} else {
	     				html += "<div class='num' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
	     			}
	     			pageNum[pageNum.length] = i;
	     		}
	     		$("#prev"+id).prop("id", "prev"+(Number(id)-10));
	     		$("#next"+id).prop("id", "next"+(Number(id)-10));
	     		$("#pages").html(html);
     		}
     	}
     	// 페이지 다음 클릭
     	function next(element){
     		var id = element.id;
     		id = id.substring(id.indexOf('t')+1);
     		pageNum = new Array();
     		var html = ""
     		for(var i=(Number(id)+10); i<(Number(id)+20); i++){
     			if(i==(Number(id)+10)){
     				html += "<div class='num sel' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
     			} else {
     				html += "<div class='num' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
     			}
     			pageNum[pageNum.length] = i;
     		}
     		$("#next"+id).prop("id", "next"+(Number(id)+10));
     		$("#prev"+id).prop("id", "prev"+(Number(id)+10));
     		$("#pages").html(html);
     	}
    </script>
    
</html>