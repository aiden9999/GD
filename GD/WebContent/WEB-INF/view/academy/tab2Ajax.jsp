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
					<c:when test="${news.get(i).AUTO<10}">
						<span>0${news.get(i).AUTO }</span>
					</c:when>
					<c:otherwise>
						<span>${news.get(i).AUTO }</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div onclick="select(${news.get(i).AUTO })" class="txt txt_tit">
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
			<div class="arrow prev" onclick="newsPrev(this)" id="news${start }">
				<img src="/img/sub02_arrow_prev.png" onclick="newsPrev(this)" id="newsPrev${start }">
			</div>
			<div class="arrow next" onclick="newsNext(this)" id="news${start }">
				<img src="/img/sub02_arrow_next.png" onclick="newsNext(this)" id="newsNext${start }">
			</div>
		</div>
		<div class="num_wrap" align="center" id="newsPages" style="font-size: 0">
			<c:forEach var="i" begin="${start }" end="${end }">
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

<script>
	//페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==1 && end<10){
			$("#newsPrev"+start).hide();
			$("#newsNext"+start).hide();
		} else {
			if(start==1){
	  			$("#newsPrev"+start).hide();
	  			$("#newsNext"+start).show();
	  		} else if(end>=${newsPage }){
	  			$("#newsPrev"+start).show();
	  			$("#newsNext"+start).hide();
	  		}
		}
	});
</script>