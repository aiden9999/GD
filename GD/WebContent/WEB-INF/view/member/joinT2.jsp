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
</head>

<body>
	<header>
		<div class="header_top">
			<div class="inner">
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
					<li onclick="location.href='/elmenetary'">
						<div class="txt">초등학원</div>
					</li>
					<li onclick="location.href='/middle'">
						<div class="txt">중등학원</div>
					</li>
					<li onclick="location.href='/high'">
						<div class="txt">고등학원</div>
					</li>
					<li onclick="location.href='/information'">
						<div class="txt">입시정보</div>
					</li>
					<li onclick="location.href='/community'">
						<div class="txt">커뮤니티</div>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<div class="join01-02 join01-03 join01-04">
		<div class="inner">
			<div class="tit">
				<div class="icon_wrap">
					<div class="img">
						<img src="/img/login_black_teacher.png">
					</div>
					<div class="txt">선생님 회원가입 절차</div>
				</div>
				<div class="step">
					1.실명확인 및 약관동의 > <span>2.회원 정보작성</span> > 3.가입완료
				</div>
			</div>
			<div class="person_wrap">
				<div class="tit_section">
					<div class="txt">본인정보</div>
					<div class="line"></div>
				</div>
				<div class="name_wrap">
					<div class="tit">이름</div>
					<div class="txt" id="name">심청이</div>
				</div>
				<div class="id_wrap section_wrap">
					<div class="tit">아이디</div>
					<div class="input_box">
						<input type="text" id="id" name="id" maxlength="30">
					</div>
					<div class="overlap">
						<div class="txt" onclick="idCheck()" id="idCheck">중복확인</div>
					</div>
					<div class="txt">4자~30자 영문, 숫자 조합가능 (공백은 입력불가)</div>
				</div>
				<div class="id_wrap section_wrap">
					<div class="tit">필명</div>
					<div class="input_box">
						<input type="text" id="nick" maxlength="6">
					</div>
					<div class="overlap">
						<div class="txt" onclick="nickCheck()" id="nickCheck">중복확인</div>
					</div>
					<div class="txt">2자~6자 한글, 영문, 숫자 조합가능 (공백은 입력불가)</div>
				</div>
				<div class="pw_wrap section_wrap">
					<div class="tit">비밀번호</div>
					<div class="input_box">
						<input type="password" id="pw" maxlength="16" name="pw">
					</div>
					<div class="txt">6~16자 영문, 숫자조합 (대소문자구분, 공백은 입력불가)</div>
				</div>
				<div class="pw_wrap section_wrap">
					<div class="tit">비밀번호 확인</div>
					<div class="input_box">
						<input type="password" id="pw2" maxlength="16" name="pw2">
					</div>
				</div>
				<div class="area_wrap section_wrap">
					<div class="tit">거주지역</div>
					<div class="select_box">
						<select id="addr1">
							<option value="choose">선택</option>
							<option value="강남">강남</option>
							<option value="강남">강남</option>
							<option value="강남">강남</option>
						</select>
					</div>
				</div>
				<div class="address_wrap section_wrap">
					<div class="tit">주소</div>
					<div class="input_box">
						<input type="text" id="addr2">
					</div>
				</div>
				<div class="phone_wrap section_wrap">
					<div class="tit">휴대폰</div>
					<div class="select_box">
						<select id="phone1">
							<option value="choose">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="hyphen"></div>
					<div class="input_box">
						<input type="text" id="phone2" maxlength="4" name="phone2">
					</div>
					<div class="hyphen"></div>
					<div class="input_box">
						<input type="text" id="phone3" maxlength="4" name="phone3">
					</div>
				</div>
				<div class="mail_wrap section_wrap">
					<div class="tit">E-mail</div>
					<div class="input_box">
						<input type="text" id="email1" name="email1">
					</div>
					<div class="txt">@</div>
					<div class="select_box">
						<select id="emailSelect">
							<option value="input">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="google.com">구글</option>
							<option value="hanmail.net">다음</option>
							<option value="nate.com">네이트</option>
						</select>
					</div>
					<div class="input_box">
						<input type="text" id="email2">
					</div>
				</div>
				<div class="called_wrap section_wrap">
					<div class="tit">정보수신여부</div>
					<div class="txt_box">
						<div class="txt">강남에서 대학가기 주최 설명회 소식 혹은 학원 설명회 광고를 문자나 이메일로
							받으시겠습니까?</div>
						<div class="messege_wrap">
							<div class="txt">문자 수신동의</div>
							<div class="input_txt">
								<label><input type="radio" value="yes" name="agreement1"
									id="agreesmsy"> 예</label>
							</div>
							<div class="input_txt">
								<label><input type="radio" value="no" name="agreement1"
									id="agreesmsn"> 아니오</label>
							</div>
						</div>
						<div class="email_wrap">
							<div class="txt">이메일 수신동의</div>
							<div class="input_txt">
								<label><input type="radio" value="yes" name="agreement2"
									id="agreeemaily"> 예</label>
							</div>
							<div class="input_txt">
								<label><input type="radio" value="no" name="agreement2"
									id="agreeemailn"> 아니오</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="children_wrap">
				<div class="tit_section">
					<div class="txt">선생님 정보</div>
					<div class="line"></div>
				</div>
				<div class="sort_wrap section_wrap">
					<div class="tit">구분</div>
					<div class="select_box">
						<select id="type">
							<option value="choose">선택</option>
							<option value="학교선생님">학교선생님</option>
							<option value="학원선생님">학원선생님</option>
							<option value="과외선생님">과외선생님</option>
						</select>
					</div>
					<div class="select_box">
						<select id="schooladdr">
							<option value="choose">소재지</option>
							<option value="강남">강남</option>
							<option value="강남">강남</option>
							<option value="강남">강남</option>
						</select>
					</div>
					<div class="input_box">
						<input type="text" id="school" placeholder="학교/학원명">
					</div>
				</div>
				<div class="target_wrap section_wrap">
					<div class="tit">수업대상</div>
					<div class="select_box">
						<select id="target">
							<option value="choose">대상선택</option>
							<option value="초등학생">초등학생</option>
							<option value="중학생">중학생</option>
							<option value="고등학생">고등학생</option>
						</select>
					</div>
				</div>
				<div class="subject_wrap section_wrap">
					<div class="tit">수업과목</div>
					<div class="input_box">
						<input type="text" id="subject" placeholder=",(콤파) 로 구분해주세요.">
					</div>
				</div>
				<div class="ex_wrap section_wrap">
					<div class="tit">기타상세</div>
					<div class="txt_box">
						<textarea id="etc" style="resize: none"></textarea>
					</div>
				</div>
			</div>
			<div class="cannext_wrap">
				<div class="btn cancel" onclick="location.href='/join'">취 소</div>
				<div class="btn next" onclick="next()">다 음</div>
			</div>
		</div>
	</div>
	<footer>
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
	
	<div class="popup_cover" style="display: none" id="end1"></div>
	<div class="popup_wrap" style="display: none" id="end2">
		<div class="logo"><label><span >L</span>ogo</label></div>
		<div class="name"><span>심청이</span>님</div>
		<div class="welcome txt"><span>강남에서 대학가기</span> 회원가입을 환영합니다.<br>회원님의 등급은<span> 새싹등급</span>  입니다.</div>
		<div class="move txt">아래 확인버튼을 누르시면 메인페이지로이동합니다.</div>
		<div class="popup_confirm">
			<div class="confirm_txt" onclick="location.href='/'">확인</div>
		</div>
	</div>
