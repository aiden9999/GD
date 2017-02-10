<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="test_wrap" id="replySection">
	<div class="test_tit">
		<div class="test">평가</div>
		<div class="star_wrap">
			<c:choose>
				<c:when test="${totalPoint>4.9 }">
					<c:forEach var="i" begin="1" end="5">
						<div class="star">
							<img src="/img/main01_03_star.png">
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${totalPoint>=4 }">
					<c:forEach var="i" begin="1" end="4">
						<div class="star">
							<img src="/img/main01_03_star.png">
						</div>
					</c:forEach>
					<div class="star">
						<img src="/img/main01_03_star1.png">
					</div>
				</c:when>
				<c:when test="${totalPoint>=3 }">
					<c:forEach var="i" begin="1" end="3">
						<div class="star">
							<img src="/img/main01_03_star.png">
						</div>
					</c:forEach>
					<c:forEach var="i" begin="1" end="2">
						<div class="star">
							<img src="/img/main01_03_star1.png">
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${totalPoint>=1 }">
					<c:forEach var="i" begin="1" end="2">
						<div class="star">
							<img src="/img/main01_03_star.png">
						</div>
					</c:forEach>
					<c:forEach var="i" begin="1" end="3">
						<div class="star">
							<img src="/img/main01_03_star1.png">
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${totalPoint>=0 }">
					<div class="star">
						<img src="/img/main01_03_star.png">
					</div>
					<c:forEach var="i" begin="1" end="4">
						<div class="star">
							<img src="/img/main01_03_star1.png">
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<div class="point_wrap">
			<div class="txt">${totalPoint }/ 5.0</div>
			<div class="txt1">${comment.size() }명</div>
		</div>
	</div>
	<div class="test_input">
		<div class="input_inner">
			<div id="select_box" class="select_box">
				<select id="ex_select">
					<option value="choose">평점선택</option>
					<option value="1">1점</option>
					<option value="2">2점</option>
					<option value="3">3점</option>
					<option value="4">4점</option>
					<option value="5">5점</option>
				</select>
			</div>
			<div class="text_wrap">
				<c:choose>
					<c:when test="${login!=null }">
						<div class="text_box">
							<!-- 	<input type="text" id="point_txt" placeholder="( 최소 10자이상, 최대 100까지 입력 가능합니다. )" maxlength="100"> -->
							<textarea rows="1" cols="134" id="point_txt" style="resize: none"
								placeholder="( 최소 10자이상, 최대 한글 100자/영어 200자 까지 입력 가능합니다. )"></textarea>
						</div>
						<div class="btn">
							<div class="regi" onclick="submit()">등록</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="text_box">
							<textarea rows="1" cols="134" id="point_txt" style="resize: none"
								placeholder="( 로그인 후 작성 가능합니다. )" readonly="readonly"></textarea>
						</div>
						<div class="btn">
							<div class="regi">등록</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="txt" id="countTxt">0 / 200</div>
			</div>
		</div>
	</div>
</div>
<div class="reply_section" id="replySection">
	<c:forEach var="i" begin="0" end="${comment.size()-1 }">
		<div class="reply_wrap">
			<div class="star_wrap">
				<c:forEach var="j" begin="1" end="${comment.get(i).POINT }">
					<div class="star">
						<img src="/img/main01_04_star.png">
					</div>
				</c:forEach>
			</div>
			<div class="txt" id="replyTxt${i }">${comment.get(i).COMMENT }</div>
			<div class="id" id="replyId${i }">
				${comment.get(i).NAME }(${comment.get(i).ID })<span class="txt1"
					id="replyTime${i }">${comment.get(i).DAY }</span>
			</div>
		</div>
	</c:forEach>
</div>
<div class="page_wrap">
	<div class="inner">
		<div class="arrow_wrap">
			<div class="arrow prev" onclick="prev(this)" id="commentPrev${start }">
				<img src="/img/sub02_arrow_prev.png">
			</div>
			<div class="arrow next" onclick="next(this)" id="commentNext${start }">
				<img src="/img/sub02_arrow_next.png">
			</div>
		</div>
		<div class="num_wrap" id="commentPages" align="center" style="font-size: 0">
			<c:forEach var="i" begin="${start }" end="${end }">
				<c:choose>
					<c:when test="${i==selectPage }">
						<div class="num sel" onclick="commentPage(${i })"
							id="commentPage${i }" style="width: 33px">
							<span>${i }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="num" onclick="commentPage(${i })"
							id="commentPage${i }" style="width: 33px">
							<span>${i }</span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	// 한줄평가 페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==1 && end<10){
			$("#commentPrev"+start).hide();
			$("#commentNext"+start).hide();
		} else {
			if(start==1){
	  			$("#commentPrev"+start).hide();
	  			$("#commentNext"+start).show();
	  		} else if(end>=${commentPage }){
	  			$("#commentPrev"+start).show();
	  			$("#commentNext"+start).hide();
	  		}
		}
	});
</script>