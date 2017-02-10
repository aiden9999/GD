<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<c:when test="${memberList.get(0).ADMIN=='y' }">
		<c:choose>
			<c:when test="${memberList.get(0).NAME=='관리자' }">
	   <div class="info_wrap checks">
	       <input type="checkbox" id="giveAdmin" checked="checked" disabled="disabled">
	       <label for="giveAdmin" class="tit">관리자 권한부여</label>
	   </div>
			</c:when>
			<c:otherwise>
	   <div class="info_wrap checks">
	   	<c:choose>
	   		<c:when test="${login.ID == 'admin' }">
	         <input type="checkbox" id="giveAdmin" checked="checked">
	   		</c:when>
	   		<c:otherwise>
	         <input type="checkbox" id="giveAdmin" checked="checked" disabled="disabled">
	   		</c:otherwise>
	   	</c:choose>
	       <label for="giveAdmin" class="tit">관리자 권한부여</label>
	   </div>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
	 <div class="info_wrap checks">
	 	<c:choose>
	 		<c:when test="${login.ID == 'admin' }">
	       <input type="checkbox" id="giveAdmin">
	 		</c:when>
	 		<c:otherwise>
	       <input type="checkbox" id="giveAdmin" disabled="disabled">
	 		</c:otherwise>
	 	</c:choose>
	     <label for="giveAdmin" class="tit">관리자 권한부여</label>
	 </div>
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