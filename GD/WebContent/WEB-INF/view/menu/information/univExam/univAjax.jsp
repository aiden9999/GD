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
							<c:when test="${list.get(i).AUTO<10 }">
								<span>0${univCount-i }</span>
							</c:when>
							<c:otherwise>
								<span>${list.get(i).AUTO }</span>
							</c:otherwise>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${login!=null }">
							<div onclick="select(${list.get(i).AUTO })" class="txt txt_tit">
								<span>${list.get(i).TITLE }</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="txt txt_tit">
								<span>${list.get(i).TITLE }</span>
							</div>
						</c:otherwise>
					</c:choose>
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
			<div class="arrow prev" onclick="prev(this)" id="prev${start }">
				<img src="/img/sub02_arrow_prev.png">
			</div>
			<div class="arrow next" onclick="prev(this)" id="next${start }">
				<img src="/img/sub02_arrow_next.png">
			</div>
		</div>
		<div class="num_wrap" id="pages" align="center">
			<c:forEach var="i" begin="${start }" end="${end }">
				<c:choose>
					<c:when test="${i==selectPage }">
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

<script>
	//페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==1 && end<10){
			$("#prev"+start).hide();
			$("#next"+start).hide();
		} else {
			if(start==1){
	  			$("#prev"+start).hide();
	  			$("#next"+start).show();
	  		} else if(end>=${univPage }){
	  			$("#prev"+start).show();
	  			$("#next"+start).hide();
	  		}
		}
	});
</script>