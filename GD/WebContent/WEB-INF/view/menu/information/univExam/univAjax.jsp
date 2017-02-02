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
	<c:choose>
		<c:when test="${list.size()>0 }">
			<c:forEach var="i" begin="0" end="${list.size()-1 }">
				<div class="txt_box">
					<div class="txt txt_number">
						<c:choose>
							<c:when test="${univCount-i<10 }">
								<span>0${univCount-i }</span>
							</c:when>
							<c:otherwise>
								<span>${univCount-i }</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div onclick="select(${i })" class="txt txt_tit">
						<span>${list.get(i).TITLE }</span>
					</div>
					<div id="dropdown${i }" class="contents">
						<div class="img">
							<img src="/img/sub02_arrow_up.png" onclick="clo(${i })">
						</div>
						<div class="drop_txt">${list.get(i).CONTENT }</div>
					</div>
					<div class="txt txt_name">
						<span>${list.get(i).WRITER }</span>
					</div>
					<div class="txt txt_date">
						<span>${list.get(i).DAY }</span>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div align="center" style="margin: 20px">
				<label>등록된 글이 없습니다.</label>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<div class="write_wrap">
	<div class="empty_box"></div>
	<c:if test="${login.GRADE=='관리자' }">
		<div class="write_btn" onclick="wr()">
			<div class="txt">글쓰기</div>
		</div>
	</c:if>
</div>
<div class="page_wrap">
	<div class="inner">
		<div class="arrow_wrap">
			<div class="arrow prev">
				<img src="img/sub02_arrow_prev.png">
			</div>
			<div class="arrow next">
				<img src="img/sub02_arrow_next.png">
			</div>
		</div>
		<div class="num_wrap">
			<c:forEach var="i" begin="1" end="${univPage }">
				<c:choose>
					<c:when test="${i==1 }">
						<div class="num sel" onclick="page(${i })" id="page${i }">
							<span>${i }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="num" onclick="page(${i })" id="page${i }">
							<span>${i }</span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>