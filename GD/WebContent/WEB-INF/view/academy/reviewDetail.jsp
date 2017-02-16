<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="popup_cover" id="reviewRD" style="display: none"></div>
<div class="popup_wrap search_popup school_popup popup_close" id="reviewRD1" style="display: none">
    <div class="tit_wrap">
        <div class="logo"><span >L</span>ogo</div>
    </div>
    <div class="txt">
        정말 삭제하시겠습니까?
    </div>
    <div class="close_btn_wrap">
        <div class="close_btn left" onclick="$('#reviewRD').hide(), $('#reviewRD1').hide()">아니오</div>
        <div class="close_btn right" onclick="reviewCommit()">네</div>
    </div>
</div>
<div class="popup_cover" id="replyRD" style="display: none"></div>
<div class="popup_wrap search_popup school_popup popup_close" id="replyRD1" style="display: none">
    <div class="tit_wrap">
        <div class="logo"><span >L</span>ogo</div>
    </div>
    <div class="txt">
        정말 삭제하시겠습니까?
    </div>
    <div class="close_btn_wrap">
        <div class="close_btn left" onclick="$('#replyRD').hide(), $('#replyRD1').hide()">아니오</div>
        <div class="close_btn right" onclick="replyCommit()">네</div>
    </div>
</div>
<div class="inner">
	<div class="review_txt">
		<div class="review_header">
			<div class="point">
				<div class="txt">평점</div>
				<div class="star_wrap">
					<div class="star">
						<img src="/img/main01_03_star.png">
					</div>
					<div class="star">
						<img src="/img/main01_03_star.png">
					</div>
					<div class="star">
						<img src="/img/main01_03_star.png">
					</div>
					<div class="star">
						<img src="/img/main01_03_star.png">
					</div>
					<div class="star">
						<img src="/img/main01_03_star1.png">
					</div>
				</div>
				<div class="txt1">
					<span>(${list.POINT }) </span>${list.NAME } (${list.WRITER })
				</div>
			</div>
			<div class="date">
				<div class="txt">${list.REDAY }</div>
				<div class="txt">조회 (${list.COUNT })</div>
				<div class="txt">
					<span>댓글</span> (${list.REPLY })
				</div>
			</div>
		</div>
		<div class="txt_view">
			<div class="review_wrap1">
				<div class="review_intro">
					<div class="txt">
						<span class="txt1">강남에서 대학가기</span>는 내아이의학원을 고를 때 <span
							class="txt1">‘이런 리뷰가있으면 좋겠다 ’</span> 라는마음가짐으로 리뷰를 수집합니다.<br>
						작성하신리뷰는 <span class="txt1">익명</span>으로 저장되며 작성자의 개인정보는 어디에도 노출되지
						않습니다.<br>
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
							<input type="text" id="day" value="${list.DAY }" readonly="readonly">
						</div>
						<div class="aca_subject academy_info">
							<div class="tit">수강과목</div>
							<input type="text" id="subject" value="${list.SUBJECT }" readonly="readonly">
						</div>
						<div class="aca_subject1 academy_info">
							<div class="tit">상세과목</div>
							<input type="text" id="subject1" value="${list.SUBJECT1 }" readonly="readonly">
						</div>
						<div class="aca_class academy_info">
							<div class="tit">수업이름</div>
							<input type="text" id="className" value="${list.CLASSNAME }" readonly="readonly">
						</div>
						<div class="aca_age academy_info">
							<div class="tit">수강당시학년</div>
							<input type="text" id="grade" value="${list.GRADE }" readonly="readonly">
						</div>
						<div class="aca_teacher academy_info">
							<div class="tit">선생님</div>
							<input type="text" id="teacher" value="${list.TEACHER }" readonly="readonly">
						</div>
						<div class="aca_sort academy_info">
							<div class="tit">문/이과</div>
							<c:choose>
								<c:when test="${list.TYPE=='문과' }">
									<label><input type="radio" name="sort" value="liberal" checked="checked" disabled="disabled" id="type11"><span>문과</span></label>
									<label><input type="radio" name="sort" value="science" disabled="disabled" id="type22"><span>이과</span></label>
									<label><input type="radio" name="sort" value="art" disabled="disabled" id="type33"><span>예체능</span></label>
								</c:when>
								<c:when test="${list.TYPE=='이과' }">
									<label><input type="radio" name="sort" value="liberal" disabled="disabled" id="type11"><span>문과</span></label>
									<label><input type="radio" name="sort" value="science" checked="checked" disabled="disabled" id="type22"><span>이과</span></label>
									<label><input type="radio" name="sort" value="art" disabled="disabled" id="type33"><span>예체능</span></label>
								</c:when>
								<c:otherwise>
									<label><input type="radio" name="sort" value="liberal" disabled="disabled" id="type11"><span>문과</span></label>
									<label><input type="radio" name="sort" value="science" disabled="disabled" id="type22"><span>이과</span></label>
									<label><input type="radio" name="sort" value="art" checked="checked" disabled="disabled" id="type33"><span>예체능</span></label>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="feeling_wrap">
				<div class="feeling_txtarea">
					<div class="ft_txtarea">
						<div class="tit">
							수업방식 및 특징<br>
							<span>(최소 20자)</span>
						</div>
						<textarea readonly="readonly" style="resize: none" id="rate11">${list.RATE1 }</textarea>
					</div>
					<div class="ft_txtarea">
						<div class="tit">
							수강전 학생 상태<br>
							<span>(최소 20자)</span>
						</div>
						<textarea readonly="readonly" style="resize: none" id="rate22">${list.RATE2 }</textarea>
					</div>
					<div class="ft_txtarea">
						<div class="tit">
							좋은점<br>
							<span>(최소 30자)</span>
						</div>
						<textarea readonly="readonly" style="resize: none" id="rate33">${list.RATE3 }</textarea>
					</div>
					<div class="ft_txtarea">
						<div class="tit">
							아쉬운점<br>
							<span>(최소 30자)</span>
						</div>
						<textarea readonly="readonly" style="resize: none" id="rate44">${list.RATE4 }</textarea>
					</div>
					<div class="ft_radio">
						<div class="tit">예전으로 돌아가도 이 학원을 다니실건가요?</div>
						<c:choose>
							<c:when test="${list.AGAIN=='y' }">
								<div class="input_wrap">
									<label><input type="radio" name="again" checked="checked" disabled="disabled" id="againY"><span>네</span></label>
								</div>
								<div class="input_wrap">
									<label><input type="radio" name="again" disabled="disabled" id="againN"><span>다른곳을 알아본다</span></label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="input_wrap">
									<label><input type="radio" name="again" disabled="disabled" id="againY"><span>네</span></label>
								</div>
								<div class="input_wrap">
									<label><input type="radio" name="again" checked="checked" disabled="disabled" id="againN"><span>다른곳을 알아본다</span></label>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="cannext_wrap" style="width: 320px">
					<c:choose>
						<c:when test="${login.ID == list.ID || login.ID == 'admin' }">
							<div class="btn next" onclick="modify('${list.AUTO }')" style="float: none; background-color: #fafafa; color: black" id="modify${list.AUTO }">수 정</div>
							<div class="btn next" onclick="remov('${list.AUTO }')" style="float: none;" id="remov${list.AUTO }">삭 제</div>
							<div class="btn cancel" onclick="cancel('${list.AUTO }')" style="float: none; background-color: #fafafa; color: black; display: none" id="cancel${list.AUTO }">취 소</div>
							<div class="btn next" onclick="save('${list.AUTO }')" style="float: none; display: none" id="save${list.AUTO }">저 장</div>
							<div class="btn cancel" onclick="goList()">목록으로</div>
						</c:when>
						<c:otherwise>
							<div class="btn cancel" onclick="goList()" style="margin-left: 100px">목록으로</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="recommand_wrap">
		<div class="txt">이 리뷰를 추천합니다</div>
		<div class="img">
			<img src="/img/main01_03_love.png" onclick="recomend('${list.AUTO }')">
		</div>
		<div class="txt1" style="margin-left: 155px">(현재 추천수 ${list.RECOMEND })</div>
		<div class="input">
			<input type="text" id="reply" maxlength="50">
			<div class="btn" onclick="writerRep()">댓글 쓰기</div>
		</div>
	</div>
	<div class="reply_wrapper">
	
		<c:forEach var="t" items="${reply }">
			<div class="reply_wrap">
				<div class="reply_tit" style="margin-bottom: 10px">
					<div class="name">${t.NAME }(${t.ID })</div>
					<div class="date">${t.DAY }</div>
				</div>
				<div class="substance" style="width: 75%; height: 25px; display: inline-block;"
						id="reply${t.AUTO }">${t.REPLY }</div>
				<c:if test="${login.ID == t.id || login.ID == 'admin' }">
					<input type="text" style="width: 75%; height: 25px; display: none" id="replyTxt${t.AUTO }" value="${t.REPLY }"
							maxlength="50"/>
					<div class="btn next" onclick="removRep('${t.AUTO}')" style="float: right; border: 1px solid #2b3735; font-size: 15px;
							text-align: center; cursor: pointer; padding: 7px 0; width: 100px; background-color: black; color: white"
							id="removRep${t.AUTO }">삭 제</div>
					<div class="btn next" onclick="modifyRep('${t.AUTO }')" style="float: right; border: 1px solid #2b3735; font-size: 15px;
							text-align: center; cursor: pointer; padding: 7px 0; width: 100px; background-color: #fafafa; color: black; margin-right: 5px;"
							id="modifyRep${t.AUTO }">수 정</div>
					<div class="btn next" onclick="saveRep('${t.AUTO}')" style="float: right; border: 1px solid #2b3735; font-size: 15px; display: none;
							text-align: center; cursor: pointer; padding: 7px 0; width: 100px; background-color: black; color: white"
							id="saveRep${t.AUTO }">저 장</div>
					<div class="btn cancel" onclick="cancelRep('${t.AUTO }', '${t.REPLY }')" style="float: right; border: 1px solid #2b3735;
							font-size: 15px; display: none; text-align: center; cursor: pointer; padding: 7px 0; width: 100px; margin-right: 5px;"
							id="cancelRep${t.AUTO }">취 소</div>
				</c:if>
			</div>
		</c:forEach>
	</div>
