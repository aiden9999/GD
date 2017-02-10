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
        <script src="js/common.js"></script>
        
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
        <div class="sub03">
            <div class="inner">
                <section class="notice_wrap">
                    <div class="notice_tit">고등입시</div>
                    <div class="notice_txt">
                        <span>강남에서 대학가기</span>
                        고등입시 게시판 입니다.
                    </div>
                </section>
                <section class="info_section" id="boardSection">
                    <div class="board_wrap">
                        <div class="txt_box">
                            <div class="tit txt_number">
                                <span>번호</span>
                            </div>
                            <div class="tit txt_tit">
                                <span>제목</span>
                            </div>
                            <div class="tit txt_name">
                                <span>작성자</span>
                            </div>
                            <div class="tit txt_date">
                                <span>작성일</span>
                            </div>
                        </div>
						<c:choose>
							<c:when test="${list.size()>0 }">
								<c:forEach var="i" begin="0" end="${list.size()-1 }">
									<div class="txt_box">
			                            <div class="txt txt_number">
			                            	<c:choose>
			                            		<c:when test="${list.get(i).AUTO<10 }">
					                                <span>0${list.get(i).AUTO }</span>
			                            		</c:when>
			                            		<c:otherwise>
					                                <span>${list.get(i).AUTO }</span>
			                            		</c:otherwise>
			                            	</c:choose>
			                            </div>
			                            <c:choose>
			                            	<c:when test="${login!=null }">
					                            <div onclick="select(${list.get(i).AUTO })" class="txt txt_tit">
					                                <span>${list.get(i).TITLE }</span>
					                            </div>
			                            	</c:when>
			                            	<c:otherwise>
					                            <div class="txt txt_tit">
					                                <span>${list.get(i).TITLE }</span>
					                            </div>
			                            	</c:otherwise>
			                            </c:choose>
			                            <div id="dropdown${i }" class="contents">
			                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(${i })"></div>
			                                <div class="drop_txt">${list.get(i).CONTENT }</div>
			                            </div>
			                            <div class="txt txt_name">
			                                <span>${list.get(i).WRITER }</span>
			                            </div>
			                            <div class="txt txt_date">
			                                <span>${list.get(i).DAY }</span>
			                            </div>
			                        </div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div align="center" style="margin: 20px"><label>등록된 글이 없습니다.</label></div>
							</c:otherwise>
						</c:choose>                        
                    </div>
                    <div class="write_wrap">
                        <div class="empty_box"></div>
                        <c:if test="${login.GRADE=='관리자' }">
                        	<div class="write_btn" onclick="wr()">
	                            <div class="txt">글쓰기</div>
                        	</div>
                       	</c:if>
                    </div>
                    <div class="page_wrap">
                        <div class="inner">
                            <div class="arrow_wrap">
                                <div class="arrow prev" onclick="prev(this)" id="prev1" style="display: none">
                                    <img src="/img/sub02_arrow_prev.png">
                                </div>
                                <div class="arrow next" onclick="next(this)" id="next1">
                                    <img src="/img/sub02_arrow_next.png">
                                </div>
                            </div>
                            <div class="num_wrap" id="pages" align="center" style="font-size: 0">
                                <c:forEach var="i" begin="1" end="${highPage>10 ? 10 : highpage }">
                            		<c:choose>
	                            		<c:when test="${i==1 }">
			                                <div class="num sel" onclick="page(${i })" id="page${i }" style="width: 33px"><span>${i }</span></div>
	                            		</c:when>
	                            		<c:otherwise>
			                                <div class="num" onclick="page(${i })" id="page${i }" style="width: 33px"><span>${i }</span></div>
	                            		</c:otherwise>
                            		</c:choose>
                            	</c:forEach>
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
	 	// 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${highPage } ? ${highPage } : start+9;
			if(start==1 && end<10){
				$("#prev"+start).hide();
				$("#next"+start).hide();
			} else {
				if(start==1){
		  			$("#prev"+start).hide();
		  			$("#next"+start).show();
		  		} else if(end>=${highPage }){
		  			$("#prev"+start).show();
		  			$("#next"+start).hide();
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
      	// 글 선택
      	function select(num) { 
      		location.href="/highExam/view/"+num;
         }
      	// 글 닫기
         function clo(num) {
             var x = document.getElementById("dropdown"+num);
             x.className = x.className.replace(" drop_show", "");
         }
      	// 페이지 클릭
   		function page(num){
     		$.ajax({
     			type : "post",
     			url : "/highExam/page/"+num,
     			async : false,
     			success : function(txt){
     				$("#boardSection").html(txt);
     			}
     		});
     	}
      	// 글쓰기
      	function wr(){
      		location.href="/highExam/write";
      	}
      	// 페이지 이전 클릭
      	function prev(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('v')+1);
      		var start = Number(id)-10;
      		var end = start+9>=${highPage } ? ${highPage } : start+9;
    		$("#next"+id).show();
      		if(start==1){
      			$("#prev"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='page("+i+")' id='page"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='page("+i+")' id='page"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#prev"+id).prop("id", "prev"+start);
      		$("#next"+id).prop("id", "next"+start);
      		$("#pages").html(html);
      	}
      	// 페이지 다음 클릭
      	function next(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('t')+1);
      		var start = Number(id)+10;
      		var end = start+9>=${highPage } ? ${highPage } : start+9;
   			$("#prev"+id).show();
      		if(end>=${highPage }){
      			$("#next"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='page("+i+")' id='page"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='page("+i+")' id='page"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#prev"+id).prop("id", "prev"+start);
      		$("#next"+id).prop("id", "next"+start);
      		$("#pages").html(html);
      	}
    </script>
    
</html>