<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="txt_box">
	<div class="tit txt_number">
		<span>카테고리</span>
	</div>
	<div class="tit txt_tit">
		<span>제목</span>
	</div>
	<div class="tit txt_rec">
		<span>작성자</span>
	</div>
	<div class="tit txt_date">
		<span>작성일</span>
	</div>
</div>
<c:forEach var="t" items="${boardList }">
	<div class="txt_box">
		<div class="txt txt_number">
			<div class="txt">공지사항</div>
		</div>
		<div class="txt txt_tit">
			<c:choose>
				<c:when test="${t.TITLE != null }">
					<span>${t.TITLE }</span>
				</c:when>
				<c:when test="${t.CONTENT != null }">
					<span>${t.CONTENT }</span>
				</c:when>
				<c:otherwise>
					<span>${t.COMMENT }</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="txt txt_rec">
			<span>${t.NAME }</span>
		</div>
		<div class="txt txt_date">
			<span>${t.DAY }</span>
		</div>
	</div>
</c:forEach>