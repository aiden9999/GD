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
        <div class="admin01">
            <div class="inner">
                <div class="tit">
                    <div class="icon_wrap">
                        <div class="img"><img src="/img/key.png"></div>
                        <div class="txt">강남에서 대학가기 관리자 페이지</div>
                    </div>
                </div>
                <div class="container">
                    <div class="tab_wrap tab01">
                        <div class="tit sel">
                            <div class="txt"> 회 원 목 록 </div>
                        </div>
                        <div class="tit">
                            <div class="txt"> 게 시 판 관 리 </div>
                        </div>
                        <div class="tit">
                            <div class="txt"> 문 자 전 송 </div>
                        </div>
                        <div class="contents">
                            <div class="inner">
                                <div class=list_wrap>
                                    <div class="tit">회원목록</div>
                                    <div class="list">
                                    	<c:forEach var="i" begin="0" end="${memberList.size()-1 }">
	                                        <div class="name_wrap">
	                                            <div class="dot"></div>
	                                            <div class="name" style="cursor: pointer;" onclick="memberInfo('${memberList.get(i).ID}')">
	                                            	${memberList.get(i).NAME }(${memberList.get(i).ID })
	                                            </div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <div class="detailinfo_wrap" id="memDetail">
                                    <div class="tit">상세정보</div>
                                    <div class="info_wrap">
                                        <div class="tit">이름</div>
                                        <div class="txt">${memberList.get(0).NAME }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">필명</div>
                                        <div class="txt">${memberList.get(0).NICK }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">구분</div>
                                        <div class="txt">${memberList.get(0).WHAT }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">전화번호</div>
                                        <div class="txt">${memberList.get(0).PHONE }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">이메일</div>
                                        <div class="txt">${memberList.get(0).EMAIL }</div>
                                    </div>
                                    <div class="info_wrap checks">
                                        <input type="checkbox" id="giveAdmin">
                                        <label for="giveAdmin" class="tit">관리자 권한부여</label>
                                    </div>
                                    <div class="cannext_wrap">
                                        <div class="btn cancel" onclick="location.href='/'">취 소</div>
                                        <div class="btn next" onclick="tab1Save()">저 장</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
		// tab1 회원목록
		function memberInfo(id){
			$.ajax({
				type : "post",
				url : "/admin/memberDetail/"+id,
				async : false,
				success : function(txt){
					$("#memDetail").html(txt);
				}
			});
		}
	</script>
	
</html>