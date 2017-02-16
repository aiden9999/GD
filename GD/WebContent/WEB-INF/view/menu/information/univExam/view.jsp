<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    	<div class="popup_cover" id="removeDiv" style="display: none"></div>
        <div class="popup_wrap search_popup school_popup popup_close" id="removeDiv1" style="display: none">
            <div class="tit_wrap">
                <div class="logo"><span >L</span>ogo</div>
            </div>
            <div class="txt">
                정말 삭제하시겠습니까?
            </div>
            <div class="close_btn_wrap">
                <div class="close_btn left" onclick="$('#removeDiv').hide(), $('#removeDiv1').hide()">아니오</div>
                <div class="close_btn right" onclick="commit()">네</div>
            </div>
        </div>
        <header>
			<div class="header_top">
				<div class="inner">
	               	<c:if test="${login==null }">
	                	<div class="txt" onclick="login()">로그인</div>
	               	</c:if>
					<div class="logo" onclick="location.href='/'">
						<label><span>L</span>ogo</label>
					</div>
					<div class="search">
						<input type="text" id="hsearch"
							style="border: 2px solid #888f8d; height: 24px;" maxlength="10">
						<img class="hsearch" src="/img/search.png" onclick="search()">
					</div>
				</div>
			</div>
			<div class="gnb">
				<div class="inner">
					<ul>
						<li onclick="location.href='/초등'" class="gnb_menu" id="menuEle" style="width: 16.5%">
							<div class="txt">초등학원</div>
						</li>
						<li onclick="location.href='/중등'" class="gnb_menu" id="menuMid" style="width: 16.5%">
							<div class="txt">중등학원</div>
						</li>
						<li onclick="location.href='/고등'" class="gnb_menu" id="menuHig" style="width: 16.5%">
							<div class="txt">고등학원</div>
						</li>
						<li onclick="location.href='/재수'" class="gnb_menu" id="menujesu" style="width: 16.5%">
							<div class="txt">재수학원</div>
						</li>
						<li class="gnb_menu" style="width: 16.5%">
							<div class="txt">입시정보</div>
							<ul style="width: 16.5%">
								<li class="drop_menu" onclick="location.href='/highExam'">
									<div class="txt1">고등입시</div>
								</li>
								<li class="drop_menu" onclick="location.href='/univExam'">
									<div class="txt1">대학입시</div>
								</li>
							</ul>
						</li>
						<li class="gnb_menu" style="width: 16.5%">
							<div class="txt">커뮤니티</div>
							<ul style="width: 16.5%">
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
        <div class="write01">
            <div class="inner">
                <div class="worry_tit">대학입시
                    <span class="txt">강남에서 대학가기</span>
                    <span class="txt1">대학입시 게시판 입니다.</span>
                </div>
                <div class="write_wrap">
                    <div class="write_section write_fir">
                        <div class="tit">제목</div>
                        <div class="txt txt2" id="titleTxt">${map.TITLE }</div>
                        <div class="txt txt2" style="width: 1100px; height: 35px; padding-left: 60px">
                        	<input type="text" id="title" style="width: 1000px; display: none" maxlength="70" value="${map.TITLE }"/>
                        </div>
                    </div>
                    <div class="write_section write_sec">
                        <div class="write_name">
                            <div class="tit">작성자</div>
                            <div class="txt">${map.NAME }</div>
                        </div>
                        <div class="write_date">
                            <div class="tit">작성일</div>
                            <div class="txt">${map.DAY }</div>
                        </div>
                    </div>
                    <div class="write_txtarea">
                    	<div class="txt" id="contentTxt">${map.CONTENT }</div>
                        <textarea placeholder="내용" style="resize: none; display: none" id="content">${map.CONTENT }</textarea>
                    </div>
                </div>
                <div class="cannext_wrap" style="width: 320px" align="center">
                	<c:choose>
	                	<c:when test="${login.ID == map.WRITER }">
		                    <div class="btn cancel" onclick="modify()" id="modify">수 정</div>
		                    <div class="btn next" onclick="remov()" id="remov" style="float: none;">삭 제</div>
		                    <div class="btn cancel" onclick="cancel()" id="cancel" style="display: none">취 소</div>
		                    <div class="btn next" onclick="save()" id="save" style="display: none; float: none;">저 장</div>
		                    <div class="btn cancel" onclick="location.href='/univExam'" style="float: right">목록으로</div>
	                	</c:when>
	                	<c:otherwise>
	                		<div class="btn cancel" onclick="location.href='/univExam'">목록으로</div>
	                	</c:otherwise>
                	</c:choose>
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
    	// 변수 셋팅
    	var num = "${map.AUTO}";
    	var title = "${map.TITLE}";
    	var content = "${map.CONTENT}";
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
      	// 수정
		function modify(){
      		$("#modify").hide();
      		$("#remov").hide();
      		$("#cancel").show();
      		$("#save").show();
      		$("#content").show();
      		$("#contentTxt").hide();
      		$("#title").show();
      		$("#titleTxt").hide();
      	}
      	// 삭제
      	function remov(){
      		$("#removeDiv").show();
      		$("#removeDiv1").show();
      		$("header").css("z-index", "1");
      	}
      	// 삭제 완료
      	function commit(){
      		$.ajax({
      			type : "post",
      			url : "/univExam/delete/${map.AUTO}",
      			async : false,
      			success : function(txt){
      				if(txt){
      					alert("삭제되었습니다.");
      					location.href="/univExam";
      				} else {
      					alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
      				}
      			}
      		});
      	}
      	// 취소
      	function cancel(){
      		$("#modify").show();
      		$("#remov").show();
      		$("#cancel").hide();
      		$("#save").hide();
      		$("#content").hide();
      		$("#contentTxt").show();
      		$("#content").val(content);
      		$("#title").hide();
      		$("#titleTxt").show();
      		$("#title").val(title);
      	}
      	// 저장
      	function save(){
      		var title = $("#title").val();
      		var content = $("#content").val();
      		$.ajax({
      			type : "post",
      			url : "/univExam/modify/"+num+"/"+title+"/"+content,
      			async : false,
      			success : function(txt){
      				if(txt){
      					alert("수정되었습니다.");
      					location.href="/univExam/view/"+num;
      				} else {
      					alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
      				}
      			}
      		});
      	}
    </script>
    
</html>