</div>

<script>
	// 변수 셋팅
	var day = $("#day").val();
	var subject = $("#subject").val();
	var subject1 = $("#subject1").val();
	var className = $("#className").val();
	var grade = $("#grade").val();
	var teacher = $("#teacher").val();
	var type = $("#type11").prop("checked") ? "문과" : $("#type22").prop("checked") ? "이과" : $("#type33").prop("checked") ? "예체능" : "null";
	var rate1 = $("#rate11").val();
	var rate2 = $("#rate22").val();
	var rate3 = $("#rate33").val();
	var rate4 = $("#rate44").val();
	var again = $("#againY").prop("checked") ? "y" : "n";
	// 조회수 증가
	$(document).ready(function(){
		$.ajax({
			type : "post",
			url : "/review/countUp/"+${list.AUTO },
			async : true
		});
	});
	// 리뷰 추천
	function recomend(num){
		$.ajax({
			type : "post",
			url : "/review/recomend/"+num,
			async : false,
			success : function(txt){
				if(txt){
					alert("추천하였습니다.");
					location.reload();
				} else {
					alert("이미 추천하셨습니다.");
				}
			}
		});
	}
	// 목록으로
	function goList(){
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").show();
		$("#tab4").hide();
		$("#1").prop("class", "gnb");
		$("#2").prop("class", "gnb");
		$("#3").prop("class", "gnb sel");
		$("#4").prop("class", "gnb");
		$("#reviewDetail").hide();
		$("#gradeDiv").show();
		$("#boardDiv").show();
		$("#writeDiv").show();
		$("#pageDiv").show();
		$("#reviewPages").show();
	}
	// 글 수정
	function modify(num){
		$("#modify"+num).hide();
		$("#remov"+num).hide();
		$("#cancel"+num).show();
		$("#save"+num).show();
		$("#day").prop("readonly", false);
		$("#subject").prop("readonly", false);
		$("#subject1").prop("readonly", false);
		$("#className").prop("readonly", false);
		$("#grade").prop("readonly", false);
		$("#teacher").prop("readonly", false);
		$("#type11").prop("disabled", false);
		$("#type22").prop("disabled", false);
		$("#type33").prop("disabled", false);
		$("#rate11").prop("readonly", false);
		$("#rate22").prop("readonly", false);
		$("#rate33").prop("readonly", false);
		$("#rate44").prop("readonly", false);
		$("#againY").prop("disabled", false);
		$("#againN").prop("disabled", false);
	}
	// 글 삭제
	function remov(num){
		$("#reviewRD").show();
		$("#reviewRD1").show();
	}
	// 글 수정 취소
	function cancel(num){
		$("#modify"+num).show();
		$("#remov"+num).show();
		$("#cancel"+num).hide();
		$("#save"+num).hide();
		$("#day").prop("readonly", true);
		$("#subject").prop("readonly", true);
		$("#subject1").prop("readonly", true);
		$("#className").prop("readonly", true);
		$("#grade").prop("readonly", true);
		$("#teacher").prop("readonly", true);
		$("#type11").prop("disabled", true);
		$("#type22").prop("disabled", true);
		$("#type33").prop("disabled", true);
		$("#rate11").prop("readonly", true);
		$("#rate22").prop("readonly", true);
		$("#rate33").prop("readonly", true);
		$("#rate44").prop("readonly", true);
		$("#againY").prop("disabled", true);
		$("#againN").prop("disabled", true);
		
		$("#day").val(day);
		$("#subject").val(subject);
		$("#subject1").val(subject1);
		$("#className").val(className);
		$("#grade").val(grade);
		$("#teacher").val(teacher);
		type=="문과" ? $("#type11").prop("checked", true) : type=="이과" ? $("#type22").prop("checked", true) : $("#type33").prop("checked", true);
		$("#rate11").val(rate1);
		$("#rate22").val(rate2);
		$("#rate33").val(rate3);
		$("#rate44").val(rate4);
		again=="y" ? $("#againY").prop("checked", true) : $("#againN").prop("checked", true);
	}
	// 글 수정 저장
	function save(num){
		day = $("#day").val();
		subject = $("#subject").val();
		subject1 = $("#subject1").val()=="" ? "null" : $("#subject1").val();
		className = $("#className").val();
		grade = $("#grade").val();
		teacher = $("#teacher").val();
		type = $("#type11").prop("checked") ? "문과" : $("#type22").prop("checked") ? "이과" : $("#type33").prop("checked") ? "예체능" : "null";
		rate1 = $("#rate11").val();
		rate2 = $("#rate22").val();
		rate3 = $("#rate33").val();
		rate4 = $("#rate44").val();
		again = $("#againY").prop("checked") ? "y" : "n";
		$.ajax({
			type : "post",
			url : "/review/reviewModify/${list.AUTO}/"+day+"/"+subject+"/"+subject1+"/"+className+"/"+grade+"/"+teacher+"/"+type+"/"+
					rate1+"/"+rate2+"/"+rate3+"/"+rate4+"/"+again,
			async : false,
			success : function(txt){
				if(txt){
					alert("수정되었습니다.");
					location.reload();
				} else {
					alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
	// 댓글 수정
	function modifyRep(num){
		$("#modifyRep"+num).hide();
		$("#removRep"+num).hide();
		$("#cancelRep"+num).show();
		$("#saveRep"+num).show();
		$("#reply"+num).hide();
		$("#replyTxt"+num).show();
	}
	// 댓글 삭제
	var replyNum = 0;
	function removRep(num){
		$("#replyRD").show();
		$("#replyRD1").show();
		replyNum = num;
	}
	// 댓글 수정 취소
	function cancelRep(num, reply){
		$("#modifyRep"+num).show();
		$("#removRep"+num).show();
		$("#cancelRep"+num).hide();
		$("#saveRep"+num).hide();
		$("#reply"+num).show();
		$("#replyTxt"+num).hide();
		$("#replyTxt"+num).val(reply);
	}
	// 댓글 수정 저장
	function saveRep(num){
		var reply = $("#replyTxt"+num).val();
		$.ajax({
			type : "post",
			url : "/review/replyModify/"+num+"/"+reply,
			async : false,
			success : function(txt){
				if(txt){
					alert("수정되었습니다.");
					location.reload();
				} else {
					alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
	// 댓글 쓰기
	function writerRep(){
		var reply = $("#reply").val();
		if("${login.ID }"!=""){
			$.ajax({
				type : "post",
				url : "/review/reply/${login.ID }/${login.NAME }/${list.AUTO }/"+reply,
				async : false,
				success : function(txt){
					if(txt){
						alert("등록되었습니다.");
						location.reload();
					} else {
						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
				}
			});
		} else {
			alert("로그인 후 이용 가능합니다.");
		}
	}
	// 리뷰 삭제 완료
	function reviewCommit(){
		$.ajax({
			type : "post",
			url : "/review/reviewRemove/${list.AUTO }",
			async : false,
			success : function(txt){
				if(txt){
					alert("삭제되었습니다.");
					location.reload();
				} else {
					alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
	// 댓글 삭제 완료
	function replyCommit(){
		$.ajax({
			type : "post",
			url : "/review/replyRemove/"+replyNum,
			async : false,
			success : function(txt){
				if(txt){
					alert("삭제되었습니다.");
					location.reload();
				} else {
					alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
				}
			}
		});
	}
</script>