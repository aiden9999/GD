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
        <div class="write01">
            <div class="inner">
                <div class="worry_tit">공지사항
                    <span class="txt">강남에서 대학가기</span>
                    <span class="txt1">공지사항 게시판 입니다.</span>
                </div>
                <div class="write_wrap">
                    <div class="write_section write_fir">
                        <div class="tit">제목</div>
                        <div class="txt">안녕하세요</div>
                    </div>
                    <div class="write_section write_sec">
                        <div class="write_name">
                            <div class="tit">작성자</div>
                            <div class="txt">${login.ID }</div>
                        </div>
                        <div class="write_date">
                            <div class="tit">작성일</div>
                            <div class="txt">2017.01.23</div>
                        </div>
                    </div>
                    <div class="write_txtarea">
                        <textarea placeholder="내용" style="resize: none" id="content"></textarea>
                    </div>
                </div>
                <div class="cannext_wrap">
                    <div class="btn cancel" onclick="location.href='/information'">취 소</div>
                    <div class="btn next" onclick="submit()">등 록</div>
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
      		// 회원가입 페이지로 이동
      		location.href="/join";
      	}
      	// 등록
      	function submit(){
//       		var id = ${login.ID };
      		var content = $("#content").val();
//       		$.ajax({
//       			type : "post",
//       			url : "/notice/write/"+id+"/"+content,
//       			async : false,
//       			success : function(txt){
//       				if(txt){
      					
//       				} else {
      					
//       				}
//       			}
//       		});
			alert(content);
      	}
    </script>
    
</html>