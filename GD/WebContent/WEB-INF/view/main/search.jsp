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
            function myFunction() { 
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
                    <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                    <div class="search">
                        <input type="text" id="hsearch" style="border: 2px solid #888f8d; height: 24px; " maxlength="10">
                        <img class="hsearch" src="/img/search.png" onclick="search()">
                    </div>
                    <c:if test="${login==null }">
	                    <div class="txt" onclick="login()">로그인</div>
                    </c:if>
                </div>
            </div>
            <div class="gnb">
                <div class="inner">
                    <ul>
                        <li>
                            <div class="txt">초등학원</div>
                        </li>
                        <li>
                            <div class="txt">중등학원</div>
                        </li>
                        <li>
                            <div class="txt">고등학원</div>
                        </li>
                        <li>
                            <div class="txt">입시정보</div>
                        </li>
                        <li>
                            <div class="txt">커뮤니티</div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="search02">
            <div class="inner">
                <div class="search02_tit"><span>'멘토'</span> 검색결과</div>
                <section class="info_section">
                    <div class="section_aca">
                        <div class="aca_header">
                            <div class="circle"></div>
                            <div class="txt">학원</div>
                        </div>
                        <div class="txt_wrap">
                            <div class="txt"><span>멘토</span>(www.mento.com)</div>
                            <div class="txt"><span>멘토클리닉</span>(www.mentoccc.co.kr)</div>
                            <div class="txt"><span>강남대치학원 멘토클리닉</span>(www.mentorschool.co.kr)</div>
                            <div class="txt"><span>강남대치학원 멘토클리닉</span>(www.mentorschool.co.kr)</div>
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
                                    <div class="num sel"><span>1</span></div>
                                    <div class="num"><span>2</span></div>
                                    <div class="num"><span>3</span></div>
                                    <div class="num"><span>4</span></div>
                                    <div class="num"><span>5</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section_board">
                        <div class="aca_header">
                            <div class="circle"></div>
                            <div class="txt">게시글</div>
                            <div class="drop_wrap">
                                <div class="img">
                                    <img src="/img/sub02_arrow_up.png" onclick="clo(1)">
                                </div>
                                <div onclick="myFunction()" class="txt">
                                    최신순
                                </div>
                                <div id="dropdown" class="contents">
                                    <div class="drop_txt">최신순</div>
                                    <div class="drop_txt">수다방</div>
                                    <div class="drop_txt">고민상담</div>
                                    <div class="drop_txt">학원리뷰</div>
                                    <div class="drop_txt">한줄평가</div>
                                </div>
                            </div>
                        </div>
                        <div class="board_wrap">
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
                            <c:forEach var="i" begin="1" end="4">
	                            <div class="txt_box">
	                                <div class="txt txt_number">
	                                    <div class="txt">한줄평가</div>
	                                </div>
	                                <div class="txt txt_tit">
	                                    <span>안녕하세요 대치동 학원정보는 MATH SCHOOL</span>
	                                </div>
	                                <div class="txt txt_rec">
	                                    <span>tjfdk</span>
	                                </div>
	                                <div class="txt txt_date">
	                                    <span>2017-01-17</span>
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
                                    <div class="num sel"><span>1</span></div>
                                    <div class="num"><span>2</span></div>
                                    <div class="num"><span>3</span></div>
                                    <div class="num"><span>4</span></div>
                                    <div class="num"><span>5</span></div>
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
      		// 회원가입 페이지로 이동
      		location.href="/join";
      	}
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