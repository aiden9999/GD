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
        <script src="js/ggs_common.js"></script>
        
    </head>
     
    <body>
        <header>
			<c:import url="/WEB-INF/view/main/header.jsp"/>
		</header>
        <div class="sub03">
            <div class="inner">
                <section class="notice_wrap">
                    <div class="notice_tit">대학입시</div>
                    <div class="notice_txt">
                        <span>강남에서 대학가기</span>
                        대학입시 게시판 입니다.
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
			                            <div onclick="select(${list.get(i).AUTO })" class="txt txt_tit">
			                                <span>${list.get(i).TITLE }</span>
			                            </div>
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
                        <c:if test="${login.ADMIN=='메인관리자' }">
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
                            <div class="num_wrap" id="pages" align="center">
                                <c:forEach var="i" begin="1" end="${univPage>10 ? 10 : univPage }">
                            		<c:choose>
	                            		<c:when test="${i==1 }">
			                                <div class="num sel" onclick="page(${i })" id="page${i }"><span>${i }</span></div>
	                            		</c:when>
	                            		<c:otherwise>
			                                <div class="num" onclick="page(${i })" id="page${i }"><span>${i }</span></div>
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
            <c:import url="/WEB-INF/view/main/footer.jsp"/>
        </footer>
    </body>
    
    <script>
    	// 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${univPage } ? ${univPage } : start+9;
			if(start==end && end>10){
				$("#prev"+start).show();
				$("#next"+start).hide();
			} else {
				if(start==1 && end<=10){
					$("#prev"+start).hide();
					$("#next"+start).hide();
				} else {
					if(start==1){
			  			$("#prev"+start).hide();
			  			$("#next"+start).show();
			  		} else if(end>=${univPage }){
			  			$("#prev"+start).show();
			  			$("#next"+start).hide();
			  		}
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
      		if(${login == null}){
      			alert("로그인 후 이용할 수 있습니다..");
      			location.href="/join";
      		} else {
	      		location.href="/univExam/view/"+num;
      		}
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
     			url : "/univExam/page/"+num,
     			async : false,
     			success : function(txt){
     				$("#boardSection").html(txt);
     			}
     		});
      	}
      	// 글쓰기
      	function wr(){
      		location.href="/univExam/write";
      	}
  	   // 페이지 이전 클릭
      	function prev(element){
      		var id = element.id;
      		id = id.substring(id.indexOf('v')+1);
      		var start = Number(id)-10;
      		var end = start+9>=${univPage } ? ${univPage } : start+9;
    		$("#next"+id).show();
      		if(start==1){
      			$("#prev"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
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
      		var end = start+9>=${univPage } ? ${univPage } : start+9;
   			$("#prev"+id).show();
      		if(end>=${univPage }){
      			$("#next"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='page("+i+")' id='page"+i+"'><span>"+i+"</span></div>";
      			}
      		}
      		$("#prev"+id).prop("id", "prev"+start);
      		$("#next"+id).prop("id", "next"+start);
      		$("#pages").html(html);
      	}
    </script>
    
</html>