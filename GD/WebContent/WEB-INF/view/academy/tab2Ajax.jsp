<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="board_wrap">
	<div class="txt_box">
		<div class="tit txt_number">
			<span>번호</span>
		</div>
		<div class="tit txt_tit">
			<span>제목</span>
		</div>
		<div class="tit txt_name">
			<span>작성자</span>
		</div>
		<div class="tit txt_date">
			<span>작성일</span>
		</div>
	</div>
	<c:forEach var="i" begin="0" end="${news.size()-1 }">
		<div class="txt_box">
			<div class="txt txt_number">
				<c:choose>
					<c:when test="${newsCount-i<10}">
						<span>0${newsCount-i }</span>
					</c:when>
					<c:otherwise>
						<span>${newsCount-i }</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div onclick="select(${i })" class="txt txt_tit">
				<span>${news.get(i).TITLE }</span>
			</div>
			<div id="dropdown${i }" class="contents">
				<div class="img">
					<img src="/img/sub02_arrow_up.png" onclick="clo(${i })">
				</div>
				<div class="drop_txt">${news.get(i).CONTENT }</div>
			</div>
			<div class="txt txt_name">
				<span>${news.get(i).WRITER }</span>
			</div>
			<div class="txt txt_date">
				<span>${news.get(i).DAY }</span>
			</div>
		</div>
	</c:forEach>
</div>
<div class="write_wrap">
	<div class="empty_box"></div>
	<div class="write_btn">
		<div class="txt" onclick="wr()">글쓰기</div>
	</div>
</div>
<div class="page_wrap">
	<div class="inner">
		<div class="arrow_wrap">
			<div class="arrow prev">
				<img src="/img/sub02_arrow_prev.png" onclick="prev(this)" id="prev1">
			</div>
			<div class="arrow next">
				<img src="/img/sub02_arrow_next.png" onclick="next(this)" id="next1">
			</div>
		</div>
		<div class="num_wrap" id="pages">
			<c:forEach var="i" begin="1" end="${newsPage }">
				<c:choose>
					<c:when test="${i==selectPage }">
						<div class="num sel" onclick="newsPage(${i })" id="newsPage${i }">
							<span>${i }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="num" onclick="newsPage(${i })" id="newsPage${i }">
							<span>${i }</span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>