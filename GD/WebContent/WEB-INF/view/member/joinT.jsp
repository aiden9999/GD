<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <li onclick="location.href='/elementary'">
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
        <div class="join01-01">
            <div class="inner">
                <div class="tit">
                    <div class="icon_wrap">
                        <div class="img"><img src="/img/login_black_teacher.png"></div>
                        <div class="txt">선생님 회원가입 절차</div>
                    </div>
                    <div class="step"><span>1.실명확인 및 약관동의</span>  >  2.회원 정보작성 > 3.가입완료</div>
                </div>
                <div class="terms_wrap">
                    <div class="terms_wrapper">
                        <div class="terms_box">
                            <div class="term_tit">
                                <div class="circle"></div>
                                <div class="txt">강남에서 대학가기 회원약관</div>
                            </div>
                            <div class="txt_wrap">
                                <div class="sub_tit">제 1 장 총 칙</div>
                                <div class="txt">제 1 조 (목적) <br>
                                    이 약관은 주식회사 강남에서 대학가기(이하 '회사'라 합니다)와 이용 고객
                                    (이하 '회원'이라 합니다)간에 회사가 제공하는 강남에서 대학가기 서비스
                                    (이하 '강남에서 대학가기' 또는 '서비스'라 합니다)의 가입조건 및 이용에 
                                    관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 
                                    목적으로 합니다.</div>
                                <div class="txt">제 2 조 (목적) <br> 
                                    이 약관은 주식회사 강남에서 대학가기(이하 '회사'라 합니다)와 이용 고객
                                    (이하 '회원'이라 합니다)간에 회사가 제공하는 강남에서 대학가기 서비스
                                    (이하 '강남에서 대학가기' 또는 '서비스'라 합니다)의 가입조건 및 이용에 
                                    관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 
                                    목적으로 합니다.</div>
                                <div class="txt">제 3 조 (목적) <br> 
                                    이 약관은 주식회사 강남에서 대학가기(이하 '회사'라 합니다)와 이용 고객
                                    (이하 '회원'이라 합니다)간에 회사가 제공하는 강남에서 대학가기 서비스
                                    (이하 '강남에서 대학가기' 또는 '서비스'라 합니다)의 가입조건 및 이용에 
                                    관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 
                                    목적으로 합니다.</div>
                            </div>
                        </div>
                        <div class="agree">
                            <label>
                                <input type="radio" value="yes" name="agreement" id="agree1">위 약관에 동의합니다.
                            </label>
                        </div>
                    </div>
                    <div class="terms_wrapper">
                        <div class="terms_box">
                            <div class="term_tit">
                                <div class="circle"></div>
                                <div class="txt">개인정보 수집 및 이용에 대한 안내</div>
                            </div>
                            <div class="txt_wrap">
                                <div class="sub_tit">제 1 장 총 칙</div>
                                <div class="txt">제 1 조 (목적) <br>
                                    이 약관은 주식회사 강남에서 대학가기(이하 '회사'라 합니다)와 이용 고객
                                    (이하 '회원'이라 합니다)간에 회사가 제공하는 강남에서 대학가기 서비스
                                    (이하 '강남에서 대학가기' 또는 '서비스'라 합니다)의 가입조건 및 이용에 
                                    관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 
                                    목적으로 합니다.</div>
                                <div class="txt">제 2 조 (목적) <br> 
                                    이 약관은 주식회사 강남에서 대학가기(이하 '회사'라 합니다)와 이용 고객
                                    (이하 '회원'이라 합니다)간에 회사가 제공하는 강남에서 대학가기 서비스
                                    (이하 '강남에서 대학가기' 또는 '서비스'라 합니다)의 가입조건 및 이용에 
                                    관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 
                                    목적으로 합니다.</div>
                                <div class="txt">제 3 조 (목적) <br> 
                                    이 약관은 주식회사 강남에서 대학가기(이하 '회사'라 합니다)와 이용 고객
                                    (이하 '회원'이라 합니다)간에 회사가 제공하는 강남에서 대학가기 서비스
                                    (이하 '강남에서 대학가기' 또는 '서비스'라 합니다)의 가입조건 및 이용에 
                                    관한 제반 사항과 기타 필요한 사항을 구체적으로 규정함을 
                                    목적으로 합니다.</div>
                            </div>
                        </div>
                        <div class="agree">
                            <label>
                                <input type="radio" value="yes1" name="agreement1" id="agree2">위 약관에 동의합니다.
                            </label>
                        </div>
                    </div>
                </div>
                <div class="confirm_wrap">
                    <div class="confirm_tit">실명확인</div>
                    <div class="confirm_txt"><span>휴대폰 인증 </span>메시지 수신 가능한 휴대폰으로 인증번호를 받으실 수 있습니다.</div>
                    <div class="btn_wrap">
                        <div class="confirm_btn">
                            <div class="inner">
                                <div class="img"><img src="/img/join01_01_phone.png"></div>
                                <div class="txt" onclick="certification()">휴대폰 인증하기</div>
                            </div>
                        </div>
                    </div>
                    <div class="txt"><span>강남에서 대학가기는</span><br>   
『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제23의 2 “ 주민등록번호의 사용 제한”에 의거하여 개인 주민등록번호를 수집, 이용하지 않습니다. <br>   
이에 대한 본인확인 인증수단으로 ‘휴대폰 본인확인 서비스’ 를 제공합니다. <br>   
강남에서 대학가기의 본인확인 서비스는 한국모바일인증㈜에서 제공합니다.</div>
                    <div class="cannext_wrap">
                        <div class="btn cancel" onclick="location.href='/join'">취 소</div>
                        <div class="btn next" onclick="next()">다 음</div>
                    </div>
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
		// 다음
		function next(){
			alert("next");
		}
		// 본인인증
		function certification(){
			if(!($("#agree1").prop("checked") && $("#agree2").prop("checked"))){
				alert("약관에 동의해주세요.");
			} else {
				alert("인증");
			}
		}
    </script>
    
</html>