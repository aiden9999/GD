<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
        <div class="worry">
            <div class="inner" id="waggleList">
                <div class="worry_tit">수다방
                    <span class="txt">강남에서 대학가기</span>
                    <span class="txt1">자유수다방 입니다.</span>
                </div>
                <div class="worry_txtarea">
                    <div class="inner">
                    	<c:choose>
                    		<c:when test="${login!=null }">
		                        <textarea placeholder="(수다방 글쓰기)" style="resize: none" id="waggle"></textarea>
		                        <div class="btn" onclick="submit()">등록</div>
                    		</c:when>
                    		<c:otherwise>
                    			<textarea placeholder="(로그인 후 이용할 수 있습니다.)" style="resize: none" readonly="readonly"></textarea>
                    			<div class="btn">등록</div>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
                <c:choose>
	                <c:when test="${waggleList.size()>0 }">
		                <c:forEach var="i" begin="0" end="${waggleList.size()-1 }">
			                <div class="worry_txt_wrap">
			                	<c:choose>
			                		<c:when test="${waggleList.get(i).CONTENT.length()>40 }">
					                    <div class="content"><label onclick="select(${i })" style="cursor: pointer;">
					                    <font style="color: #88b04b; font-size: 15px; font-weight: bold;">
					                    ${waggleList.get(i).CONTENT.substring(0, 40) } ......
					                    </font></label></div>
			                		</c:when>
			                		<c:otherwise>
			                			<div class="content"><label onclick="select(${i })" style="cursor: pointer;">
			                			<font style="color: #88b04b; font-size: 15px; font-weight: bold;">
					                    ${waggleList.get(i).CONTENT }
					                    </font></label></div>
			                		</c:otherwise>
			                	</c:choose>
			                    <div class="name">${waggleList.get(i).NAME } (${waggleList.get(i).WRITER })</div>
			                    <div class="date">
			                        <span class="txt1">${waggleList.get(i).DAY } |</span>
			                        <span class="txt3" style="cursor: default;"><font style="color: black; font-size: 13px; font-weight: normal">댓글 (${waggleList.get(i).REPLY })</font></span>
			                        <div id="dropdown${i }" class="contents">
			                            <div class="img">
			                                <img src="/img/sub02_arrow_up.png" onclick="clo(${i })">
			                            </div>
			                            <div class="txt_section">${waggleList.get(i).CONTENT }</div>
			                            <div class="reply_section">
			                                <div class="reply_input">
			                                	<c:choose>
			                                		<c:when test="${login!=null }">
					                                    <input type="text" id="reply${waggleList.get(i).AUTO }" name="reply">
					                                    <div class="btn" onclick="replySubmit(${waggleList.get(i).AUTO })">등록</div>
			                                		</c:when>
			                                		<c:otherwise>
					                                    <input type="text" id="reply${waggleList.get(i).AUTO }" name="reply"
					                                    		readonly="readonly" placeholder="(로그인 후 이용할 수 있습니다.)">
					                                    <div class="btn">등록</div>
			                                		</c:otherwise>
			                                	</c:choose>
			                                </div>
			                                <c:if test="${replyList.size()>0 }">
				                                <c:forEach var="j" begin="0" end="${replyList.size()-1 }">
				                                	<c:if test="${waggleList.get(i).AUTO == replyList.get(j).NUM }">
						                                <div class="reply_old">
						                                    <div class="header">
						                                        <div class="header_name">${replyList.get(j).NAME } (${replyList.get(j).ID })</div>
						                                        <div class="header_date">${replyList.get(j).DAY }</div>
						                                    </div>
						                                    <div class="reply_content">${replyList.get(j).REPLY }</div>
						                                </div>
				                                	</c:if>
				                                </c:forEach>
			                                </c:if>
			                            </div>
			                        </div>
			                    </div>
			                </div>
		                </c:forEach>
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
		                            <c:forEach var="i" begin="1" end="${wagglePage }">
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
		                <div class="search_wrap">
		                    <div class="name_search">
		                        <select id="replySearch">
		                            <option value="writer">작성자</option>
		                            <option value="reply">내용</option>
		                        </select>
		                        <div class="input">
		                            <input type="text" id="search">
		                        </div>
		                        <div class="btn">
		                            <img src="/img/search1.png" onclick="searchwaggle()">
		                        </div>
		                    </div>
		                </div>
	                </c:when>
	                <c:otherwise>
	                	<div align="center" style="margin-bottom: 30px">
							<label>검색된 고민이 없습니다.</label>
						</div>
	                </c:otherwise>
                </c:choose>
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
     	// 글 선택
     	function select(num) { 
            for(var i=0; i<10; i++){
            	var x = document.getElementById("dropdown"+i);
            	if(i==num){
            		if(x.className.indexOf("drop_show") == -1){
            			x.className += " drop_show";
            		} else {
            			x.className = x.className.replace(" drop_show", "");
            		}
            	} else {
            		x.className = x.className.replace(" drop_show", "");
            	}
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
     			url : "/waggle/page/"+num,
     			async : false,
     			success : function(txt){
     				$("#waggleList").html(txt);
     			}
     		});
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
     	// 수다 등록
     	function submit(){
     		var waggle = $("#waggle").val();
     		$.ajax({
     			type : "post",
     			url : "/waggle/write/${login.ID }/${login.NAME }/"+waggle,
     			async : false,
     			success : function(txt){
     				if(txt){
     					alert("등록되었습니다.");
     					location.reload();
     				} else {
     					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
     				}
     			}
     		});
     	}
     	// 리플 등록
     	function replySubmit(num){
     		var reply = $("#reply"+num).val();
     		$.ajax({
     			type : "post",
     			url : "waggle/reply/${login.ID }/${login.NAME }/"+reply+"/"+num,
     			async : false,
     			success : function(txt){
     				if(txt){
     					alert("등록되었습니다.");
     					location.reload();
     				} else {
     					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
     				}
     			}
     		});
     	}
     	// 글 검색
     	function searchwaggle(){
     		var search = $("#replySearch").val();
     		var word = $("#search").val();
     		if(word!=""){
	     		$.ajax({
	     			type : "post",
	     			url : "/waggle/search/"+search+"/"+word+"/1",
	     			async : false,
	     			success : function(txt){
	     				$("#waggleList").html(txt);
	     			}
	     		});
     		}
     	}
     	// 글 검색창에서 엔터
     	$("#search").keyup(function(txt){
			if($("#search").val()!=""){
	     		if(txt.keyCode==13){
	     			searchwaggle();
	     		}
			}
     	});
    </script>
    
</html>