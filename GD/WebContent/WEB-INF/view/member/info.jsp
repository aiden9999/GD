<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="/css/swiper.min.css">
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
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=i9nljBxxeJZYnyH27RC1"></script>
<title></title>

<style>
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var selectTarget = $('.select_box select');

		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();
			$(this).siblings('label').text(select_name);
		});
	});
</script>
</head>

<body>
	<header>
		<div class="header_top">
			<div class="inner">
				<c:if test="${login==null }">
					<div class="txt" onclick="login()">로그인</div>
				</c:if>
				<div class="logo" onclick="location.href='/'">
					<label><span>L</span>ogo</label>
				</div>
				<div class="search">
					<input type="text" id="hsearch"
						style="border: 2px solid #888f8d; height: 24px;" maxlength="10">
					<img class="hsearch" src="/img/search.png" onclick="search()">
				</div>
			</div>
		</div>
		<div class="gnb">
			<div class="inner">
				<ul>
					<li onclick="location.href='/el'" class="gnb_menu">
						<div class="txt">초등학원</div>
					</li>
					<li onclick="location.href='/mi'" class="gnb_menu">
						<div class="txt">중등학원</div>
					</li>
					<li onclick="location.href='/hi'" class="gnb_menu">
						<div class="txt">고등학원</div>
					</li>
					<li class="gnb_menu">
						<div class="txt">입시정보</div>
						<ul>
							<li class="drop_menu" onclick="location.href='/highExam'">
								<div class="txt1">고등입시</div>
							</li>
							<li class="drop_menu" onclick="location.href='/univExam'">
								<div class="txt1">대학입시</div>
							</li>
						</ul>
					</li>
					<li class="gnb_menu">
						<div class="txt">커뮤니티</div>
						<ul>
							<li class="drop_menu" onclick="location.href='/waggle'">
								<div class="txt1">수다방</div>
							</li>
							<li class="drop_menu" onclick="location.href='/worry'">
								<div class="txt1">고민상담</div>
							</li>
							<li class="drop_menu" onclick="location.href='/notice'">
								<div class="txt1">공지사항</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<div class="info_page">
		<div class="inner">
			<aside class="side_menu">
				<ul>
					<li class="sel" onclick="tab(1)" id="t1"><span>회원 정보변경</span>
					</li>
					<li onclick="tab(2)" id="t2"><span>나의 학원정보</span></li>
					<li onclick="tab(3)" id="t3"><span>나의 게시글</span></li>
					<li onclick="tab(4)" id="t4"><span>나의 댓글</span></li>
					<li onclick="tab(5)" id="t5"><span>회원탈퇴</span></li>
				</ul>
			</aside>
			<div class="container" id="tab1">
				<div class="tit">회원 정보변경</div>
				<div class="welcome_wrap">
					<div class="txt">${type }회원</div>
					<div class="txt">
						<span>${login.ID }님</span> 환영합니다.
					</div>
					<!--                         <div class="txt1">회원 정보변경</div> -->
				</div>
				<div class="devide_wrap">
					<div class="txt_wrap">
						<div class="circle"></div>
						<div class="txt">
							<span class="txt1">회원등급</span> <span class="txt2">${login.GRADE }</span>
						</div>
					</div>
					<div class="txt_wrap">
						<div class="circle"></div>
						<div class="txt">
							<span class="txt1">가입일</span> <span class="txt2">${login.DAY }</span>
						</div>
					</div>
					<div class="txt_wrap">
						<div class="circle"></div>
						<div class="txt">
							<span class="txt1">최근방문일</span> <span class="txt2">${lastVisit }</span>
						</div>
					</div>
					<div class="txt_wrap">
						<div class="circle"></div>
						<div class="txt">
							<span class="txt1">방문일수</span> <span class="txt2">총 <span
								class="txt3">${visit.size() }</span>일
							</span>
						</div>
					</div>
					<div class="txt_wrap">
						<div class="circle"></div>
						<div class="txt">
							<span class="txt1">이번달 방문일</span> <span class="txt2">총 <span
								class="txt3">${monthVisit.size() }</span>일
							</span>
						</div>
					</div>
					<div class="txt_wrap">
						<div class="circle"></div>
						<div class="txt">
							<span class="txt1">6개월간 포인트</span> <span class="txt2"><span
								class="txt3">${point }</span></span>
						</div>
					</div>
					<div class="info_change_wrap">
						<div class="info_change" onclick="infoModify()">회원 정보변경</div>
						<div class="info_wrap">
							<div class="info_tit">이름</div>
							<div class="txt">${login.NAME }</div>
						</div>
						<div class="info_wrap">
							<div class="info_tit">아이디</div>
							<div class="txt">${login.ID }</div>
						</div>
						<div class="info_wrap">
							<div class="info_tit">필명</div>
							<div class="txt" id="infoNick">${login.NICK }</div>
							<input type="text" id="modNick" value="${login.NICK }" style="display: none" maxlength="6">
						</div>
						<div class="info_wrap">
							<div class="info_tit">현재 비밀번호</div>
							<input type="password" id="modNowPw" readonly="readonly" maxlength="16">
						</div>
						<div class="info_wrap">
							<div class="info_tit">비밀번호</div>
							<input type="password" id="modPw" readonly="readonly" maxlength="16">
							<font style="font-size: 11px; font-weight: normal; display: none" id="changePw">(비밀번호 변경시 입력하세요.)</font>
						</div>
						<div class="info_wrap">
							<div class="info_tit">비밀번호 확인</div>
							<input type="password" id="modPw1" readonly="readonly" maxlength="16">
							<font style="font-size: 11px; font-weight: normal; display: none" id="changePw1">(비밀번호 변경시 입력하세요.)</font>
						</div>
						<div class="info_wrap">
							<div class="info_tit">거주지역</div>
							<div class="txt1" id="infoAddr1">${login.ADDR1 }</div>
							<select id="modAddr1" style="display: none">
								<c:forEach var="i" items="${addr }">
									<c:choose>
										<c:when test="${i == login.ADDR1 }">
											<option value="${i }" selected="selected">${i }</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="info_wrap">
							<div class="info_tit">주소</div>
							<div class="txt1" id="infoAddr2">${login.ADDR2 }</div>
							<input type="text" id="modAddr2" value="${login.ADDR2 }" style="display: none">
						</div>
						<div class="info_wrap phone_wrap">
							<div class="info_tit">휴대폰</div>
							<div class="txt1" id="infoPhone">${login.PHONE }</div>
							<input type="text" id="modPhone1" value="${login.PHONE.substring(0, 3) }" style="display: none" maxlength="4">
							<font id="modPhone-1" style="display: none"> - </font>
                            <input type="text" id="modPhone2" value="${login.PHONE.substring(4, 8) }" style="display: none" maxlength="4">
                            <font id="modPhone-2" style="display: none"> - </font> 
                            <input type="text" id="modPhone3" value="${login.PHONE.substring(9) }" style="display: none" maxlength="4">
						</div>
						<div class="info_wrap email_wrap">
							<div class="info_tit">E-mail</div>
							<div class="txt1" id="infoEmail">${login.EMAIL }</div>
							<input type="text" id="modEmail1" value="${login.email1 }" style="display: none">
							<font id="modEmail3" style="display: none">@</font>
                            <select id="modEmailSelect" style="display: none">
                                <option value="choose">직접입력</option>
                                <option value="naver.com">네이버</option>
                                <option value="google.com">구글</option>
                                <option value="daum.net">다음</option>
                                <option value="nate.com">네이트</option>
                            </select>
                            <input type="text" id="modEmail2" value="${login.email2 }" style="display: none">
						</div>
						<div class="info_wrap">
							<div class="info_tit">정보수신여부</div>
							<div class="info_receive_wrap">
								<div class="receive_tit">미래로 입시컨설팅 주최 설명회 소식 혹은 학원 설명회 광고를
									문자나 이메일로 받으시겠습니까?</div>
								<div class="receive_txt">
									<div class="txt">문자 수신동의</div>
									<c:choose>
										<c:when test="${login.AGREESMS == 'y' }">
											<label><input type="radio" value="yes" name="agreeSms"
												checked="checked" disabled="disabled" id="agreeSmsY">
											<div class="txt1">예</div></label>
											<label><input type="radio" value="no" name="agreeSms"
												disabled="disabled" id="agreeSmsN">
											<div class="txt1">아니오</div></label>
										</c:when>
										<c:otherwise>
											<label><input type="radio" value="yes" name="agreeSms"
												disabled="disabled" id="agreeSmsY">
											<div class="txt1">예</div></label>
											<label><input type="radio" value="no" name="agreeSms"
												checked="checked" disabled="disabled" id="agreeSmsN">
											<div class="txt1">아니오</div></label>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="receive_txt">
									<div class="txt">이메일 수신동의</div>
									<c:choose>
										<c:when test="${login.AGREEEMAIL == 'y' }">
											<label><input type="radio" value="yes" name="agreeEmail"
												checked="checked" disabled="disabled" id="agreeEmailY">
											<div class="txt1">예</div></label>
											<label><input type="radio" value="no" name="agreeEmail"
												disabled="disabled" id="agreeEmailN">
											<div class="txt1">아니오</div></label>
										</c:when>
										<c:otherwise>
											<label><input type="radio" value="yes" name="agreeEmail"
												disabled="disabled" id="agreeEmailY">
											<div class="txt1">예</div></label>
											<label><input type="radio" value="no" name="agreeEmail"
												checked="checked" disabled="disabled" id="agreeEmailN">
											<div class="txt1">아니오</div></label>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					<div class="cannext_wrap cannext_wrap1">
                        <div class="btn cancel" onclick="cancel()" id="modCancel" style="display: none">취 소</div>
                        <div class="btn next" onclick="modSave()" id="modSave" style="display: none">저 장</div>
                    </div>
				</div>
			</div>
			<div class="container" id="tab2" style="display: none">
				<div class="tit">나의 학원정보</div>
				<div class="bulletin_wrap">
					<div class="bulletin_header">
						<div class="bulletin_tit">
							<div class="circle"></div>
							<div class="txt">학원리뷰</div>
						</div>
						<div class="bulletin_date">
							<span style="margin-right: 235px">기간 / 과목 / 평점</span> <span>작성일</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${review.size()>0 }">
							<c:forEach var="t" items="${review }">
								<div class="board_txt2">
									<div class="star_wrap" style="position: static; top: 0px">
										<c:forEach var="i" begin="1" end="${t.POINT }">
											<div class="star">
												<img src="/img/main01_03_star.png">
											</div>
										</c:forEach>
										<c:forEach var="j" begin="1" end="${5-t.POINT }">
											<div class="star">
												<img src="/img/main01_03_star1.png">
											</div>
										</c:forEach>
									</div>
									<div class="txt" style="line-height: 25px">${t.DAY } /
										${t.SUBJECT } / ${t.POINT }점</div>
									<div class="bulletin_date" style="line-height: 25px">
										<span>${t.REDAY }</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="board_txt">작성하신 글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="bulletin_wrap">
					<div class="bulletin_header">
						<div class="bulletin_tit">
							<div class="circle"></div>
							<div class="txt">한줄평가</div>
						</div>
						<div class="bulletin_date">
							<span style="margin-right: 230px">내용 (학원명)</span> <span>작성일</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${comment.size()>0 }">
							<c:forEach var="t" items="${comment }">
								<div class="board_txt2">
									<div class="star_wrap" style="position: static; top: 0px">
										<c:forEach var="i" begin="1" end="${t.POINT }">
											<div class="star">
												<img src="/img/main01_03_star.png">
											</div>
										</c:forEach>
										<c:forEach var="j" begin="1" end="${5-t.POINT }">
											<div class="star">
												<img src="/img/main01_03_star1.png">
											</div>
										</c:forEach>
									</div>
									<div class="txt" style="line-height: 25px">
										<c:choose>
											<c:when test="${t.COMMENT.length()>20 }">
			                            			${t.COMMENT.substring(0, 20) }... (${t.aca })
			                            		</c:when>
											<c:otherwise>
			                            			${t.COMMENT } (${t.aca })
			                            		</c:otherwise>
										</c:choose>
									</div>
									<div class="bulletin_date" style="line-height: 25px">
										<span>${t.DAY }</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="board_txt">작성하신 글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="container" id="tab3" style="display: none">
				<div class="tit">나의 게시글</div>
				<div class="bulletin_wrap">
					<div class="bulletin_header">
						<div class="bulletin_tit">
							<div class="circle"></div>
							<div class="txt">수다방</div>
						</div>
						<div class="bulletin_date">
							<span>작성일</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${board1.size()>0 }">
							<c:forEach var="t" items="${board1 }">
								<div class="board_txt">
									<div class="board_tit" style="cursor: default;">
										<c:choose>
											<c:when test="${t.CONTENT.length()>20 }">
												<label style="cursor: default">${t.CONTENT.substring(0, 20) }...</label>
											</c:when>
											<c:otherwise>
												<label style="cursor: default">${t.CONTENT }</label>
											</c:otherwise>
										</c:choose>
										<span style="cursor: default;">(${t.REPLY })</span>
									</div>
									<div class="bulletin_date">
										<span>${t.DAY }</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="board_txt">작성하신 글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="bulletin_wrap">
					<div class="bulletin_header">
						<div class="bulletin_tit">
							<div class="circle"></div>
							<div class="txt">고민상담</div>
						</div>
						<div class="bulletin_date">
							<span>작성일</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${board2.size()>0 }">
							<c:forEach var="t" items="${board2 }">
								<div class="board_txt">
									<div class="board_tit" style="cursor: default;">
										<c:choose>
											<c:when test="${t.CONTENT.length()>20 }">
												<label style="cursor: default">${t.CONTENT.substring(0, 20) }...</label>
											</c:when>
											<c:otherwise>
												<label style="cursor: default">${t.CONTENT }</label>
											</c:otherwise>
										</c:choose>
										<span style="cursor: default;">(${t.REPLY })</span>
									</div>
									<div class="bulletin_date">
										<span>${t.DAY }</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="board_txt">작성하신 글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="container" id='tab4' style="display: none">
				<div class="tit">나의 댓글</div>
				<div class="bulletin_wrap">
					<div class="bulletin_header">
						<div class="bulletin_tit">
							<div class="circle"></div>
							<div class="txt">수다방</div>
						</div>
						<div class="bulletin_date">
							<span>작성일</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${reply1.size()>0 }">
							<c:forEach var="t" items="${reply1 }">
								<div class="board_txt">
									<div class="board_tit" style="cursor: default;">
										<c:choose>
											<c:when test="${t.REPLY.length()>20 }">
												<label style="cursor: default">${t.REPLY.substring(0, 20) }...</label>
											</c:when>
											<c:otherwise>
												<label style="cursor: default">${t.REPLY }</label>
											</c:otherwise>
										</c:choose>
										<span style="cursor: default;"> <c:choose>
												<c:when test="${t.BOARD.length()>20 }">
													<label style="cursor: default">(${t.BOARD.substring(0, 20) }...)</label>
												</c:when>
												<c:otherwise>
													<label style="cursor: default">(${t.BOARD })</label>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="bulletin_date">
										<span>${t.DAY }</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="board_txt">작성하신 댓글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="bulletin_wrap">
					<div class="bulletin_header">
						<div class="bulletin_tit">
							<div class="circle"></div>
							<div class="txt">고민상담</div>
						</div>
						<div class="bulletin_date">
							<span>작성일</span>
						</div>
					</div>
					<c:choose>
						<c:when test="${reply2.size()>0 }">
							<c:forEach var="t" items="${reply2 }">
								<div class="board_txt">
									<div class="board_tit" style="cursor: default;">
										<c:choose>
											<c:when test="${t.REPLY.length()>20 }">
												<label style="cursor: default">${t.REPLY.substring(0, 20) }...</label>
											</c:when>
											<c:otherwise>
												<label style="cursor: default">${t.REPLY }</label>
											</c:otherwise>
										</c:choose>
										<span style="cursor: default;"> <c:choose>
												<c:when test="${t.BOARD.length()>20 }">
													<label style="cursor: default">(${t.BOARD.substring(0, 20) }...)</label>
												</c:when>
												<c:otherwise>
													<label style="cursor: default">(${t.BOARD })</label>
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="bulletin_date">
										<span>${t.DAY }</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="board_txt">작성하신 댓글이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="container" id="tab5" style="display: none">
				<div class="tit">회원 탈퇴</div>
				<div class="withdrawa_wrap">
					<div class="withdrawa_txt">
						<div class="logo_wrap">
							<div class="logo">
								<span>L</span>ogo
							</div>
							<div class="txt">회원탈퇴 안내</div>
						</div>
						<div class="txt1">
							회원님께서 탈퇴하신다니 무척 안타깝습니다. <br> 그동안 불편하셨던 점이나 시정요청 사항을 알려주시면 향후
							개선하도록 노력하겠습니다
						</div>
					</div>
					<div class="section02">
						<div class="section02_tit">
							<div class="dot"></div>
							<div class="txt">회원탈퇴시 아래사항을 숙지하시기 바랍니다.</div>
						</div>
						<div class="section02_txt_wrap">
							<div class="section02_txt">
								· 회원탈퇴 시 고객님의 정보는 강남에서 대학가기 개인정보보호정책에 따라 관리됩니다<br> · 회원탈퇴 후
								재가입 시에는 신규가입으로 처리되며, 탈퇴하신 ID 는 다시 사용하실 수 없습니다
							</div>
						</div>
					</div>
					<div class="section03">
						<div class="section03_tit">
							<div class="dot"></div>
							<div class="txt">회원탈퇴 사유</div>
						</div>
						<div class="section_radio_wrap">
							<label>
								<input type="radio" value="service" name="withdrawa" id="type1">
								<div class="txt">서비스불만</div>
							</label>
							<label>
								<input type="radio" value="center" name="withdrawa" id="type2">
								<div class="txt">고객센터 처리불만</div>
							</label>
							<label>
								<input type="radio" value="info" name="withdrawa" id="type3">
								<div class="txt">개인정보 유출</div>
							</label>
							<label>
								<input type="radio" value="use" name="withdrawa" id="type4">
								<div class="txt txt1">이용빈도 낮음</div>
							</label>
							<label>
								<input type="radio" value="etc" name="withdrawa" id="type5">
								<div class="txt">기타 (아래에 내용을 적어주세요)</div>
							</label>
						</div>
						<textarea placeholder="기타 (내용을 적어주세요 - 최대 100자)" style="resize: none" maxlength="100" id="exitEtc"></textarea>
					</div>
					<div class="password_wrap">
						<div class="password_txt">비밀번호 입력</div>
						<input type="password" id="exitPw">
					</div>
					<div class="cannext_wrap cannext_wrap1">
                        <div class="btn cancel" onclick="cancel()">취 소</div>
                        <div class="btn next" onclick="exit()">탈 퇴</div>
                    </div>
				</div>
			</div>
		</div>
	</div>
	<footer class="info_footer">
		<div class="inner">
			<div class="logo" onclick="location.href='/'">
				<label><span>L</span>ogo</label>
			</div>
			<div class="txt">
				주소 : 서울 강남구 테헤란로 407 EK타워 4층 미래로입시컨설팅대표이사 : 이혁진 <br>상담시간 : 월 ~
				금 - 오전 10시 ~ 오후 9시 ( 점심시간 오전 11시 30분 ~ 오후 1시) 토 - 오전 10시 ~ 오후 5시 <br>Copyright(c)
				TS group. All Rights Reserved.
			</div>
		</div>
	</footer>
