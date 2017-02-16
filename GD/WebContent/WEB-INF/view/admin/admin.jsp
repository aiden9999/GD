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
			<c:import url="/WEB-INF/view/main/header.jsp"/>
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
                    <div class="tab_wrap">
                        <div class="tit sel" id="t1" onclick="tab(1)" style="width: 200px">
                            <div class="txt"> 회 원 목 록 </div>
                        </div>
                        <div class="tit" id="t2" onclick="tab(2)" style="width: 200px">
                            <div class="txt"> 게 시 판 관 리 </div>
                        </div>
                        <div class="tit" id="t3" onclick="tab(3)" style="width: 200px">
                            <div class="txt"> 문 자 전 송 </div>
                        </div>
                        <div class="tit" id="t4" onclick="tab(4)" style="width: 200px">
                            <div class="txt"> 메 일 전 송 </div>
                        </div>
                        <div class="tit" id="t5" onclick="tab(5)" style="border-left: none; width: 200px">
                            <div class="txt"> 학 원 등 록 </div>
                        </div>
                        <!-- tab1 -->
                        <div class="contents" id="tab1">
                            <div class="inner">
                                <div class=list_wrap>
                                    <div class="tit">회원목록</div>
                                    <div class="list">
                                    	<c:forEach var="i" begin="0" end="${memberList.size()-1 }">
	                                        <div class="name_wrap">
	                                            <div class="dot"></div>
	                                            <div class="name" style="cursor: pointer;" onclick="memberInfo(this)" id="${memberList.get(i).ID }">
	                                            	${memberList.get(i).NAME }(${memberList.get(i).ID })
	                                            </div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <div class="detailinfo_wrap" id="memDetail">
                                    <div class="tit">상세정보</div>
                                    <div class="info_wrap">
                                        <div class="tit">아이디</div>
                                        <div class="txt" id="id">${memberList.get(0).ID }</div>
                                    </div>
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
                                        <div class="txt" id="what">${memberList.get(0).WHAT }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">등급</div>
                                        <div class="txt" id="grade">${memberList.get(0).GRADE }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">전화번호</div>
                                        <div class="txt">${memberList.get(0).PHONE }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">이메일</div>
                                        <div class="txt">${memberList.get(0).EMAIL }</div>
                                    </div>
                                    <c:choose>
                                    	<c:when test="${login.ID == 'admin' }">
                                    		<c:choose>
                                    			<c:when test="${memberList.get(0).ADMIN == '메인관리자' }">
                                    				<div class="info_wrap checks" style="display: none">
				                                        <input type="radio" id="giveAdmin" name="admin" checked="checked">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks" style="display: none">
				                                        <input type="radio" id="acaAdmin" name="admin">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks" style="display: none">
				                                        <input type="radio" id="delAdmin" name="admin">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
                                    			</c:when>
	                                    		<c:when test="${memberList.get(0).ADMIN == '중간관리자' }">
		                                    		<div class="info_wrap checks">
				                                        <input type="radio" id="giveAdmin" name="admin" checked="checked">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="acaAdmin" name="admin">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="delAdmin" name="admin">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
	                                    		</c:when>
	                                    		<c:when test="${memberList.get(0).ADMIN == '학원관리자' }">
		                                    		<div class="info_wrap checks">
				                                        <input type="radio" id="giveAdmin" name="admin">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="acaAdmin" name="admin" checked="checked">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="delAdmin" name="admin">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
	                                    		</c:when>
	                                    		<c:otherwise>
		                                    		<div class="info_wrap checks">
				                                        <input type="radio" id="giveAdmin" name="admin">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="acaAdmin" name="admin">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="delAdmin" name="admin" checked="checked">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
	                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:choose>
                                    			<c:when test="${memberList.get(0).ADMIN == '메인관리자' }">
                                    				<div class="info_wrap checks" style="display: none">
				                                        <input type="radio" id="giveAdmin" name="admin" checked="checked">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks" style="display: none">
				                                        <input type="radio" id="acaAdmin" name="admin">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks" style="display: none">
				                                        <input type="radio" id="delAdmin" name="admin" disabled="disabled">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
                                    			</c:when>
	                                    		<c:when test="${memberList.get(0).ADMIN == '중간관리자' }">
		                                    		<div class="info_wrap checks">
				                                        <input type="radio" id="giveAdmin" name="admin" checked="checked" disabled="disabled">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="acaAdmin" name="admin" disabled="disabled">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="delAdmin" name="admin" disabled="disabled">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
	                                    		</c:when>
	                                    		<c:when test="${memberList.get(0).ADMIN == '학원관리자' }">
		                                    		<div class="info_wrap checks">
				                                        <input type="radio" id="giveAdmin" name="admin" disabled="disabled">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="acaAdmin" name="admin" checked="checked" disabled="disabled">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="delAdmin" name="admin" disabled="disabled">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
	                                    		</c:when>
	                                    		<c:otherwise>
		                                    		<div class="info_wrap checks">
				                                        <input type="radio" id="giveAdmin" name="admin" disabled="disabled">
				                                        <label for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자 권한부여</label>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="acaAdmin" name="admin" disabled="disabled">
				                                        <label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자 권한부여</label>
				                                        <select id="acaSelect" style="width: 140px; height: 25px; padding-left: 5px; display: none">
				                                        	<option value="choose">선택</option>
				                                        	<c:forEach var="t" items="${acaList }">
				                                        		<option value="${t.NUM }">${t.NAME }</option>
				                                        	</c:forEach>
				                                        </select>
				                                    </div>
				                                    <div class="info_wrap checks">
				                                        <input type="radio" id="delAdmin" name="admin" checked="checked" disabled="disabled">
				                                        <label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				                                    </div>
	                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:otherwise>
                                    </c:choose>
                                    <div class="cannext_wrap" style="margin: 70px 0">
                                        <div class="btn cancel" onclick="location.href='/'">취 소</div>
                                        <c:choose>
                                        	<c:when test="${memberList.get(0).NAME=='관리자' }">
		                                        <div class="btn next" style="cursor: default;">저 장</div>
                                        	</c:when>	
                                        	<c:otherwise>
                                        		<div class="btn next" onclick="tab1Save()">저 장</div>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab2 -->
                        <div class="contents" id="tab2" style="display: none">
                            <div class="inner">
                                <div class="board_sel">
                                    <select id="nowBoard">
                                        <option value="choose">게시판 선택</option>
                                        <option value="notice">공지사항</option>
                                        <option value="highExam">고등입시</option>
                                        <option value="univExam">대학입시</option>
                                    </select>
                                </div>
                                <div class=list_wrap>
                                    <div class="tit">글 목록</div>
                                    <div class="list" id="boardList" style="height: 350px">
                                        <div class="name_wrap">
                                            <div class="name">게시판을 선택해주세요.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="detailinfo_wrap2">
                                    <div class="tit">상세정보</div>
                                    <div class="info_wrap">
                                        <div class="tit">제목</div>
                                        <input type="text" id="tab2Title" readonly="readonly">
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">작성자</div>
                                        <input type="text" id="tab2Writer" readonly="readonly">
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">내용</div>
                                        <textarea id="tab2Content" style="resize: none; heigth: 300px" readonly="readonly"></textarea>
                                    </div>
                                    <div class="board_sel" style="margin-top: 200px">
