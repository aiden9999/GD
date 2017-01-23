<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/css/style.css" type="text/css">
        <link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="robots" content="follow">
        <meta name="description" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
        <meta name="keywords" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
        <meta property="og:type" content="website">
        <meta property="og:title" content="강남대치학원 멘토클리닉">
        <meta property="og:description" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
        <meta property="og:image" content="http://www.mysite.com/myimage.jpg">
        <meta property="og:url" content="http://mentorschool.co.kr">
        <title></title>
        
        <style>
            
        </style>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/common.js"></script>
    </head>
     
    <body>
        <header>
            <div class="header_top">
                <div class="inner">
                    <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                    <div class="search">
                        <input type="text" id="hsearch" style="border: 2px solid #888f8d; height: 24px; " maxlength="10">
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
        <div class="join01-02">
            <div class="inner">
                <div class="tit">
                    <div class="icon_wrap">
                        <div class="img"><img src="/img/login_black_people.png"></div>
                        <div class="txt">일반 회원가입 절차</div>
                    </div>
                    <div class="step">1.실명확인 및 약관동의 >  <span>2.회원 정보작성</span> > 3.가입완료</div>
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
                            <input type="text" id="id">
                        </div>
                        <div class="overlap">
                            <div class="txt" onclick="idCheck()">중복확인</div>
                        </div>
                        <div class="txt">4자~30자 영문, 숫자 조합가능 (공백은 입력불가)</div>
                    </div>
                    <div class="id_wrap section_wrap">
                        <div class="tit">필명</div>
                        <div class="input_box"> 
                            <input type="text" id="nick">
                        </div>
                        <div class="overlap">
                            <div class="txt" onclick="nickCheck()">중복확인</div>
                        </div>
                        <div class="txt">2자~6자 한글, 영문, 숫자 조합가능 (공백은 입력불가)</div>
                    </div>
                    <div class="pw_wrap section_wrap">
                        <div class="tit">비밀번호</div>
                        <div class="input_box">
                            <input type="password" id="pw">
                        </div>
                        <div class="txt">6~16자 영문, 숫자조합 (대소문자구분, 공백은 입력불가)</div>
                    </div>
                    <div class="pw_wrap section_wrap">
                        <div class="tit">비밀번호 확인</div>
                        <div class="input_box">
                            <input type="password" id="pw2">
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
                                <option value="a010">010</option>
                                <option value="a011">011</option>
                                <option value="a016">016</option>
                                <option value="a017">017</option>
                                <option value="a018">018</option>
                                <option value="a019">019</option>
                            </select>
                        </div>
                        <div class="hyphen"></div>
                        <div class="input_box">
                            <input type="number" id="phone2" maxlength="4">
                        </div>
                        <div class="hyphen"></div>
                        <div class="input_box">
                            <input type="number" id="phone3" maxlength="4">
                        </div>
                    </div>
                    <div class="mail_wrap section_wrap">
                        <div class="tit">E-mail</div>
                        <div class="input_box">
                            <input type="text" id="email1">
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
                            <div class="txt">강남에서 대학가기 주최 설명회 소식 혹은 학원 설명회 광고를 문자나 이메일로 받으시겠습니까?</div>
                            <div class="messege_wrap">
                                <div class="txt">문자 수신동의</div>
                                <div class="input_txt">
                                <label><input type="radio" value="yes" name="agreement1" id="agreesmsy">
                            	예</label></div>
                                <div class="input_txt">
                                <label><input type="radio" value="no" name="agreement1" id="agreesmsn">
                            	아니오</label></div>
                            </div>
                            <div class="email_wrap">
                                <div class="txt">이메일 수신동의</div>
                                 <div class="input_txt">
                                <label><input type="radio" value="yes" name="agreement2" id="agreeemaily">
                            	예</label></div>
                                <div class="input_txt">
                                <label><input type="radio" value="no" name="agreement2" id="agreeemailn">
                            	아니오</label></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cannext_wrap">
                    <div class="btn cancel" onclick="location.href='/'">취 소</div>
                    <div class="btn next" onclick="next()">다 음</div>
                </div>
            </div>
        </div>
        <footer>
            <div class="inner">
                <div class="logo" onclick="location.href='/'"><label><span >L</span>ogo</label></div>
                <div class="txt">주소 : 서울 강남구 테헤란로 407 EK타워 4층 미래로입시컨설팅대표이사 : 이혁진 
<br>상담시간 : 월 ~ 금 - 오전 10시 ~ 오후 9시 ( 점심시간 오전 11시 30분 ~ 오후 1시)   토 - 오전 10시 ~ 오후 5시
<br>Copyright(c) TS group. All Rights Reserved.</div>
            </div>
        </footer>
    </body>
    
    <script>
    	$("#document").ready(function(){
    		idBtn = 0;
    		nickBtn = 0;
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
 		// 닉네임 입력
 		$("#nick").keyup(function(){
 			nickBtn = 0;
 			document.getElementById("nick").style.color = "black";
 		});
 		// 닉네임 중복체크
 		function nickCheck(){
 			var nick = $("#nick").val();
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
 			if(id=="" || nick=="" || pw=="" || pw2=="" || addr1=='choose' || addr2=="" || phone1=='choose' || phone2=="" || phone3=="" ||
 					email1=="" || email2=="" || !agreesms || !agreeemail){
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
	 			}
	 			if(nick.length<2 || nick.length>6){
	 				alert("닉네임은 2~6자로 설정해주세요");
	 				return;
	 			} else if(nick.indexOf(" ")>0){
	 				alert("닉네임에 공백은 사용할 수 없습니다.");
	 			}
	 			if(pw.length<6 || pw.length>16){
	 				alert("비밀번호는 6~16자로 설정해주세요.");
	 				return;
	 			} else if(pw.indexOf(" ")>0){
	 				alert("비밀번호에 공백은 사용할 수 없습니다.");
	 			}
	 			$.ajax({
	 				type : "post",
	 				url : "/join/normal/"+id+"/"+name+"/"+nick+"/"+pw+"/"+addr1+"/"+addr2+"/"+phone+"/"+agreesms+"/"+agreeemail+"?email="+email,
	 				async : false,
	 				success : function(txt){
	 					if(txt){
	 						alert("회원가입 완료");
	 						location.href="/join/normal/3";
	 					} else {
	 						alert("가입에 실패하였습니다.\n잠시후 다시 시도해주세요.");
	 					}
	 				}
	 			});
			}
 		}
    </script>
    
</html>