<!-- 	<div style="width: 100%; height: 100%"> -->
<!-- 		<div class="ajaxLoading" style="background-image: url('/ajaxLoading/ajaxLoading.gif')"></div> -->
<!-- 	</div> -->
</body>

<script>
	$(document).ready(function() {
		if ("${info }" == "board") {
			tab(3);
		} else if ("${info }" == "reply") {
			tab(4);
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
	// 탭 클릭
	function tab(num) {
		for (var i = 1; i <= 5; i++) {
			var x = document.getElementById("t" + i);
			if (i == num) {
				if (x.className.indexOf("sel") == -1) {
					x.className += "sel";
					$("#tab" + i).show();
				}
			} else {
				x.className = x.className.replace("sel", "");
				$("#tab" + i).hide();
			}
		}
	}
	// 정보 수정
	function infoModify(){
		$("#modNick").show();
		$("#infoNick").hide();
		$("#modNowPw").prop("readonly", false);
		$("#modPw").prop("readonly", false);
		$("#modPw1").prop("readonly", false);
		$("#changePw").show();
		$("#changePw1").show();
		$("#infoAddr1").hide();
		$("#modAddr1").show();
		$("#infoAddr2").hide();
		$("#modAddr2").show();
		$("#infoPhone").hide();
		$("#modPhone1").show();
		$("#modPhone2").show();
		$("#modPhone3").show();
		$("#modPhone-1").show();
		$("#modPhone-2").show();
		$("#infoEmail").hide();
		$("#modEmail1").show();
		$("#modEmail2").show();
		$("#modEmail3").show();
		$("#modEmailSelect").show();
		$("#agreeSmsY").prop("disabled", false);
		$("#agreeSmsN").prop("disabled", false);
		$("#agreeEmailY").prop("disabled", false);
		$("#agreeEmailN").prop("disabled", false);
		$("#modCancel").show();
		$("#modSave").show();
	}
	// 정보 수정 및 회원탈퇴 취소
	function cancel(){
		location.reload();
	}
	// 정보 수정 저장
	function modSave(){
		var nick = $("#modNick").val();
		var nowPw = $("#modNowPw").val();
		var pw = $("#modPw").val();
		var pw1 = $("#modPw1").val();
		var addr1 = $("#modAddr1").val();
		var addr2 = $("#modAddr2").val();
		var phone1 = $("#modPhone1").val();
		var phone2 = $("#modPhone2").val();
		var phone3 = $("#modPhone3").val();
		var phone = phone1+"-"+phone2+"-"+phone3;
		var email1 = $("#modEmail1").val();
		var email2 = $("#modEmail2").val();
		var email = email1+"@"+email2;
		var agreeSms = $("#agreeSmsY").prop("checked") ? "y" : $("#agreeSmsN").prop("checked") ? "n" : false;
		var agreeEmail = $("#agreeEmailY").prop("checked") ? "y" : $("#agreeEmailN").prop("checked") ? "n" : false;
		if(nick=="" || nowPw=="" || addr1=="choose" || addr2=="" || phone1=="" || phone2=="" || phone3=="" || email1=="" ||
				email2=="" || !agreeSms || !agreeEmail){
			alert("입력하지 않은 항목이 있습니다.");
		} else if(nick.length<2){
			alert("닉네임은 2~6자로 설정해주세요.");
		} else if(nowPw!="${login.PW }"){
			alert("현재 비밀번호가 일치하지 않습니다.");
		} else {
			if(pw=="" && pw1==""){
				$.ajax({
					type : "post",
					url : "/info/modify/${login.ID }/"+nick+"/"+addr1+"/"+addr2+"/"+phone+"/"+email+"/"+agreeSms+"/"+agreeEmail,
					async : false,
					success : function(txt){
						if(txt){
							alert("변경되었습니다.");
							location.reload();
						} else {
							alert("변경에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			} else {
				if(pw.length<6){
					alert("비밀번호는 6~16자로 설정해주세요.");
				} else if(nowPw==pw){
					alert("변경할 비밀번호와 현재 비밀번호는 같을 수 없습니다.");
				} else if(pw!=pw1){
					alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				} else {
					$.ajax({
						type : "post",
						url : "/info/modify2/${login.ID}/"+nick+"/"+addr1+"/"+addr2+"/"+phone+"/"+email+"/"+agreeSms+"/"+agreeEmail+
									"/"+pw,
						async : false,
						success : function(txt){
							if(txt){
								alert("변경되었습니다.");
								location.reload();
							} else {
								alert("변경에 실패하였습니다.\n잠시후 다시 시도해주세요.");
							}
						}
					});
				}
			}
		}
	}
	// 이메일 선택
	$("#modEmailSelect").change(function(){
		var sel = $("#modEmailSelect").val();
		if(sel!="choose"){
			$("#modEmail2").val(sel);
		} else {
			$("#modEmail2").val("");
		}
	});
	// 아이디, 비번 등 한글입력 방지
	$(document).ready(function(){
		$("input[id=modNick]").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]/gi,''));
			}
		});
		$("input[id=modEmail1]").keyup(function(event){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		$("input[id=modEmail2]").keyup(function(event){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));
			}
		});
		$("input[id=modPw]").keyup(function(event){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		$("input[id=modPw1]").keyup(function(event){ 
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		$("input[id=modPhone1]").keyup(function(event){ 
			if (!(event.keyCode >=48 && event.keyCode<=57)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		$("input[id=modPhone2]").keyup(function(event){ 
			if (!(event.keyCode >=48 && event.keyCode<=57)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		$("input[id=modPhone3]").keyup(function(event){ 
			if (!(event.keyCode >=48 && event.keyCode<=57)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
	});
	// 회원 탈퇴
	function exit(){
		var reason = $("#type1").prop("checked") ? "서비스불만" : $("#type2").prop("checked") ? "고객센터 처리불만" : $("#type3").prop("checked") ?
								"개인정보 유출" : $("#type4").prop("checked") ? "이용빈도 낮음" : $("#type5").prop("checked") ? "기타" : false;
		var etc = $("#exitEtc").val();
		var pw = $("#exitPw").val();
		if(!reason || pw==""){
			alert("입력하지 않은 항목이 있습니다.");
		} else if(reason=="기타" && etc==""){
			alert("내용을 입력해 주세요.");
		} else if(pw!="${login.PW }"){
			alert("비밀번호가 일치하지 않습니다.");
		} else {
			etc = etc=="" ? "no" : etc;
			$.ajax({
				type : "post",
				url : "/info/exit/${login.ID }/"+reason+"/"+etc,
				async : false,
				success : function(txt){
					if(txt){
						var width = window.innerWidth;
				  		var height = window.innerHeight; 
						window.open("/info/exit", "exit", "width=500px; height=380px; left="+width/2+" top="+height/2);
					} else {
						alert("탈퇴에 실패하였습니다.\n잠시후 다시 시도해주세요.");
					}
				}
			});
		}
	}
</script>

</html>