<!--                                         <select id="targetBoard" style="margin-top: 200px"> -->
<!--                                             <option value="choose">게시판 선택</option> -->
<!--                                             <option value="notice">공지사항</option> -->
<!--                                             <option value="exam">입시정보</option> -->
<!--                                         </select> -->
                                        <div class="btn" onclick="boardDelete()" style="margin-left: 160px">삭제</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab3 -->
                        <div class="contents" id="tab3" style="display: none">
                            <div class="inner">
                                <div class="list_wrap list_wrap3">
                                    <div class="tit">회원목록</div>
                                    <div class="list">
                                    	<c:forEach var="i" items="${memberList }">
	                                        <div class="name_wrap">
	                                            <div class="dot"></div>
	                                            <div class="name" onclick="take(this)" style="cursor: pointer;">${i.NAME }(${i.ID })</div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <div class="receive_wrap">
                                    <div class="tit">수신목록&nbsp;
                                    	<font style="color: black; font-weight: normal; font-size: 15px" id="giveCount">0 / 100</font>
                                    </div>
                                    <div class="list" id="takeList"></div>
                                </div>
                                <div class="letter_wrap">
                                    <div class="tit">문자전송</div>
                                    <textarea placeholder="내용을 입력해주세요." style="resize: none" id="message"></textarea>
                                    <div class="txt" id="words" style="bottom: 155px">0 / 200</div>
                                    <div class="cannext_wrap">
                                        <div class="btn cancel" onclick="location.href='/'">취 소</div>
                                        <div class="btn next" onclick="sendMessage()">전 송</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab4 -->
                        <div class="contents" id="tab4" style="display: none">
                            <div class="inner">
                                <div class="list_wrap list_wrap3">
                                    <div class="tit">회원목록</div>
                                    <div class="list">
                                    	<c:forEach var="i" items="${memberList }">
	                                        <div class="name_wrap">
	                                            <div class="dot"></div>
	                                            <div class="name" onclick="mailTake(this)" style="cursor: pointer;">${i.NAME }(${i.ID })</div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <div class="receive_wrap">
                                    <div class="tit">수신목록&nbsp;
                                    	<font style="color: black; font-weight: normal; font-size: 15px" id="mailCount">0 / 30</font>
                                    </div>
                                    <div class="list" id="mailList"></div>
                                </div>
                                <div class="letter_wrap">
                                    <div class="tit">메일전송</div>
                                    <input type="text" id="subject1" placeholder="제목을 입력해주세요." style="width: 100%; border: solid 1px #88b04b;
                                    			padding: 5px 0 5px 8px; font-family: 'namsanB'; font-size: 15px; color: #a1a1a1; margin-bottom: 5px"/>
                                    <textarea placeholder="내용을 입력해주세요." style="resize: none; height: 325px" id="mail"></textarea>
                                    <div class="txt" id="wordM" style="bottom: 155px">0 / 2000</div>
                                    <div class="cannext_wrap">
                                        <div class="btn cancel" onclick="location.href='/'">취 소</div>
                                        <div class="btn next" onclick="sendMail()">전 송</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab5 -->
                        <div class="contents" id="tab5" style="display: none">
                            <div class="inner">
                            	<div class="join02">
						        	<form action="/admin/registCommit" enctype="multipart/form-data" method="post" id="form">
							            <div class="inner">
