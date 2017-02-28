<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
		<link rel="stylesheet" href="/css/ggs_style.css" type="text/css">
		<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
			rel='stylesheet' type='text/css'>
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<meta name="robots" content="follow">
		<meta name="description"
			content="대치동수학학원 대치동영어학원 대치동과학학원 대치동논술학원 강남재수학원">
		<meta name="keywords" content="대치동수학학원 대치동영어학원 대치동과학학원 대치동논술학원 강남재수학원">
		<meta property="og:type" content="website">
		<meta property="og:title" content="강남에서 대학가기">
		<meta property="og:description" content="대치동수학학원 대치동영어학원 대치동과학학원 대치동논술학원 강남재수학원">
		<meta property="og:image" content="http://www.mysite.com/myimage.jpg">
		<meta property="og:url" content="http://www.gogosky.co.kr">
		<meta name="naver-site-verification" content="845557ce7747caed7b061d3a096c9396db155afd"/>
        <title></title>
        
        <style>
            
        </style>
         
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="/js/ggs_common.js"></script>
    </head>
     
    <body>
        <header>
			<c:import url="/WEB-INF/view/main/header.jsp"/>
		</header>
        <div class="join02">
        	<form action="/admin/registCommit" enctype="multipart/form-data" method="post" id="form">
	            <div class="inner">
	                <div class="prize_tit">
	                    <div class="img">
	                        <img src="/img/prize.png">
	                    </div>
	                    <div class="txt">학원등록</div>
	                </div>
	                <div class="save_section">
	                    <div class="save_box save_name">
	                        <div class="txt">학원이름</div>
	                        <input type="text" id="name" name="name" placeholder="ex) 강남대치학원">
	                    </div>
	                    <div class="save_box save_address">
	                        <div class="txt">학원주소</div>
	                        <input type="text" id="address" name="addr" placeholder="우편번호 클릭" readonly="readonly">
	                        <div class="btn" onclick="postCode()">우편번호</div>
	                    </div>
	                    <div class="save_box save_address">
	                        <div class="txt">지번주소</div>
	                        <input type="text" id="address1" name="addr1" placeholder="우편번호 클릭" readonly="readonly">
	                    </div>
	                    <div class="save_box save_phone">
	                        <div class="txt">학원 전화번호</div>
	                        <input type="text" id="tell" name="tell" placeholder="ex) 02-123-4567">
	                    </div>
	                    <div class="save_box save_sort">
	                        <div class="txt">분류1</div>
	                        <select id="type1" name="type1">
	                            <option value="1">1</option>
	                            <option value="2">2</option>
	                            <option value="3">3</option>
	                        </select>
	                    </div>
	                    <div class="save_box save_sort save_sort1">
	                        <div class="txt">분류2</div>
	                        <select id="type2" name="type2">
	                            <option value="1">1</option>
	                            <option value="2">2</option>
	                            <option value="3">3</option>
	                        </select>
	                    </div>
	                    <div class="save_box save_homepage">
	                        <div class="txt">홈페이지주소</div>
	                        <div class="txt1">http://</div>
	                        <input type="text" id="site" name="site" placeholder="gogosky.co.kr">
	                    </div>
	                    <div class="save_box save_logo">
	                        <div class="txt">학원로고</div>
	                        <div class="btn" onclick="logo()">파일선택</div>
	                        <input type="file" id="logo" name="logo" style="display: none"/>
	                        <div class="txt1">5mb 이하 파일을 선택해주세요. (373px x 186px 사이즈로 업로드 해주십시오.)</div>
	                    </div>
	                    <div class="save_box save_intro">
	                        <div class="txt">학원 소개</div>
	                        <textarea id="intro" name="intro" placeholder="최대 500자 까지 가능합니다." maxlength="500" style="resize: none"></textarea>
	                    </div>
	                    <div class="save_box save_img">
	                        <div class="txt">학원이미지</div>
	                        <div class="plus_box">
	                            <div class="plus_circle">
	                                <div class="plus" onclick="picture(1)" id="pic11">+</div>
	                                <input type="file" id="pic1" name="pic1" style="display: none" class="picFile"/>
	                            </div>
	                        </div>
	                        <div class="plus_box">
	                            <div class="plus_circle">
	                                <div class="plus" onclick="picture(2)" id="pic22">+</div>
	                                <input type="file" id="pic2" name="pic2" style="display: none" class="picFile"/>
	                            </div>
	                        </div>
	                        <div class="plus_box">
	                            <div class="plus_circle">
	                                <div class="plus" onclick="picture(3)" id="pic33">+</div>
	                                <input type="file" id="pic3" name="pic3" style="display: none" class="picFile"/>
	                            </div>
	                        </div>
	                        <div class="plus_box">
	                            <div class="plus_circle">
	                                <div class="plus" onclick="picture(4)" id="pic44">+</div>
	                                <input type="file" id="pic4" name="pic4" style="display: none" class="picFile"/>
	                            </div>
	                        </div>
	                        <div class="plus_box">
	                            <div class="plus_circle">
	                                <div class="plus" onclick="picture(5)" id="pic55">+</div>
	                                <input type="file" id="pic5" name="pic5" style="display: none" class="picFile"/>
	                            </div>
	                        </div>
	                        <div class="txt1">최소1장 ~ 최대5장 까지 등록 가능합니다. (795px x 510px 사이즈로 업로드 해주십시오.)</div>
	                    </div>
	                    <div class="save_box save_target">
	                        <div class="txt">수업대상</div>
	                        <input type="text" id="target" name="target" placeholder="초등,중등,고등">
	                    </div>
	                    <div class="save_box save_subject">
	                        <div class="txt">수업과목</div>
	                        <input type="text" id="subject" name="subject" placeholder="국어,영어,수학">
	                    </div>
	                    <div class="txt2">※사진을 업로드 하실때 위 사이즈가 아니면 화질이 깨지거나 사진이 늘어날 수 있습니다.※</div>
	                </div>
	                <div class="cannext_wrap">
	                    <div class="btn cancel" onclick="history.back()">취 소</div>
	                    <div class="btn next" onclick="commit()">등 록</div>
	                </div>
	            </div>
            </form>
        </div>
        <footer>
			<c:import url="/WEB-INF/view/main/footer.jsp"/>
        </footer>
    </body>
    
    <script>
    	// 사진 변경시 이미지 보여주기
    	$(document).ready(function(){
    		alert("ready");
    		$("#pic1").change(function(){
    			alert("11");
    			showImg(this);
    		});
    	});
    	function showImg(element){
    		var id = element.id;
    		id = id.substring(id.indexOf('c')+1);
    		alert(id);
    		if(element.files && element.files[0]){
    			alert("aa");
    			var reader = new FileReader();
    			reader.onload = function(e){
    				alert("bb");
    				$("#pic"+id+""+id).css("background-image", e.target.result);
    			}
    		}
    	}
 		// 검색란에서 엔터입력
		$("#hsearch").keyup(function(txt){
			if(txt.keyCode==13){
	    		var search = $("#hsearch").val();
	    		if(search!=""){
	    			location.href="/search/"+search;
	    		}
			}
		});
		// 검색버튼 클릭
		function search(){
			var search = $("#hsearch").val();
			if(search!=""){
				location.href="/search/"+search;
			}
		}
	  	// 로그인
	  	function login(){
	  		// 회원가입 페이지로 이동
	  		location.href="/join";
	  	}
	  	// 등록
	  	function commit(){
	  		var name = $("#name").val();
	  		var addr1 = $("#address").val();
	  		var addr2 = $("#address1").val();
	  		var tell = $("#tell").val();
	  		var type1 = $("#type1").val();
	  		var type2 = $("#type2").val();
	  		var site = $("#site").val();
	  		var logo = $("#logo").val();
	  		var intro = $("#intro").val();
	  		var pic1 = $("#pic1").val();
	  		var pic2 = $("#pic2").val();
	  		var pic3 = $("#pic3").val();
	  		var pic4 = $("#pic4").val();
	  		var pic5 = $("#pic5").val();
	  		var target = $("#target").val();
	  		var subject = $("#subject").val();
	  		if(logo==""){
	  			alert("학원로고는 필수로 등록해주세요.");
	  		} else if(pic1==""){
	  			alert("학원이미지는 1장이상 등록해야합니다.");
	  		} else if(name=="" || addr1=="" || addr2=="" || tell=="" || type1=="choose" || type2=="choose" || site=="" || intro=="" ||
	  						target=="" || subject==""){
	  			alert("입력하지 않은 항목이 있습니다.");
	  		} else {
	  			$("#form").submit();
	  		}
	  	}
	  	// 우편번호
	    function postCode(){
	  		var width = window.innerWidth;
	  		var height = window.innerHeight; 
			window.open("/admin/postCode", "postCode", "width=500px; height=550px; left="+width/2+" top="+height/2);
		}
	  	// 우편번호
	    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn){
	    	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	    	$("#address").val(roadFullAddr);
	    	$("#address1").val(jibunAddr+" "+addrDetail);
	    }
	  	// 로고 선택
	  	function logo(){
	  		$("#logo").trigger("click");
	  	}
	  	// 사진 선택
	  	function picture(num){
	  		$("#pic"+num).trigger("click");
	  	}
    </script>
    
</html>