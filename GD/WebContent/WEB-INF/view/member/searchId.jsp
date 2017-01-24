<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="tit_wrap">
    <div class="tit">아이디 찾기</div>
    <div class="logo"><label><span >L</span>ogo</label></div>
</div>
<div class="result_wrap">
    <div class="txt">아이디 조회 결과</div>
    <div class="line"></div>
    <div class="id_txt" id="findId">
    	<c:choose>
    		<c:when test="${list!=null }">
		    	${list.get(0).ID }<span>(${list.get(0).DAY } 가입)</span>
    		</c:when>
    		<c:otherwise>
    			<span>입력하신 정보와 일치하는 회원이 없습니다.</span>
    		</c:otherwise>
    	</c:choose>
    </div>
</div>
<div class="logpw_wrap">
    <div class="logpw">
        <div class="txt" onclick="location.href='/join'">로그인 하기</div>
    </div>
    <div class="logpw">
    	<c:choose>
	    	<c:when test="${list!=null }">
		        <div class="txt" onclick="pwSearch()">비밀번호 찾기</div>
	    	</c:when>
	    	<c:otherwise>
	    		<div class="txt" onclick="idSearch()">아이디 찾기</div>
	    	</c:otherwise>
    	</c:choose>
    </div>
</div>
<div class="close_btn" onclick="$('#idpop').hide(), $('#idpop2').hide()">닫기</div>