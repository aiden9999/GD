<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/css/style.css" type="text/css">
        <link rel="stylesheet" href="/css/swiper.min.css">
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
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=i9nljBxxeJZYnyH27RC1"></script>
        <title></title>
        
        <style>
            
        </style>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/common.js"></script>
    </head>
     
    <body style="overflow: hidden">
        <div class="info_page">
            <div class="inner" style="width: 100%">
                <div class="container" style="width: 100%; margin: 0px; padding: 0px">
                    <div class="tit">회원 탈퇴</div>
                    <div class="withdrawa_wrap">
                        <div class="withdrawa_txt" style="width: 100%">
                            <div class="logo_wrap">
                                <div class="logo"><span>L</span>ogo</div>
                                <div class="txt"></div>
                            </div>
                            <div class="txt1">
                            	회원 탈퇴가 완료 되었습니다.<br>그동안 강남에서 대학가기를 이용해 주셔서 감사합니다.
							</div>
                        </div>
                    </div>
                    <div class="confirm_btn1" onclick="closeView()" style="margin-top: 50px; margin-bottom: 0px">
                        <div class="txt">메인으로</div>
                    </div>
                </div>
            </div>
        </div>

	<script>
		function closeView(){
			window.opener.location.href="/logout";
			window.close();
		}
	</script>
	
    </body>
</html>

