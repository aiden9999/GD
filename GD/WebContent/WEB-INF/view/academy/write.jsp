<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <div class="write01">
            <div class="inner">
                <div class="worry_tit">학원소식
                    <span class="txt">강남에서 대학가기</span>
                    <span class="txt1">학원소식 게시판 입니다.</span>
                </div>
                <div class="write_wrap">
                    <div class="write_section write_fir">
                        <div class="tit">제목</div>
                        <input type="text" id="title" style="width: 1000px" maxlength="70"/>
                    </div>
                    <div class="write_section write_sec">
                        <div class="write_name">
                            <div class="tit">작성자</div>
                            <div class="txt" id="writer">${login.NAME }</div>
                        </div>
                        <div class="write_date">
                            <div class="tit">작성일</div>
                            <jsp:useBean id="toDay" class="java.util.Date" />
                            <div class="txt"><fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" /></div>
                        </div>
                    </div>
                    <div class="write_txtarea">
                        <textarea placeholder="내용" style="resize: none" id="content"></textarea>
                    </div>
                </div>
                <div class="cannext_wrap">
                    <div class="btn cancel" onclick="history.go(-1)">취 소</div>
                    <div class="btn next" onclick="save()">등 록</div>
                </div>
            </div>
        </div>
        <footer>
            <c:import url="/WEB-INF/view/main/footer.jsp"/>
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
    	// 학원소식 저장
    	function save(){
    		var title = $("#title").val();
    		var content = $("#content").val();
    		$.ajax({
    			type : "post",
    			url : "/academy/saveNews/${login.ID }/${login.NAME }/"+title+"/"+content+"/${acaNum }",
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("등록되었습니다");
    					location.href="/academy/${acaNum}";
    				} else {
    					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요");
    				}
    			}
    		});
    	}
    </script>
    
</html>