<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="grade_wrap" id="gradeDiv">
	<div class="star_grade">
		<div class="txt">
			강남대치학원 멘토클리닉의 전체과목 평점<br> <span>${rePoint } / 5.0</span>
		</div>
		<div class="star_wrap1">
			<c:choose>
				<c:when test="${rePoint>4.9 }">
					<c:forEach var="i" begin="1" end="5">
						<div class="star">
							<img src="/img/main01_03_star.png">
						</div>
					</c:forEach>
				</c:when>
				<c:when test="${rePoint>=4 }">
					<c:forEach var="i" begin="1" end="4">
						<div class="star">
							<img src="/img/main01_03_star.png">
						</div>
					</c:forEach>
					<div class="star">
						<img src="/img/main01_03_star1.png">
					</div>
				</c:when>
				<c:when test="${rePoint>=3 }">
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
				<c:when test="${rePoint>=1 }">
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
				<c:when test="${rePoint>=0 }">
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
	</div>
	<div class="bar_grade">
		<div class="bar_wrap">
			<div class="txt">${again }%</div>
			<div class="bar" id="bar" style="width: ${again }%"></div>
		</div>
		<div class="txt">
			<span>${all }</span> 명의 학생중 <span>${again }%</span> 가<br> 강남대치학원
			멘토클리닉을 다시 다니고 싶어합니다.
		</div>
	</div>
</div>
<div class="board_wrap" id="boardDiv">
	<div class="txt_box">
		<div class="tit txt_number">
			<span>번호</span>
		</div>
		<div class="tit txt_tit">
			<span>기간 / 과목 / 평점</span>
		</div>
		<div class="tit txt_rec">
			<span>추천</span>
			<div class="love">
				<img src="/img/main01_03_love.png">
			</div>
		</div>
	</div>
	<c:forEach var="i" begin="0" end="${reviewTop.size()-1 }">
		<div class="txt_box best">
			<div class="txt txt_number">
				<div class="best_txt">BEST</div>
				<img src="/img/sub03_new_box.png">
			</div>
			<div class="txt txt_tit" onclick="reviewDetail('${reviewTop.get(i).AUTO}')">
				<span>${reviewTop.get(i).DAY } / ${reviewTop.get(i).SUBJECT }
					/ ${reviewTop.get(i).POINT }</span>
			</div>
			<div class="txt txt_rec">
				<span>${reviewTop.get(i).RECOMEND }</span>
				<div class="love">
					<img src="/img/main01_03_love.png">
				</div>
			</div>
		</div>
	</c:forEach>
	<c:forEach var="i" begin="0" end="${review.size()-1 }">
		<div class="txt_box">
			<div class="txt txt_number">
				<div class="best_txt">${reviewCount-i }</div>
			</div>
			<div class="txt txt_tit" onclick="reviewDetail('${review.get(i).AUTO}')">
				<span>${review.get(i).DAY } / ${review.get(i).SUBJECT } /
					${review.get(i).POINT }</span>
			</div>
			<div class="txt txt_rec">
				<span>${review.get(i).RECOMEND }</span>
				<div class="love">
					<img src="/img/main01_03_love.png">
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<div class="write_wrap" id="writeDiv">
	<div class="empty_box"></div>
	<c:if test="${login!=null }">
		<div class="write_btn" onclick="review(${list.NUM})">
			<div class="txt">리뷰쓰기</div>
		</div>
	</c:if>
</div>
<div class="page_wrap" id="reviewPages">
	<div class="inner">
		<div class="arrow_wrap">
			<div class="arrow prev" onclick="reviewPrev(this)" id="reviewPrev${start }">
				<img src="/img/sub02_arrow_prev.png">
			</div>
			<div class="arrow next" onclick="reviewNext(this)" id="reviewNext${start }">
				<img src="/img/sub02_arrow_next.png">
			</div>
		</div>
		<div class="num_wrap" id="pages" align="center" style="font-size: 0">
			<c:forEach var="i" begin="${start }" end="${end }">
				<c:choose>
					<c:when test="${i==selectPage }">
						<div class="num sel" onclick="reviewPage(${i })" id="reviewPage${i }">
							<span>${i }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="num" onclick="reviewPage(${i })" id="reviewPage${i }">
							<span>${i }</span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>

