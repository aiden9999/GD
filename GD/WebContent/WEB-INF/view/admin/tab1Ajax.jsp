<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tit">상세정보</div>
<div class="info_wrap">
	<div class="tit">아이디</div>
	<div class="txt" id="id">${memberList.get(0).ID }</div>
</div>
<div class="info_wrap">
	<div class="tit">이름</div>
	<div class="txt">${memberList.get(0).NAME }</div>
</div>
<div class="info_wrap">
	<div class="tit">필명</div>
	<div class="txt">${memberList.get(0).NICK }</div>
</div>
<div class="info_wrap">
	<div class="tit">구분</div>
	<div class="txt" id="what">${memberList.get(0).WHAT }</div>
</div>
<div class="info_wrap">
	<div class="tit">등급</div>
	<div class="txt" id="grade">${memberList.get(0).GRADE }</div>
</div>
<div class="info_wrap">
	<div class="tit">전화번호</div>
	<div class="txt">${memberList.get(0).PHONE }</div>
</div>
<div class="info_wrap">
	<div class="tit">이메일</div>
	<div class="txt">${memberList.get(0).EMAIL }</div>
</div>
<c:choose>
	<c:when test="${login.ID == 'admin' }">
		<c:choose>
			<c:when test="${memberList.get(0).ADMIN == '메인관리자' }">
				<div class="info_wrap checks" style="display: none">
					<input type="radio" id="giveAdmin" name="admin" checked="checked">
					<label for="giveAdmin" class="tit"
						style="width: 145px; float: left">중간관리자 권한부여</label>
				</div>
				<div class="info_wrap checks" style="display: none">
					<input type="radio" id="acaAdmin" name="admin"> <label
						for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks" style="display: none">
					<input type="radio" id="delAdmin" name="admin"> <label
						for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:when>
			<c:when test="${memberList.get(0).ADMIN == '중간관리자' }">
				<div class="info_wrap checks">
					<input type="radio" id="giveAdmin" name="admin" checked="checked">
					<label for="giveAdmin" class="tit"
						style="width: 145px; float: left">중간관리자 권한부여</label>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="acaAdmin" name="admin"> <label
						for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="delAdmin" name="admin"> <label
						for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:when>
			<c:when test="${memberList.get(0).ADMIN == '학원관리자' }">
				<div class="info_wrap checks">
					<input type="radio" id="giveAdmin" name="admin"> <label
						for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자
						권한부여</label>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="acaAdmin" name="admin" checked="checked">
					<label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="delAdmin" name="admin"> <label
						for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:when>
			<c:otherwise>
				<div class="info_wrap checks">
					<input type="radio" id="giveAdmin" name="admin"> <label
						for="giveAdmin" class="tit" style="width: 145px; float: left">중간관리자
						권한부여</label>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="acaAdmin" name="admin"> <label
						for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="delAdmin" name="admin" checked="checked">
					<label for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${memberList.get(0).ADMIN == '메인관리자' }">
				<div class="info_wrap checks" style="display: none">
					<input type="radio" id="giveAdmin" name="admin" checked="checked">
					<label for="giveAdmin" class="tit"
						style="width: 145px; float: left">중간관리자 권한부여</label>
				</div>
				<div class="info_wrap checks" style="display: none">
					<input type="radio" id="acaAdmin" name="admin"> <label
						for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks" style="display: none">
					<input type="radio" id="delAdmin" name="admin" disabled="disabled"> <label
						for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:when>
			<c:when test="${memberList.get(0).ADMIN == '중간관리자' }">
				<div class="info_wrap checks">
					<input type="radio" id="giveAdmin" name="admin" checked="checked"
						disabled="disabled"> <label for="giveAdmin" class="tit"
						style="width: 145px; float: left">중간관리자 권한부여</label>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="acaAdmin" name="admin" disabled="disabled">
					<label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="delAdmin" name="admin" disabled="disabled"> <label
						for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:when>
			<c:when test="${memberList.get(0).ADMIN == '학원관리자' }">
				<div class="info_wrap checks">
					<input type="radio" id="giveAdmin" name="admin" disabled="disabled">
					<label for="giveAdmin" class="tit"
						style="width: 145px; float: left">중간관리자 권한부여</label>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="acaAdmin" name="admin" checked="checked"
						disabled="disabled"> <label for="acaAdmin" class="tit"
						style="width: 145px; float: left">학원관리자 권한부여</label> <select
						id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="delAdmin" name="admin" disabled="disabled"> <label
						for="delAdmin" class="tit" style="width: 145px; float: left">권한없음</label>
				</div>
			</c:when>
			<c:otherwise>
				<div class="info_wrap checks">
					<input type="radio" id="giveAdmin" name="admin" disabled="disabled">
					<label for="giveAdmin" class="tit"
						style="width: 145px; float: left">중간관리자 권한부여</label>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="acaAdmin" name="admin" disabled="disabled">
					<label for="acaAdmin" class="tit" style="width: 145px; float: left">학원관리자
						권한부여</label> <select id="acaSelect"
						style="width: 140px; height: 25px; padding-left: 5px; display: none">
						<option value="choose">선택</option>
						<c:forEach var="t" items="${acaList }">
							<option value="${t.NUM }">${t.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="info_wrap checks">
					<input type="radio" id="delAdmin" name="admin" checked="checked"
						disabled="disabled"> <label for="delAdmin" class="tit"
						style="width: 145px; float: left">권한없음</label>
				</div>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
<div class="cannext_wrap" style="margin: 70px 0">
	<div class="btn cancel" onclick="location.href='/'">취 소</div>
	<c:choose>
		<c:when test="${memberList.get(0).NAME=='관리자' }">
			<div class="btn next" style="cursor: default;">저 장</div>
		</c:when>
		<c:otherwise>
			<div class="btn next" onclick="tab1Save()">저 장</div>
		</c:otherwise>
	</c:choose>
</div>

<script>
	//학원관리자 선택시 학원리스트 show
	$("#giveAdmin").change(function(){
		$("#acaSelect").hide();
		$("#acaSelect").val("choose");
	});
	$("#acaAdmin").change(function(){
		$("#acaSelect").show();
	});
	$("#delAdmin").change(function(){
		$("#acaSelect").hide();
		$("#acaSelect").val("choose");
	});
</script>