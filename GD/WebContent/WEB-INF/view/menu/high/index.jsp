<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="choice">
	<select id="align" style="margin-left: 500px">
		<c:choose>
			<c:when test="${align == 'total' }">
				<option value="total" selected="selected">종합평점 높은순</option>
				<option value="point">리뷰평점 높은순</option>
				<option value="search">조회 많은순</option>
				<option value="reply">댓글 많은순</option>
			</c:when>
			<c:when test="${align == 'point' }">
				<option value="total">종합평점 높은순</option>
				<option value="point" selected="selected">리뷰평점 높은순</option>
				<option value="search">조회 많은순</option>
				<option value="reply">댓글 많은순</option>
			</c:when>
			<c:when test="${align == 'search' }">
				<option value="total">종합평점 높은순</option>
				<option value="point">리뷰평점 높은순</option>
				<option value="search" selected="selected">조회 많은순</option>
				<option value="reply">댓글 많은순</option>
			</c:when>
			<c:when test="${align == 'reply' }">
				<option value="total">종합평점 높은순</option>
				<option value="point">리뷰평점 높은순</option>
				<option value="search">조회 많은순</option>
				<option value="reply" selected="selected">댓글 많은순</option>
			</c:when>
			<c:otherwise>
				<option value="total">종합평점 높은순</option>
				<option value="point">리뷰평점 높은순</option>
				<option value="search">조회 많은순</option>
				<option value="reply">댓글 많은순</option>
			</c:otherwise>
		</c:choose>
	</select>
	<div class="search_box">
		<c:choose>
			<c:when test="${list.size()>0 }">
				<div class="txt" onclick="searchAlign()">검색</div>
			</c:when>
			<c:otherwise>
				<div class="txt">검색</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<c:choose>
	<c:when test="${list.size()>0 }">
		<div class="info10 elem" id="eleList">
			<div class="tit_wrap">
				<div class="txt" style="font-weight: normal; letter-spacing: normal; display: inline-block">고등학원</div>
				<div class="underline" style="display: inline-block; margin: 0 auto 5px"></div>
			</div>
			<c:forEach var="i" begin="0" end="${list.size()-1<27 ? list.size()-1 : 27 }" step="3">
				<c:choose>
					<c:when test="${i==0 }">
						<div class="academy big">
							<div class="number">${i+1 }.</div>
							<div class="img_wrap">
								<div class="img" onclick="academy(${list.get(i).NUM })" 
										style="background-image: url('/logo/${list.get(i).LOGO }'); background-size: 100%; 
					                   				background-position: center center; background-repeat: no-repeat; background-color: white"></div>
								<div class="name">${list.get(i).NAME }</div>
								<div class="sub">수업과목 : ${list.get(i).SUBJECT }</div>
							</div>
						</div>
					</c:when>
					<c:when test="${i<9 }">
						<div class="academy mid">
							<div class="number">${i+1 }.</div>
							<div class="img_wrap">
								<div class="img" onclick="academy(${list.get(i).NUM })">
									<div
										style="background-image: url('/logo/${list.get(i).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: white;
																				float: left; width: 100%; height: 50px">
									</div>
									<div
										style="float: right; width: 100%; font-size: 15px; background-color: white; color: black">${list.get(i).NAME }</div>
								</div>
								<div class="sub">수업과목 : ${list.get(i).SUBJECT }</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="academy low">
							<div class="number">${i+1 }.</div>
							<div class="txt" onclick="academy(${list.get(i).NUM })">${list.get(i).NAME }</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="info10 mid">
			<div class="tit_wrap" style="visibility: hidden;">
				<div class="txt" style="font-weight: normal; letter-spacing: normal; display: inline-block">중등학원</div>
				<div class="underline" style="display: inline-block; margin: 0 auto 5px"></div>
			</div>
			<c:forEach var="i" begin="1" end="${list.size()-1<28 ? list.size()-1 : 28 }" step="3">
				<c:choose>
					<c:when test="${i==1 }">
						<div class="academy big">
							<div class="number">${i+1 }.</div>
							<div class="img_wrap">
								<div class="img" onclick="academy(${list.get(i).NUM })" 
										style="background-image: url('/logo/${list.get(i).LOGO }'); background-size: 100%; 
					                   				background-position: center center; background-repeat: no-repeat; background-color: #f7f7f7"></div>
								<div class="name">${list.get(i).NAME }</div>
								<div class="sub">수업과목 : ${list.get(i).SUBJECT }</div>
							</div>
						</div>
					</c:when>
					<c:when test="${i<10 }">
						<div class="academy mid">
							<div class="number">${i+1 }.</div>
							<div class="img_wrap">
								<div class="img" onclick="academy(${list.get(i).NUM })">
									<div
										style="background-image: url('/logo/${list.get(i).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: white;
																				float: left; width: 100%; height: 50px">
									</div>
									<div
										style="float: right; width: 100%; font-size: 15px; background-color: #f7f7f7; color: black">${list.get(i).NAME }</div>
								</div>
								<div class="sub">수업과목 : ${list.get(i).SUBJECT }</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="academy low">
							<div class="number">${i+1 }.</div>
							<div class="txt" onclick="academy(${list.get(i).NUM })">${list.get(i).NAME }</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div class="info10 high">
			<div class="tit_wrap" style="visibility: hidden;">
				<div class="txt" style="font-weight: normal; letter-spacing: normal; display: inline-block">고등학원</div>
				<div class="underline" style="display: inline-block; margin: 0 auto 5px"></div>
			</div>
			<c:forEach var="i" begin="2" end="${list.size()-1<29 ? list.size()-1 : 29 }" step="3">
				<c:choose>
					<c:when test="${i==2 }">
						<div class="academy big">
							<div class="number">${i+1 }.</div>
							<div class="img_wrap">
								<div class="img" onclick="academy(${list.get(i).NUM })" 
										style="background-image: url('/logo/${list.get(i).LOGO }'); background-size: 100%; 
					                   				background-position: center center; background-repeat: no-repeat; background-color: white"></div>
								<div class="name">${list.get(i).NAME }</div>
								<div class="sub">수업과목 : ${list.get(i).SUBJECT }</div>
							</div>
						</div>
					</c:when>
					<c:when test="${i<11 }">
						<div class="academy mid">
							<div class="number">${i+1 }.</div>
							<div class="img_wrap">
								<div class="img" onclick="academy(${list.get(i).NUM })">
									<div
										style="background-image: url('/logo/${list.get(i).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: white;
																				float: left; width: 100%; height: 50px">
									</div>
									<div
										style="float: right; width: 100%; font-size: 15px; background-color: white; color: black">${list.get(i).NAME }</div>
								</div>
								<div class="sub">수업과목 : ${list.get(i).SUBJECT }</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="academy low">
							<div class="number">${i+1 }.</div>
							<div class="txt" onclick="academy(${list.get(i).NUM })">${list.get(i).NAME }</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</c:when>
	<c:otherwise>
		<div align="center" style="margin-bottom: 30px">
			<br />
			<label>표시할 학원이 없습니다.</label>
		</div>
	</c:otherwise>
</c:choose>

<script>
	// 학원 검색
	function searchAlign(){
		var align = $("#align").val();
		$.ajax({
			type : "post",
			url : "/main/searchAlign/"+align+"/${type }",
			async : false,
			success : function(txt){
				$("#infoDiv").html(txt);
			}
		});
	}
</script>