</body>

<script>
    	$(document).ready(function(){
    		idBtn = 0;
    		nickBtn = 0;
    	});
		// 아이디, 비번 한글입력 방지
    	$(document).ready(function(){
			$("input[name=id]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
			});
			$("input[name=email1]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
			});
			$("input[name=pw]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
			});
			$("input[name=pw2]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
			});
			$("input[name=phone2]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
			$("input[name=phone3]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
		});
 		// 검색란에서 엔터입력
 		$("#hsearch").keyup(function(txt){
 			if(txt.keyCode==13){
 	    		var search = $("#hsearch").val();
 	    		if(search!=""){
 		    		alert(search);
 	    		}
 			}
 		});
 		// 학교선생님 제외 수업대상 변경
 		$("#type").change(function(){
 			var type = $("#type").val();
 			var html = "";
 			if(type=="학교선생님"){
 				html += "<option value='choose'>선택</option>";
 				html += "<option value='1학년'>1학년</option>";
 				html += "<option value='2학년'>2학년</option>";
 				html += "<option value='3학년'>3학년</option>";
 				html += "<option value='4학년'>4학년</option>";
 				html += "<option value='5학년'>5학년</option>";
 				html += "<option value='6학년'>6학년</option>";
 			} else {
 				html += "<option value='choose'>선택</option>";
 				html += "<option value='초등학생'>초등학생</option>";
 				html += "<option value='중학생'>중학생</option>";
 				html += "<option value='고등학생'>고등학생</option>";
 			}
			$("#target").html(html);
 		});
 		// 학교선생님 일때 학교에따라 학년 변경
 		$("#school").blur(function(){
			var school = $("#school").val();
			var html = "";
			if($("#type").val()=="학교선생님"){
				if(school.indexOf("초등")>=0){
					if($("#target").html().indexOf("4학년")<0){
						html += "<option value='4학년'>4학년</option>";
						html += "<option value='5학년'>5학년</option>";
						html += "<option value='6학년'>6학년</option>";
						$("#target").append(html);
					}
				} else {
					html += "<option value='choose'>선택</option>";
					html += "<option value='1학년'>1학년</option>";
					html += "<option value='2학년'>2학년</option>";
					html += "<option value='3학년'>3학년</option>";
					$("#target").html(html);
				}
			}
		});
 		// 검색버튼 클릭
 		function search(){
 			var search = $("#hsearch").val();
 			if(search!=""){
 	    		alert($("#hsearch").val());
 			}
 		}
 		// 아이디 입력
 		$("#id").keyup(function(){
 			idBtn = 0;
 			document.getElementById("id").style.color = "black";
 		});
 		// 아이디 중복체크
 		function idCheck(){
 			var id = $("#id").val();
 			if(id.length==0){
 				alert("아이디를 입력해주세요.");
 			} else if(id.length<4){
 				alert("아이디는 4~30자로 설정해주세요");
 			} else {
	 			$.ajax({
	 				type : "post",
	 				url : "/join/idCheck/"+id,
	 				async : false,
	 				success : function(txt){
	 					if(txt){
	 						$("#id").val(id+"-사용가능");
	 						document.getElementById("id").style.color = "green";
	 					} else {
	 						$("#id").val(id+"-사용불가");
	 						document.getElementById("id").style.color = "red";
	 					}
	 					idBtn ++;
	 				}
	 			});
 			}
 		}
 		// 닉네임 입력
 		$("#nick").keyup(function(){
 			nickBtn = 0;
 			document.getElementById("nick").style.color = "black";
 		});
 		// 닉네임 중복체크
 		function nickCheck(){
 			var nick = $("#nick").val();
 			if(nick.length==0){
 				alert("닉네임을 입력해주세요.");
 			} else if(nick.length<2){
 				alert("닉네임은 2~6자로 설정해주세요");
 			} else {
	 			$.ajax({
	 				type : "post",
	 				url : "/join/nickCheck/"+nick,
	 				async : false,
	 				success : function(txt){
	 					if(txt){
	 						$("#nick").val(nick+"-사용가능");
	 						document.getElementById("nick").style.color = "green";
	 					} else {
	 						$("#nick").val(nick+"-사용불가");
	 						document.getElementById("nick").style.color = "red";
	 					}
	 					nickBtn ++;
	 				}
	 			});
 			}
 		}
 		// 이메일 선택
 		$("#emailSelect").change(function(txt){
 			if($("#emailSelect").val()=="input"){
 				$("#email2").val("");
 			} else {
 				$("#email2").val($("#emailSelect").val());
 			}
 		});
 		// 다음
 		var idBtn = 0;
 		var nickBtn = 0;
 		function next(){
 			var id = $("#id").val();
 			var name = $("#name").html();
 			var pw = $("#pw").val();
 			var pw2 = $("#pw2").val();
 			var nick = $("#nick").val();
 			var addr1 = $("#addr1").val();
 			var addr2 = $("#addr2").val();
 			var phone1 = $("#phone1").val();
 			var phone2 = $("#phone2").val();
 			var phone3 = $("#phone3").val();
 			var email1 = $("#email1").val();
 			var email2 = $("#email2").val();
 			var agreesmsy = $("#agreesmsy").prop("checked");
 			var agreesmsn = $("#agreesmsn").prop("checked");
 			var agreeemaily = $("#agreeemaily").prop("checked");
 			var agreeemailn = $("#agreeemailn").prop("checked");
 			var phone = phone1+"-"+phone2+"-"+phone3;
 			var email = email1+"@"+email2;
 			var agreesms = agreesmsy ? "y" : agreesmsn ? "n" : false;
 			var agreeemail = agreeemaily ? "y" : agreeemailn ? "n" : false;
 			
 			var schooladdr = $("#schooladdr").val();
 			var school = $("#school").val();
 			var target = $("#target").val();
 			var type = $("#type").val();
 			var subject = $("#subject").val();
 			var etc = $("#etc").val();
 			
 			if(id=="" || nick=="" || pw=="" || pw2=="" || addr1=='choose' || addr2=="" || phone1=='choose' || phone2=="" || phone3=="" ||
 					email1=="" || email2=="" || !agreesms || !agreeemail || schooladdr=="choose" || school=="" || target=="choose" || type=="choose" ||
 					subject==""){
 				alert("입력되지 않은 항목이 있습니다.");
 				return;
 			} else {
 				if(idBtn==0){
 					alert("아이디 중복체크를 해주세요.");
 					return;
 				} else if(nickBtn==0){
 					alert("닉네임 중복체크를 해주세요.");
 					return;
 				}
				id = $("#id").val();
				nick = $("#nick").val();
 				if(id.indexOf("-")>0){
 					if(id.indexOf("불가")>0){
 						alert("이미 사용중인 아이디입니다.\n아이디를 변경해주세요.");
 						return;
 					} else {
	 	 				id = id.substring(0, id.indexOf("-"));
 					}
 	 			}
 				if(nick.indexOf("-")>0){
 					if(nick.indexOf("불가")>0){
	 					alert("이미 사용중인 닉네임입니다.\n닉네임을 변경해주세요.");
	 					return;
 					} else {
	 	 				nick = nick.substring(0, nick.indexOf("-"));
 					}
 				}
	 			if(pw!=pw2){
	 				alert("비밀번호와 비밀번호 확인이 같지않습니다.");
	 				return;
	 			}
	 			if(id.length<4 || id.length>30){
	 				alert("아이디는 4~30자로 설정해주세요");
	 				return;
	 			} else if(id.indexOf(" ")>0){
	 				alert("아이디에 공백은 사용할 수 없습니다.");
	 				return;
	 			}
	 			if(nick.length<2 || nick.length>6){
	 				alert("닉네임은 2~6자로 설정해주세요");
	 				return;
	 			} else if(nick.indexOf(" ")>0){
	 				alert("닉네임에 공백은 사용할 수 없습니다.");
	 				return;
	 			}
	 			if(pw.length<6 || pw.length>16){
	 				alert("비밀번호는 6~16자로 설정해주세요.");
	 				return;
	 			} else if(pw.indexOf(" ")>0){
	 				alert("비밀번호에 공백은 사용할 수 없습니다.");
	 				return;
	 			}
	 			if(school.indexOf(" ")>0){
	 				alert("학교명에 공백은 사용할 수 없습니다.");
	 				return;
	 			}
	 			if(subject.indexOf(" ")>0){
	 				alert("과목에 공백은 사용할 수 없습니다.");
	 				return;
	 			}
	 			$.ajax({
	 				type : "post",
	 				url : "/join/teacher/"+id+"/"+name+"/"+nick+"/"+pw+"/"+addr1+"/"+addr2+"/"+phone+"/"+agreesms+"/"+agreeemail+
	 						"/"+schooladdr+"/"+school+"/"+type+"/"+target+"?email="+email+"&subject="+subject+"&etc="+etc,
	 				async : false,
	 				success : function(txt){
	 					if(txt){
	 						$("#end1").show();
	 						$("#end2").show();
	 					} else {
	 						alert("가입에 실패하였습니다.\n잠시후 다시 시도해주세요.");
	 					}
	 				}
	 			});
			}
 		}
    </script>

</html>