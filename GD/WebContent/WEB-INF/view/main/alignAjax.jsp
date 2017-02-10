<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tit_wrap">
	<div class="txt">${alignAcaName }학원</div>
	<div class="underline"></div>
</div>
<c:forEach var="t" begin="0" end="${list.size()-1 }">
	<c:choose>
		<c:when test="${t<3 }">
			<div class="academy big">
				<div class="number">${t+1 }.</div>
				<div class="img_wrap">
					<c:choose>
						<c:when test="${alignAcaName=='중등' }">
							<div class="img" onclick="academy(${list.get(t).NUM })"
								style="background-image: url('/logo/${list.get(t).LOGO }'); background-size: 100%; 
					                                    				background-position: center center; background-repeat: no-repeat; background-color: #f7f7f7">
							</div>
						</c:when>
						<c:otherwise>
							<div class="img" onclick="academy(${list.get(t).NUM })"
								style="background-image: url('/logo/${list.get(t).LOGO }'); background-size: 100%; 
					                                    				background-position: center center; background-repeat: no-repeat; background-color: white">
							</div>
						</c:otherwise>
					</c:choose>
					<div class="name">${list.get(t).NAME }</div>
					<div class="sub">수업과목 : ${list.get(t).SUBJECT }</div>
				</div>
			</div>
		</c:when>
		<c:when test="${t<5 }">
			<div class="academy mid">
				<div class="number">${t+1 }.</div>
				<div class="img_wrap">
					<div class="img" onclick="academy(${list.get(t).NUM })">
						<c:choose>
							<c:when test="${alignAcaName=='중등' }">
								<div
									style="background-image: url('/logo/${list.get(t).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: #f7f7f7;
																				float: left; width: 100%; height: 50px">
								</div>
								<div
									style="float: right; width: 100%; font-size: 15px; background-color: #f7f7f7; color: black">${list.get(t).NAME }</div>
							</c:when>
							<c:otherwise>
								<div
									style="background-image: url('/logo/${list.get(t).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: white;
																				float: left; width: 100%; height: 50px">
								</div>
								<div
									style="float: right; width: 100%; font-size: 15px; background-color: white; color: black">${list.get(t).NAME }</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="sub">수업과목 : ${list.get(t).SUBJECT }</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="academy low">
				<div class="number">${t+1 }.</div>
				<div class="txt" onclick="academy(${list.get(t).NUM})"
					style="cursor: pointer;">${list.get(t).NAME }</div>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach>