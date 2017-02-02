<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${boardList.size()!=0 }">
		<c:forEach var="i" begin="0" end="${boardList.size()-1 }">
			<div class="name_wrap">
				<div class="dot"></div>
				<div class="name" style="cursor: pointer;" onclick="boardDetail('${boardList.get(i).TITLE}')">${boardList.get(i).TITLE }</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<div class="name_wrap">
				<div class="name" style="cursor: pointer;">게시글 없음</div>
			</div>
	</c:otherwise>
</c:choose>