<div class="review_wrap1" id="reviewDiv" style="display: none">
	<div class="review_intro">
		<div class="txt">
			<span class="txt1">강남에서 대학가기</span>는 내아이의학원을 고를 더 <span class="txt1">‘이런
				리뷰가있으면 좋겠다 ’</span> 라는마음가짐으로 리뷰를 수집합니다.<br> 작성하신리뷰는 <span class="txt1">익명</span>으로
			저장되며 작성자의 개인정보는 어디에도 노출되지 않습니다.<br>
			<br>
		</div>
		<div class="txt2">
			1. 구체적 이지 못한 리뷰의 경우<span class="txt3"> 추가 작성</span>이 요청될 수있습니다.<br>
			2. 리뷰작성 시 <span class="txt3">객관전인 사실과 실제 경험</span>을 바탕으로 작성해주세요.<br>
			3. 비방, 욕설, 허위 사실이포함된 리뷰는등록되지않습니다.
		</div>
	</div>
	<div class="academy_input">
		<div class="inner">
			<div class="aca_term academy_info">
				<div class="tit">수강기간</div>
				<input type="text" id="re_day" placeholder="ex. 6개월">
			</div>
			<div class="aca_subject academy_info">
				<div class="tit">수강과목</div>
				<input type="text" id="re_subject" placeholder="ex. 수학">
			</div>
			<div class="aca_subject1 academy_info">
				<div class="tit">상세과목(선택사항)</div>
				<input type="text" id="re_subject1" placeholder="ex. 미분과 적분">
			</div>
			<div class="aca_class academy_info">
				<div class="tit">수업이름</div>
				<input type="text" id="re_className" placeholder="ex. 대입 준비반">
			</div>
			<div class="aca_age academy_info">
				<div class="tit">수강당시학년</div>
				<input type="text" id="re_grade" placeholder="ex. 고등학교 3학년">
			</div>
			<div class="aca_teacher academy_info">
				<div class="tit">선생님</div>
				<input type="text" id="re_teacher" placeholder="ex. 홍길동">
			</div>
			<div class="aca_sort academy_info">
				<div class="tit">문/이과(선택사항)</div>
				<label><input type="radio" name="sort" value="liberal"
					id="type1"><span>문과</span></label> <label><input
					type="radio" name="sort" value="science" id="type2"><span>이과</span></label>
				<label><input type="radio" name="sort" value="art"
					id="type3"><span>예체능</span></label>
			</div>
		</div>
	</div>
</div>
<div class="feeling_wrap" id="feelingDiv" style="display: none">
	<div class="feeling_tit" style="width: 250px">
		<div class="tit">학원 총 평점</div>
		<div class="star_wrap" style="float: none">
			<c:forEach var="i" begin="1" end="5">
				<div class="star" onclick="rePoint(${i })">
					<img src="/img/main01_03_star1.png" id="star${i }">
				</div>
			</c:forEach>
		</div>
		<div class="txt" style="position: absolute; right: 0; top: 10%"
			id="totalPoint">(0.0)</div>
	</div>
	<div class="feeling_txtarea">
		<div class="ft_txtarea">
			<div class="tit">
				수업방식 및 특징<br>
				<span>(20 ~ 100자)</span>
			</div>
			<textarea id="rate1"></textarea>
		</div>
		<div class="ft_txtarea">
			<div class="tit">
				수강전 학생 상태<br>
				<span>(20 ~ 100자)</span>
			</div>
			<textarea id="rate2"></textarea>
		</div>
		<div class="ft_txtarea">
			<div class="tit">
				좋은점<br>
				<span>(20 ~ 100자)</span>
			</div>
			<textarea id="rate3"></textarea>
		</div>
		<div class="ft_txtarea">
			<div class="tit">
				아쉬운점<br>
				<span>(20 ~ 100자)</span>
			</div>
			<textarea id="rate4"></textarea>
		</div>
		<div class="ft_radio">
			<div class="tit">예전으로 돌아가도 이 학원을 다니실건가요?</div>
			<div class="input_wrap">
				<label><input type="radio" name="again" value="yes"
					id="radioYes"><span>네</span></label>
			</div>
			<div class="input_wrap">
				<label><input type="radio" name="again" value="no"
					id="radioNo"><span>다른곳을 알아본다</span></label>
			</div>
		</div>
	</div>
	<div class="cannext_wrap">
		<div class="btn cancel" onclick="cancel()">취 소</div>
		<div class="btn next" onclick="reSave()">저 장</div>
	</div>
</div>
<div class="review_wrap" id="reviewDetail" style="display: none"></div>

<script>
	//페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==1 && end<10){
			$("#reviewPrev"+start).hide();
			$("#reviewNext"+start).hide();
		} else {
			if(start==1){
	  			$("#reviewPrev"+start).hide();
	  			$("#reviewNext"+start).show();
	  		} else if(end>=${reviewPage }){
	  			$("#reviewPrev"+start).show();
	  			$("#reviewNext"+start).hide();
	  		}
		}
	});
</script>