<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/addrlinkSample.css" type="text/css">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/js/common.js"></script>
<%
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String roadAddrPart2 = request.getParameter("roadAddrPart2");
	String engAddr = request.getParameter("engAddr");
	String jibunAddr = request.getParameter("jibunAddr");
	String zipNo = request.getParameter("zipNo");
	String addrDetail = request.getParameter("addrDetail");
	String admCd = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdMgtSn = request.getParameter("bdMgtSn");
%>
</head>
<script language="javascript">
	function init() {
		var confmKey = "U01TX0FVVEgyMDE3MDIwMzEzMzEyNTE4NzQy";
		var url = location.href;
		var resultType = "2"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
		var inputYn = "<%=inputYn%>";
		if (inputYn != "Y") {
			document.form.confmKey.value = confmKey;
			document.form.returnUrl.value = url;
			document.form.resultType.value = resultType;
			document.form.action = "http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
// 			document.form.action = "http://127.0.0.1/admin/search"; //인터넷망
			document.form.submit();
		} else {
			opener.jusoCallBack("<%=roadFullAddr%>", "<%=roadAddrPart1%>", "<%=addrDetail%>", "<%=roadAddrPart2%>", "<%=engAddr%>", "<%=jibunAddr%>", "<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>");
			window.close();
		}
	}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" />
		<input type="hidden" id="returnUrl" name="returnUrl" value="" />
		<input type="hidden" id="resultType" name="resultType" value="" />
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>