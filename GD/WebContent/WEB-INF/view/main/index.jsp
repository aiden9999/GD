<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel='stylesheet' type='text/css'>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta name="robots" content="follow">
<meta name="description"
	content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
<meta name="keywords" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
<meta property="og:type" content="website">
<meta property="og:title" content="강남대치학원 멘토클리닉">
<meta property="og:description"
	content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
<meta property="og:image" content="http://www.mysite.com/myimage.jpg">
<meta property="og:url" content="http://mentorschool.co.kr">
<title></title>

<style>
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/js/common.js"></script>
<script src="/socket/sockjs-0.3.4.js"></script>
</head>

<body>
	<header>
		<c:import url="/WEB-INF/view/main/mainHeader.jsp"/>
	</header>
	<div class="main">
		<div class="inner" style="display: inline-block; left: 50%; transform: translateX(-50%)">
			<div class="contents">
				<div class="main_slider">
					<div class="main_slider_inner">
						<div class="main_slide main_slide_sel">
							<img src="/img/main_slide1.png">
						</div>
						<div class="main_slide">
							<img src="/img/main_slide1.png">
						</div>
						<div class="main_slide">
							<img src="/img/main_slide1.png">
						</div>
						<div class="main_slide">
							<img src="/img/main_slide1.png">
						</div>
						<div class="main_slide">
							<img src="/img/main_slide1.png">
						</div>
					</div>
					<div class="circle_wrap">
						<div class="slide_circle circle_sel"></div>
						<div class="slide_circle"></div>
						<div class="slide_circle"></div>
						<div class="slide_circle"></div>
						<div class="slide_circle"></div>
					</div>
				</div>
				<div class="rec">
					<div class="tit">
						<div class="circle"></div>
						<div class="txt">이달의 추천학원</div>
					</div>
					<div class="container">
						<div class="sub_tit" id="recom">초등</div>
						<div class="arrow_wrap">
							<div class="rec_arrow rec_arrow_prev">
								<img src="/img/arrow_prev.png" onclick="prev()" id="recPrev"
									style="display: none">
							</div>
							<div class="rec_arrow rec_arrow_next">
								<img src="/img/arrow_next.png" onclick="next()" id="recNext">
							</div>
						</div>
						<div class="rec_slider">
							<div class="rec_slider_inner" id="inner1">
								<c:forEach var="t" items="${recAca }">
									<div class="rec_slide">
                                 		<div class="img" onclick="academy(${t.NUM })" style="background-image: url('/logo/${t.LOGO }')"></div>
										<div class="txt" onclick="academy(${t.NUM })">${t.NAME }</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="info" id="infoDiv">
					<div class="tit" style="display: inline-block; width: 702px">
						<div class="circle"></div>
						<div class="txt" style="float: left">입시정보</div>
						<select id="examSelect" style="float: right">
							<option value="high">고등입시</option>
							<option value="univ">대학입시</option>
						</select>
					</div>
					<c:choose>
						<c:when test="${highExam.size()>0 }">
							<div class="container" id="highExamCon">
								<c:forEach var="t" begin="0" end="${highExam.size()-1<4 ? highExam.size()-1 : 4 }">
									<div class="txt_wrap">
										<div class="dot"></div>
										<c:choose>
											<c:when test="${login!=null }">
												<div class="txt" onclick="information('${highExam.get(t).AUTO}', '${highExam.get(t).TYPE }')">
													<c:choose>
														<c:when test="${highExam.get(t).TITLE.length()>40 }">
															${highExam.get(t).TITLE }...
														</c:when>
														<c:otherwise>
															${highExam.get(t).TITLE }
														</c:otherwise>
													</c:choose>
												</div>
											</c:when>
											<c:otherwise>
												<div class="txt" style="cursor: default;">
													<c:choose>
														<c:when test="${highExam.get(t).TITLE.length()>40 }">
															${highExam.get(t).TITLE }...
														</c:when>
														<c:otherwise>
															${highExam.get(t).TITLE }
														</c:otherwise>
													</c:choose>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
								<div class="plus" onclick="location.href='/highExam'">더보기+</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="container" id="highExamCon">
								<div class="txt_wrap" align="center" style="margin-top: 50px">
									<div class="txt" style="cursor: default;">
										글이 없습니다.
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${univExam.size()>0 }">
							<div class="container" id="univExamCon" style="display: none">
								<c:forEach var="t" begin="0" end="${univExam.size()-1<4 ? univExam.size()-1 : 4 }">
									<div class="txt_wrap">
										<div class="dot"></div>
										<c:choose>
											<c:when test="${login!=null }">
												<div class="txt" onclick="information('${univExam.get(t).AUTO}', '${univExam.get(t).TYPE }')">
													<c:choose>
														<c:when test="${univExam.get(t).TITLE.length()>40 }">
															${univExam.get(t).TITLE }...
														</c:when>
														<c:otherwise>
															${univExam.get(t).TITLE }
														</c:otherwise>
													</c:choose>
												</div>
											</c:when>
											<c:otherwise>
												<div class="txt" style="cursor: default;">
													<c:choose>
														<c:when test="${univExam.get(t).TITLE.length()>40 }">
															${univExam.get(t).TITLE }...
														</c:when>
														<c:otherwise>
															${univExam.get(t).TITLE }
														</c:otherwise>
													</c:choose>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
								<div class="plus" onclick="location.href='/univExam'">더보기+</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="container" id="univExamCon" style="display: none">
								<div class="txt_wrap" align="center" style="margin-top: 50px">
									<div class="txt" style="cursor: default;">
										글이 없습니다.
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="choice">
						<select id="align" style="margin-left: 500px">
							<option value="total">종합평점 높은순</option>
							<option value="point">리뷰평점 높은순</option>
							<option value="search">조회 많은순</option>
							<option value="reply">댓글 많은순</option>
						</select>
						<div class="search_box">
							<div class="txt" onclick="searchAcademy()">검색</div>
						</div>
					</div>
					<div class="info10 elem" id="eleList">
						<div class="tit_wrap">
							<div class="txt">초등학원</div>
							<div class="underline"></div>
						</div>
						<c:choose>
							<c:when test="${ele.size()>0 }">
								<c:forEach var="t" begin="0" end="${ele.size()-1 }">
									<c:choose>
										<c:when test="${t<3 }">
											<div class="academy big">
												<div class="number">${t+1 }.</div>
												<div class="img_wrap">
													<div class="img" onclick="academy(${ele.get(t).NUM })"
														style="background-image: url('/logo/${ele.get(t).LOGO }'); background-size: 100%; 
					                                    				background-position: center center; background-repeat: no-repeat; background-color: white">
													</div>
													<div class="name">${ele.get(t).NAME }</div>
													<div class="sub">수업과목 : ${ele.get(t).SUBJECT }</div>
												</div>
											</div>
										</c:when>
										<c:when test="${t<5 }">
											<div class="academy mid">
												<div class="number">${t+1 }.</div>
												<div class="img_wrap">
													<div class="img" onclick="academy(${ele.get(t).NUM })">
														<div
															style="background-image: url('/logo/${ele.get(t).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: white;
																				float: left; width: 100%; height: 50px">
														</div>
														<div
															style="float: right; width: 100%; font-size: 15px; background-color: white; color: black">${ele.get(t).NAME }</div>
													</div>
													<div class="sub">수업과목 : ${ele.get(t).SUBJECT }</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="academy low">
												<div class="number">${t+1 }.</div>
												<div class="txt" onclick="academy(${ele.get(t).NUM})"
													style="cursor: pointer;">${ele.get(t).NAME }</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div align="center" style="margin-bottom: 30px">
									<br/><label>표시할 학원이 없습니다.</label>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="info10 mid" id="midList">
						<div class="tit_wrap">
							<div class="txt">중등학원</div>
							<div class="underline"></div>
						</div>
						<c:choose>
							<c:when test="${mid.size()>0 }">
								<c:forEach var="t" begin="0" end="${mid.size()-1 }">
									<c:choose>
										<c:when test="${t<3 }">
											<div class="academy big">
												<div class="number">${t+1 }.</div>
												<div class="img_wrap">
													<div class="img" onclick="academy(${mid.get(t).NUM })"
														style="background-image: url('/logo/${mid.get(t).LOGO }'); background-size: 100%; 
					                                    				background-position: center center; background-repeat: no-repeat; background-color: #f7f7f7">
													</div>
													<div class="name">${mid.get(t).NAME }</div>
													<div class="sub">수업과목 : ${mid.get(t).SUBJECT }</div>
												</div>
											</div>
										</c:when>
										<c:when test="${t<5 }">
											<div class="academy mid">
												<div class="number">${t+1 }.</div>
												<div class="img_wrap">
													<div class="img" onclick="academy(${mid.get(t).NUM })">
														<div
															style="background-image: url('/logo/${mid.get(t).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: #f7f7f7;
																				float: left; width: 100%; height: 50px">
														</div>
														<div
															style="float: right; width: 100%; font-size: 15px; background-color: #f7f7f7; color: black">${mid.get(t).NAME }</div>
													</div>
													<div class="sub">수업과목 : ${mid.get(t).SUBJECT }</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="academy low">
												<div class="number">${t+1 }.</div>
												<div class="txt" onclick="academy(${mid.get(t).NUM})"
													style="cursor: pointer;">${mid.get(t).NAME }</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div align="center" style="margin-bottom: 30px">
									<br/><label>표시할 학원이 없습니다.</label>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="info10 high" id="higList">
						<div class="tit_wrap">
							<div class="txt">고등학원</div>
							<div class="underline"></div>
						</div>
						<c:choose>
							<c:when test="${hig.size()>0 }">
								<c:forEach var="t" begin="0" end="${hig.size()-1 }">
									<c:choose>
										<c:when test="${t<3 }">
											<div class="academy big">
												<div class="number">${t+1 }.</div>
												<div class="img_wrap">
													<div class="img" onclick="academy(${hig.get(t).NUM })"
														style="background-image: url('/logo/${hig.get(t).LOGO }'); background-size: 100%; 
					                                    				background-position: center center; background-repeat: no-repeat; background-color: white">
													</div>
													<div class="name">${hig.get(t).NAME }</div>
													<div class="sub">수업과목 : ${hig.get(t).SUBJECT }</div>
												</div>
											</div>
										</c:when>
										<c:when test="${t<5 }">
											<div class="academy mid">
												<div class="number">${t+1 }.</div>
												<div class="img_wrap">
													<div class="img" onclick="academy(${hig.get(t).NUM })">
														<div
															style="background-image: url('/logo/${hig.get(t).LOGO}'); background-size: 100%;
																				background-position: center center; background-repeat: no-repeat; background-color: white;
																				float: left; width: 100%; height: 50px">
														</div>
														<div
															style="float: right; width: 100%; font-size: 15px; background-color: white; color: black">${hig.get(t).NAME }</div>
													</div>
													<div class="sub">수업과목 : ${hig.get(t).SUBJECT }</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="academy low">
												<div class="number">${t+1 }.</div>
												<div class="txt" onclick="academy(${hig.get(t).NUM})"
													style="cursor: pointer;">${hig.get(t).NAME }</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div align="center" style="margin-bottom: 30px">
									<br/><label>표시할 학원이 없습니다.</label>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<aside>
				<c:choose>
					<c:when test="${login!=null }">
						<div class="login_wrap login_on">
							<div class="login_section">
								<div class="greeting">
									<span>${login.NICK }</span>님 환영합니다.
								</div>
								<div class="member_wrap">
									<div class="member_inner">
										<div class="trophy_wrap sub_box">
											<div class="img">
												<img src="img/trophy.png">
											</div>
											<div class="txt" style="cursor: default;">
												등급<span> ${login.GRADE }</span>
											</div>
										</div>
										<div class="point_wrap sub_box">
											<div class="img">
												<img src="img/point.png">
											</div>
											<div class="txt" style="cursor: default;">
												방문일수<span> ${login.VISIT }</span>
											</div>
										</div>
										<div class="write_wrap sub_box">
											<div class="img">
												<img src="img/page.png">
											</div>
											<div class="txt" onclick="board()">
												내 글<span> ${myBoard }</span>
											</div>
										</div>
										<div class="reply_wrap sub_box">
											<div class="img">
												<img src="img/reply.png">
											</div>
											<div class="txt" onclick="reply()">
												내 댓글<span> ${myReply }</span>
											</div>
										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${login.ADMIN=='메인관리자' || login.ADMIN=='중간관리자' }">
										<div class="logout_wrap" style="width: 247px; display: inline-block; left: 50%; transform: translateX(-50%)">
											<div class="txt" onclick="location.href='/admin'" style="width: 33.33%; text-align: center; float: left">관리자페이지</div>
											<div class="txt" onclick="info()" style="width: 33.33%; text-align: center; float: left">내 정보</div>
											<div class="txt" onclick="logout()" style="width: 33.33%; text-align: center; margin-left: 0px">로그아웃</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="logout_wrap" style="width: 247px; display: inline-block; left: 50%; transform: translateX(-50%)">
											<div class="txt" onclick="info()" style="width: 50%; text-align: center; float: left">내 정보</div>
											<div class="txt" onclick="logout()" style="width: 50%; text-align: center; margin-left: 0px">로그아웃</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="login_wrap">
							<div class="logo">
								<span>L</span>ogo
							</div>
							<div class="login_box">
								<div class="id_box" style="margin-top: 2px">
									<c:choose>
										<c:when test="${save!=null }">
											<!-- 아이디 저장 -->
											<div class="id">
												<input type="text" id="user_id" placeholder="아이디"
													maxlength="12" value="${save }">
											</div>
											<div class="id pw">
												<input type="password" id="pw" placeholder="비밀번호"
													maxlength="16">
											</div>
										</c:when>
										<c:otherwise>
											<!-- 기본 -->
											<div class="id">
												<input type="text" id="user_id" placeholder="아이디"
													maxlength="12">
											</div>
											<div class="id pw">
												<input type="password" id="pw" placeholder="비밀번호"
													maxlength="16">
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="submit">
									<input type="button" value="로그인" onclick="login()">
								</div>
							</div>
							<div align="center" style="display: none" id="loginFail">
								<font style="color: red; font-size: 12px">아이디/비밀번호를
									확인해주세요.</font>
							</div>
							<div class="txt_wrap">
								<div class="txt" onclick="searchId()">아이디/비밀번호찾기</div>
								<div class="txt" onclick="join()">회원가입</div>
							</div>
							<div class="check_box">
								<label class="check"> <input type="checkbox" name="pre"
									value="auto" id="auto">
									<div class="txt">자동 로그인</div>
								</label> <label class="check"> <c:choose>
										<c:when test="${save!=null }">
											<input type="checkbox" name="pre" value="save" id="save"
												checked="checked">
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="pre" value="save" id="save">
										</c:otherwise>
									</c:choose>
									<div class="txt">아이디 저장</div>
								</label>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="board_wrap notice_wrap">
					<div class="tit_wrap">
						<div class="tit">
							<div class="txt">공지사항</div>
							<div class="img">
								<img src="/img/new.png">
							</div>
						</div>
						<div class="more" onclick="more('notice')">더보기+</div>
					</div>
					<div class="txt_box">
						<c:choose>
							<c:when test="${notice.size()>0 }">
								<c:forEach var="t" begin="0" end="${notice.size()-1<3 ? notice.size()-1 : 3 }">
									<div class="txt_wrap">
										<div class="dot"></div>
										<c:choose>
											<c:when test="${login!=null }">
												<div class="txt" onclick="notice(${notice.get(t).AUTO})" style="cursor: pointer; font-weight: normal;"
														onmouseover="mouseOver(${t })" onmouseleave="mouseLeave(${t })" id="notice${t }">
													<c:choose>
														<c:when test="${notice.get(t).TITLE.length()>20 }">
															${notice.get(t).TITLE.substring(0, 20 }...
														</c:when>
														<c:otherwise>
															${notice.get(t).TITLE }
														</c:otherwise>
													</c:choose>
												</div>
											</c:when>
											<c:otherwise>
												<div class="txt" style="font-weight: normal;" id="notice${t }">
													<c:choose>
														<c:when test="${notice.get(t).TITLE.length()>20 }">
															${notice.get(t).TITLE.substring(0, 20 }...
														</c:when>
														<c:otherwise>
															${notice.get(t).TITLE }
														</c:otherwise>
													</c:choose>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="txt_wrap" align="center">
									<div class="txt" style="cursor: default;">
										글이 없습니다.
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="banner">
					<img src="/img/banner1.png">
				</div>
<!-- 				<div class="chat_wrap"> -->
<!-- 					<div class="tit_wrap"> -->
<!-- 						<div class="img"> -->
<!-- 							<img src="/img/talk.png"> -->
<!-- 						</div> -->
<!-- 						<div class="txt">실시간 채팅</div> -->
<!-- 					</div> -->
<!-- 					<div class="txt_box"> -->
<!-- 						채팅창에 표시할때 내 아이디는 색 다르게 -->
<!-- 						<div class="txt" id="chat" -->
<!-- 							style="max-height: 280px; overflow-y: auto"></div> -->
<!-- 					</div> -->
<!-- 					<div class="submit_wrap"> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${login==null }"> --%>
<!-- 								<div class="txt"> -->
<!-- 									<input type="text" id="txt" placeholder="채팅에 참여하시려면 로그인을 해주세요." -->
<!-- 										maxlength="38" readonly="readonly"> -->
<!-- 								</div> -->
<!-- 								<div class="submit"> -->
<!-- 									<input type="button" value="전송" disabled="disabled"> -->
<!-- 								</div> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<div class="txt"> -->
<!-- 									<input type="text" id="txt" placeholder="채팅을 입력하세요." -->
<!-- 										maxlength="38" style="font-size: 12px"> -->
<!-- 								</div> -->
<!-- 								<div class="submit"> -->
<!-- 									<input type="button" value="전송" onclick="send()"> -->
<!-- 								</div> -->
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="board_wrap chatter_wrap">
					<div class="tit_wrap">
						<div class="tit">
							<div class="txt">자유 수다방</div>
							<div class="img">
								<img src="/img/new1.png">
							</div>
						</div>
						<div class="more" onclick="more('waggle')">더보기+</div>
					</div>
					<div class="txt_box">
						<c:choose>
							<c:when test="${waggle.size()>0 }">
								<c:forEach var="t" begin="0" end="${waggle.size()-1<3 ? waggle.size()-1 : 3 }">
									<div class="txt_wrap">
										<div class="dot"></div>
										<div class="txt" style="font-weight: normal;">
											<c:choose>
												<c:when test="${waggle.get(t).CONTENT.length()>20 }">
													${waggle.get(t).CONTENT.substring(0, 20 }...
												</c:when>
												<c:otherwise>
													${waggle.get(t).CONTENT }
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="txt_wrap" align="center">
									<div class="txt" style="cursor: default;">
										글이 없습니다.
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
				<div class="banner">
					<img src="/img/banner2.png">
				</div>
				<div class="banner">
					<img src="/img/banner3.png">
				</div>
			</aside>
		</div>
	</div>
	<footer>
		<c:import url="/WEB-INF/view/main/footer.jsp"/>
	</footer>
</body>

<script>
	// 홈페이지 접속시 웹소캣 서버 연결
	//     	var socket;
	//     	$(document).ready(function(){
	//     		socket = new SockJS("/chatSocket/chatSocket");
	//     		socket.onmessage = onMessage;
	//     		socket.onclose = onClose;
	//     	});
	// top 메뉴 초등,중등,고등학원 눌렸는지 판단
	$(document).ready(function(){
		var type = "${type}";
		if(type=="초등"){
			$("#menuEle").trigger("click");
		} else if(type=="중등"){
			$("#menuMid").trigger("click");
		} else if(type=="고등"){
			$("#menuHig").trigger("click");
		} else if(type=="재수"){
			$("#menuMis").trigger("click");
		}
	});
	// 검색란에서 엔터입력
	$("#hsearch").keyup(function(txt) {
		if (txt.keyCode == 13) {
			var search = $("#hsearch").val();
			if (search != "") {
				location.href = "/search/" + search;
			}
		}
	});
	// 검색버튼 클릭
	function search() {
		var search = $("#hsearch").val();
		if (search != "") {
			location.href = "/search/" + search;
		}
	}
	// 입시정보 글 클릭
	function information(num) {
		// num을 가지고 입시정보 게시판 상세보기 페이지로 이동
		var type = $("#examSelect").val();
		location.href="/"+type+"Exam/view/"+num;
	}
	// 학원 클릭
	function academy(num) {
		// num을 가지고 해당학원 페이지로 이동
		location.href = "/academy/" + num;
	}
	// 학원 검색
	function searchAcademy() {
		var align = $("#align").val();
		$.ajax({
			type : "post",
			url : "/main/alignAjax/"+align+"/"+0,
			async : false,
			success : function(txt){
				$.ajax({
					type : "post",
					url : "/main/alignAjax/"+align+"/"+1,
					async : false,
					success : function(txt){
						$.ajax({
							type : "post",
							url : "/main/alignAjax/"+align+"/"+2,
							async : false,
							success : function(txt){
								$("#higList").html(txt);
							}
						});
						$("#midList").html(txt);
					}
				});
				$("#eleList").html(txt);
			}
		});
	}
	// 로그인
	function login() {
		var id = $("#user_id").val();
		var pw = $("#pw").val();
		var auto = $("#auto").prop("checked");
		var save = $("#save").prop("checked");
		$.ajax({
			type : "post",
			url : "/login/" + id + "/" + pw + "/" + auto + "/" + save,
			async : false,
			success : function(txt) {
				if (txt) {
					location.href = "/";
					$("#loginFail").hide();
				} else {
					$("#loginFail").show();
				}
			}
		});
	}
	// 비밀번호에서 엔터
	$("#pw").keyup(function(txt) {
		if (txt.keyCode == 13) {
			login();
		}
	});
	// 자동로그인 클릭
	$("#auto").change(function() {
		if ($("#auto").prop("checked")) {
			$("#save").prop("checked", false);
		}
	});
	// 아이디/비밀번호 찾기
	function searchId() {
		location.href = "/member/search";
	}
	// 회원가입
	function join() {
		location.href = "/join";
	}
	// 로그아웃
	function logout() {
		location.href = "/logout";
	}
	// 더보기
	function more(txt) {
		if (txt == "notice") {
			location.href = "/notice";
		} else if (txt == "waggle") {
			location.href="/waggle";
		}
	}
	// 채팅 전송
	//     	function send(){
	//     		var txt = $("#txt").val();
	//     		if(txt!=""){
	// 	    		socket.send(txt);
	// 	    		$("#txt").val("");
	// 	    		$("#chat").scrollTop(999999);
	//     		}
	//     	}
	// 채팅창에서 엔터입력
	//     	$("#txt").keyup(function(txt){
	//     		if(txt.keyCode==13){
	//     			if($("#txt").val()!=""){
	// 	    			socket.send("${login.ID }~!@id#$%"+$("#txt").val());
	// 	    			$("#txt").val("");
	// 	    			$("#chat").scrollTop(999999);
	//     			}
	//     		}
	//     	});
	// 채팅창 키 누르고있을 때
	//     	$("#txt").keypress(function(txt){
	//     		if(txt.length>38){
	//     			$("#txt").val(txt.substring(0, 38));
	//     		}
	//     	});
	// 채팅 수신
	//     	function onMessage(e){
	//     		var html = $("#chat").html();
	//     		if(html!=""){
	//     			$("#chat").html(html+"<br/>"+e.data);
	//     		} else {
	// 	    		$("#chat").html(html+e.data);
	//     		}
	//     		$("#chat").scrollTop(999999);
	//     	}
	// 웹소켓 연결 종료
	//     	function onClose(){
	//     		console.log("연결 종료");
	//     	}
	// 공지사항
	function notice(num) {
		location.href="/notice/view/"+num;
	}
	// 자유 수다방
	function waggle(num) {
		alert(num.innerHTML);
	}
	// 이전
	function prev() {
		var recom = $("#recom").html();
		if (recom == "초등") {
			$("#recom").html("고등");
			$("#recPrev").show();
			$("#recNext").hide();
		} else if (recom == "중등") {
			$("#recom").html("초등");
			$("#recPrev").hide();
			$("#recNext").show();
			$("#inner1").animate({"left" : "+=565px"}, "slow");
		} else {
			$("#recom").html("중등");
			$("#recPrev").show();
			$("#recNext").show();
			$("#inner1").animate({"left" : "+=565px"}, "slow");
		}
	}
	// 다음
	function next() {
		var recom = $("#recom").html();
		if (recom == "초등") {
			$("#recom").html("중등");
			$("#recNext").show();
			$("#recPrev").show();
			$("#inner1").animate({"left" : "-=565px"}, "slow");
		} else if (recom == "중등") {
			$("#recom").html("고등");
			$("#recNext").hide();
			$("#recPrev").show();
			$("#inner1").animate({"left" : "-=565px"}, "slow");
		} else {
			$("#recom").html("초등");
			$("#recNext").show();
			$("#recPrev").hide();
		}
	}
	// 포인트
	//     	function point(){
	//     		alert("point");
	//     	}
	// 내 글
	function board() {
		location.href = "/member/info/myBoard/${login.ID }";
	}
	// 내 댓글
	function reply() {
		location.href = "/member/info/myReply/${login.ID }";
	}
	// 내정보
	function info() {
		location.href = "/member/info/${login.ID }";
	}
	// top 메뉴 초등, 중등, 고등, 재수 학원 클릭
	function mainAjax(type){
		$.ajax({
			type : "post",
			url : "/"+type,
			async : false,
			success : function(txt){
				$("#infoDiv").html(txt);
			}
		});
	}
	// 공지사항 마우스오버
	function mouseOver(num){
		document.getElementById("notice"+num).className = "txt green";
	}
	// 공지사항 마우스리브
	function mouseLeave(num){
		document.getElementById("notice"+num).className = "txt";
	}
	// 입시정보 셀렉트
	$("#examSelect").change(function(){
		var exam = $("#examSelect").val();
		if(exam=="high"){
			$("#highExamCon").show();
			$("#univExamCon").hide();
		} else if(exam=="univ"){
			$("#highExamCon").hide();
			$("#univExamCon").show();
		}
	});
	// 페이지 경로 숨기기
	//     	function Frameset(page) { 
	// 			framecode = "<frameset rows='1*'>" 
	// 			+ "<frame name=main src='" + page + "'>" 
	// 			+ "</frameset>"; 

	// 			document.write(framecode); 
	// 			document.close(); 
	// 		}
</script>

</html>