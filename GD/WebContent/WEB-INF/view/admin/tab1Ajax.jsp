<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<div class="btn cancel" onclick="location.reload()">취 소</div>
	<div class="btn next" onclick="tab1Save()">저 장</div>
</div>