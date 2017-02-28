<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header_top">
	<div class="inner">
		<c:if test="${login.ADMIN == '메인관리자' }">
			<div class="txt" style="text-align: center; font-size: 13px; margin-top: 50px; cursor: default;">
				방문자수<br />오늘 : ${todayVisit }명 / 누적 : ${totalVisit }명
			</div>
		</c:if>
		<div class="logo" onclick="location.href='/'" style="background-image: url('/img/header_footer.png'); width: 160px; height: 72px; top: 7px"></div>
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
			<li onclick="mainAjax('elementary')" class="gnb_menu" id="menuEle"
				style="width: 16.5%">
				<div class="txt">초등학원</div>
			</li>
			<li onclick="mainAjax('middle')" class="gnb_menu" id="menuMid"
				style="width: 16.5%">
				<div class="txt">중등학원</div>
			</li>
			<li onclick="mainAjax('high')" class="gnb_menu" id="menuHig"
				style="width: 16.5%">
				<div class="txt">고등학원</div>
			</li>
			<li onclick="mainAjax('misfortune')" class="gnb_menu" id="menuMis"
				style="width: 16.5%">
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