<!-- 							                <div class="prize_tit"> -->
<!-- 							                    <div class="img"> -->
<!-- 							                        <img src="/img/prize.png"> -->
<!-- 							                    </div> -->
<!-- 							                    <div class="txt">학원등록</div> -->
<!-- 							                </div> -->
							                <div class="save_section">
							                    <div class="save_box save_name">
							                        <div class="txt">학원이름</div>
							                        <input type="text" id="name" name="name" placeholder="ex) 강남대치학원">
							                    </div>
							                    <div class="save_box save_address">
							                        <div class="txt">학원주소</div>
							                        <input type="text" id="address" name="addr" placeholder="우편번호 클릭" readonly="readonly">
							                        <div class="btn" onclick="postCode()">우편번호</div>
							                    </div>
							                    <div class="save_box save_address">
							                        <div class="txt">지번주소</div>
							                        <input type="text" id="address1" name="addr1" placeholder="우편번호 클릭" readonly="readonly">
							                    </div>
							                    <div class="save_box save_phone">
							                        <div class="txt">학원 전화번호</div>
							                        <input type="text" id="tell" name="tell" placeholder="ex) 02-123-4567">
							                    </div>
<!-- 							                    <div class="save_box save_sort"> -->
<!-- 							                        <div class="txt">분류1</div> -->
<!-- 							                        <select id="type1" name="type1"> -->
<!-- 							                            <option value="1">1</option> -->
<!-- 							                            <option value="2">2</option> -->
<!-- 							                            <option value="3">3</option> -->
<!-- 							                        </select> -->
<!-- 							                    </div> -->
<!-- 							                    <div class="save_box save_sort save_sort1"> -->
<!-- 							                        <div class="txt">분류2</div> -->
<!-- 							                        <select id="type2" name="type2"> -->
<!-- 							                            <option value="1">1</option> -->
<!-- 							                            <option value="2">2</option> -->
<!-- 							                            <option value="3">3</option> -->
<!-- 							                        </select> -->
<!-- 							                    </div> -->
							                    <div class="save_box save_homepage">
							                        <div class="txt">홈페이지주소</div>
							                        <div class="txt1">http://</div>
							                        <input type="text" id="site" name="site" placeholder="gogosky.co.kr">
							                    </div>
							                    <div class="save_box save_logo">
							                        <div class="txt" style="bottom: 45px">학원로고</div>
							                        <div class="plus_box" id="logo1">
							                            <div class="plus_circle">
							                                <div class="plus" onclick="logo()">+</div>
							                                <input type="file" id="logo" name="logo" style="display: none" onchange="showImg(this)"/>
							                            </div>
							                        </div>
							                        <div class="txt1">(5mb 이하, 373px x 215px 사이즈로 업로드 해주십시오.)</div>
							                    </div>
							                    <div class="save_box save_intro">
							                        <div class="txt">학원 소개</div>
							                        <textarea id="intro" name="intro" placeholder="최대 500자 까지 가능합니다." maxlength="500" style="resize: none"></textarea>
							                    </div>
							                    <div class="save_box save_img">
							                        <div class="txt">학원이미지</div>
							                        <div class="plus_box" id="pic11">
							                            <div class="plus_circle">
							                                <div class="plus" onclick="picture(1)">+</div>
							                                <input type="file" id="pic1" name="pic1" style="display: none" onchange="showImg(this)"/>
							                            </div>
							                        </div>
							                        <div class="plus_box" id="pic22">
							                            <div class="plus_circle">
							                                <div class="plus" onclick="picture(2)">+</div>
							                                <input type="file" id="pic2" name="pic2" style="display: none" onchange="showImg(this)"/>
							                            </div>
							                        </div>
							                        <div class="plus_box" id="pic33">
							                            <div class="plus_circle">
							                                <div class="plus" onclick="picture(3)">+</div>
							                                <input type="file" id="pic3" name="pic3" style="display: none" onchange="showImg(this)"/>
							                            </div>
							                        </div>
							                        <div class="plus_box" id="pic44">
							                            <div class="plus_circle">
							                                <div class="plus" onclick="picture(4)">+</div>
							                                <input type="file" id="pic4" name="pic4" style="display: none" onchange="showImg(this)"/>
							                            </div>
							                        </div>
							                        <div class="plus_box" id="pic55">
							                            <div class="plus_circle">
							                                <div class="plus" onclick="picture(5)">+</div>
							                                <input type="file" id="pic5" name="pic5" style="display: none" onchange="showImg(this)"/>
							                            </div>
							                        </div>
							                        <div class="txt1">(5mb 이하, 795px x 510px 사이즈로 업로드 해주십시오.)</div>
							                    </div>
							                    <div class="save_box save_target">
							                        <div class="txt">수업대상</div>
							                        <input type="text" id="target" name="target" placeholder="초등,중등,고등">
							                    </div>
							                    <div class="save_box save_subject">
							                        <div class="txt">수업과목</div>
							                        <input type="text" id="subject" name="subject" placeholder="국어,영어,수학">
							                    </div>
							                    <div class="txt2">※사진을 업로드 하실때 위 사이즈가 아니면 화질이 깨지거나 사진이 늘어날 수 있습니다.※</div>
							                </div>
							                <div class="cannext_wrap">
							                    <div class="btn cancel" onclick="history.back()">취 소</div>
							                    <div class="btn next" onclick="commit()">등 록</div>
							                </div>
							            </div>
						            </form>
						        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <c:import url="/WEB-INF/view/main/footer.jsp"/>
	</body>
	
	<script>
		// 학원 등록 성공 / 실패
		$(document).ready(function(){
			if("${b}"!=""){
				if("${b}"=="y"){
					alert("등록되었습니다.");
				} else {
					alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
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
		// 탭이동
		function tab(num){
			for(var i=1; i<=5; i++){
				var x = document.getElementById("t"+i);
            	if(i==num){
            		if(x.className.indexOf(" sel") == -1){
            			x.className += " sel";
            			$("#tab"+i).show();
            		}
            	} else {
            		x.className = x.className.replace(" sel", "");
            		$("#tab"+i).hide();
            	}
			}
		}
		// tab1 회원 상세정보
		function memberInfo(element){
			var id = element.id;
			$.ajax({
				type : "post",
				url : "/admin/memberDetail/"+id,
				async : false,
				success : function(txt){
					$("#memDetail").html(txt);
				}
			});
		}
		// 학원관리자 선택시 학원리스트 show
		$("#giveAdmin").change(function(){
			$("#acaSelect").hide();
			$("#acaSelect").val("choose");
		});
		$("#acaAdmin").change(function(){
			$("#acaSelect").show();
		});
		$("#delAdmin").change(function(){
			$("#acaSelect").hide();
			$("#acaSelect").val("choose");
		});
		// 관리자 권한주기, 권한뺏기 및 저장
		function tab1Save(){
			var admin = $("#giveAdmin").prop("checked") ? "중간관리자" : $("#acaAdmin").prop("checked") ? "학원관리자" :
									$("#delAdmin").prop("checked") ? "일반" : false;
			var id = $("#id").html();
			var what = $("#what").html();
			var grade = $("#grade").html();
			var acaNum = $("#acaSelect").val();
			if(admin){
				if(admin=="학원관리자"){
					if(acaNum=="choose"){
						alert("학원을 선택해주세요.");
					} else {
						$.ajax({
							type : "post",
							url : "/admin/setAdmin/"+id+"/"+what+"/"+grade+"/"+admin+"/"+acaNum,
							async : false,
							success : function(txt){
								if(txt){
									alert("저장되었습니다.");
									location.reload();
								} else {
									alert("저장에 실패하였습니다.\n잠시후 다시 시도해주세요.");
								}
							}
						});
					}
				} else {
					$.ajax({
						type : "post",
						url : "/admin/setAdmin/"+id+"/"+what+"/"+grade+"/"+admin+"/"+acaNum,
						async : false,
						success : function(txt){
							if(txt){
								alert("저장되었습니다.");
								location.reload();
							} else {
								alert("저장에 실패하였습니다.\n잠시후 다시 시도해주세요.");
							}
						}
					});
				}
			} else {
				alert("권한을 선택해주세요.");
			}
		}
		// tab2 게시판 선택
		$("#nowBoard").change(function(){
			var board = $("#nowBoard").val();
			if(board!="choose"){
				$.ajax({
					type : "post",
					url : "/admin/board/"+board,
					async : false,
					success : function(txt){
						$("#boardList").html(txt);
					}
				});
			} else {
				var html = "<div class='name_wrap'><div class='name'>게시판을 선택해주세요.</div></div>";
				$("#boardList").html(html);
				$("#tab2Title").val("");
				$("#tab2Writer").val("");
				$("#tab2Content").val("");
			}
		});
		// tab2 게시판 글 선택
		function boardDetail(title){
			var board = $("#nowBoard").val();
			$.ajax({
				type : "post",
				url : "/admin/boardDetail/"+board+"/"+title,
				async : false,
				success : function(txt){
					$("#tab2Title").val(txt[0].TITLE);
					$("#tab2Writer").val(txt[0].WRITER);
					$("#tab2Content").val(txt[0].CONTENT);
				}
			});
		}
		// tab2 게시판 글 삭제
		function boardDelete(){
			var nowBoard = $("#nowBoard").val();
			var title = $("#tab2Title").val();
			var writer = $("#tab2Writer").val();
			var content = $("#tab2Content").val();
			if(nowBoard=="choose"){
				alert("게시판을 선택해주세요.");
			} else if(title.length==0){
				alert("글을 선택해주세요.");
			} else {
				$.ajax({
					type : "post",
					url : "/admin/boardDelete/"+nowBoard+"/"+title+"/"+writer+"/"+content,
					async : false,
					success : function(txt){
						if(txt){
							alert("삭제되었습니다.");
							location.reload();
						} else {
							alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
		// tab3 회원 클릭
		var num = 0;
		function take(element){
			var html = "<div class='name_wrap' id='give"+num+"'>";
			html += "<div class='dot'></div>&nbsp;";
			html += "<div class='name' id='to"+num+"'>"+element.innerHTML+"</div>&nbsp;";
			html += "<div class='X_mark' onclick='remov("+num+")'>X</div></div>";
			if($("#takeList").html().indexOf(element.innerHTML)>0){
				alert("이미 수신목록에 있습니다.");
			} else {
				$("#takeList").append(html);
				num ++;
				$("#giveCount").html(num+" / 100");
			}
		}
		// tab3 회원 제거
		function remov(num2){
			$("#give"+num2).remove();
			var count = $("#giveCount").html();
			count = count.substring(0, count.indexOf('/')-1);
			count --;
			num --;
			$("#giveCount").html(count+" / 100");
		}
		// tab3 문자내용 입력
     	$("#message").keyup(function(txt){
     		var strValue = $("#message").val();
	        var strLen = strValue.length;
	        var totalByte = 0;
	        var len = 0;
	        var oneChar = "";
	        var str2 = "";
	 
	        for (var i = 0; i < strLen; i++) {
	            var oneChar = strValue.charAt(i);
	            if (escape(oneChar).length > 4) {
	                totalByte += 2;
	            } else {
	                totalByte++;
	            }
	 
	            // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	            if (totalByte <= 200) {
	                len = i + 1;
	            }
	        }
	 
	        // 넘어가는 글자는 자른다.
	        if (totalByte > 200) {
	            str2 = strValue.substr(0, len);
	            totalByte = 200;
	            $("#message").val(str2);
	        }
	        
     		$("#words").html(totalByte+" / 200");
     		if(totalByte>=132){
     			$("#message").prop("rows", "2");
     		} else if(totalByte<132){
     			$("#message").prop("rows", "1");
     		}
     	});
		// tab3 문자 전송
		function sendMessage(){
			var to = new Array();
			for(var i=0; i<num; i++){
				to[i] = $("#to"+i).html();
			}
			var message = $("#message").val();
			alert(to+"\n"+message);
		}
		// tab4 회원 클릭
		var numM = 0;
		function mailTake(element){
			var html = "<div class='name_wrap' id='mailGive"+numM+"'>";
			html += "<div class='dot'></div>&nbsp;";
			html += "<div class='name' id='mail"+numM+"'>"+element.innerHTML+"</div>&nbsp;";
			html += "<div class='X_mark' onclick='removMail("+numM+")'>X</div></div>";
			if($("#mailList").html().indexOf(element.innerHTML)>0){
				alert("이미 수신목록에 있습니다.");
			} else {
				$("#mailList").append(html);
				numM ++;
				$("#mailCount").html(numM+" / 30");
			}
		}
		// tab4 회원 제거
		function removMail(num2){
			$("#mailGive"+num2).remove();
			var count = $("#mailCount").html();
			count = count.substring(0, count.indexOf('/')-1);
			count --;
			numM --;
			$("#mailCount").html(count+" / 30");
		}
		// tab4 메일내용 입력
     	$("#mail").keyup(function(txt){
     		var strValue = $("#mail").val();
	        var strLen = strValue.length;
	        var totalByte = 0;
	        var len = 0;
	        var oneChar = "";
	        var str2 = "";
	 
	        for (var i = 0; i < strLen; i++) {
	            var oneChar = strValue.charAt(i);
	            if (escape(oneChar).length > 4) {
	                totalByte += 2;
	            } else {
	                totalByte++;
	            }
	 
	            // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	            if (totalByte <= 2000) {
	                len = i + 1;
	            }
	        }
	 
	        // 넘어가는 글자는 자른다.
	        if (totalByte > 2000) {
	            str2 = strValue.substr(0, len);
	            totalByte = 2000;
	            $("#mail").val(str2);
	        }
	        
     		$("#wordM").html(totalByte+" / 2000");
     		if(totalByte>=132){
     			$("#mail").prop("rows", "2");
     		} else if(totalByte<132){
     			$("#mail").prop("rows", "1");
     		}
     	});
		// tab4 메일 전송
		function sendMail(){
			var to = new Array();
			for(var i=0; i<numM; i++){
				to[i] = $("#mail"+i).html();
			}
			var subject = $("#subject1").val();
			var mail = $("#mail").val();
			$.ajax({
				type : "post",
				url : "/admin/mail/"+to+"/"+subject+"/"+mail,
				async : false,
				success : function(txt){
					if(txt){
						alert("전송되었습니다.");
					} else {
						alert("전송에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
				}
			});
		}
    	// tab5 등록
	  	function commit(){
	  		var name = $("#name").val();
	  		var addr1 = $("#address").val();
	  		var addr2 = $("#address1").val();
	  		var tell = $("#tell").val();
// 	  		var type1 = $("#type1").val();
// 	  		var type2 = $("#type2").val();
	  		var site = $("#site").val();
	  		var logo = $("#logo").val();
	  		var intro = $("#intro").val();
	  		var pic1 = $("#pic1").val();
	  		var pic2 = $("#pic2").val();
	  		var pic3 = $("#pic3").val();
	  		var pic4 = $("#pic4").val();
	  		var pic5 = $("#pic5").val();
	  		var target = $("#target").val();
	  		var subject = $("#subject").val();
	  		if(name=="" || addr1=="" || addr2=="" || tell=="" || site=="" || intro=="" || target=="" || subject==""){
	  			alert("입력하지 않은 항목이 있습니다.");
	  		} else {
	  			$("#form").submit();
	  		}
	  	}
	  	// tab5 우편번호
	    function postCode(){
	  		var width = window.innerWidth;
	  		var height = window.innerHeight; 
			window.open("/admin/postCode", "postCode", "width=500px; height=550px; left="+width/2+" top="+height/2);
		}
	  	// tab5 우편번호
	    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
	    	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	    	$("#address").val(roadFullAddr);
	    	$("#address1").val(jibunAddr+" "+addrDetail);
	    }
	  	// tab5 로고 선택
	  	function logo(){
	  		$("#logo").trigger("click");
	  	}
	  	// tab5 사진 선택
	  	function picture(num){
	  		$("#pic"+num).trigger("click");
	  	}
	 	// tab5 사진 변경시 이미지 미리보기
 		function showImg(input) {
	 		var id = input.id;
	 		if(id.startsWith("l")){
	 			id = "logo1";
	 		} else {
		 		id = id.substring(id.indexOf('c')+1);
		 		id = "pic"+id+""+id;
	 		}
	 		var name = input.value;
	 		name = name.substring(name.indexOf('.')+1).toLowerCase();
	 		if(name != "jpg" && name != "png" && name != "gif"){
	 			alert(".jpg / .png / .gif 파일만 등록가능합니다.");
	 		} else {
	 		    if (input.files && input.files[0]) {
	 		        var reader = new FileReader();
	 		        reader.onload = function (e) {
	 		        	$("#"+id).css("background-image", "url('"+e.target.result+"')");
	 		        	$("#"+id).css({"background-size" : "100%", "background-position" : "center", "background-repeat" : "no-repeat"});
	 		        }
	 		        reader.readAsDataURL(input.files[0]);
	 		    }
	 		}
 		}
	</script>
	
</html>