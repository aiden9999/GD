<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head> 



<script type="text/JavaScript" src="/js/lib/jquery_latest.js"></script>
<script type="text/JavaScript" src="/js/lib/jquery_faq.js"></script>
<script type="text/JavaScript" src="/js/lib/rnic-common.js"></script>
<script type="text/JavaScript"  src="/js/lib/ajax.js"></script>
<script type="text/JavaScript" src="/js/lib/rnic-search.js"></script>

<link rel="stylesheet" type="text/css" href="/css/addrlink/common.css"></link>
<link rel="stylesheet" type="text/css" href="/css/addrlink/layout.css"></link>
<link rel="stylesheet" type="text/css" href="/css/addrlink/addrlink.css"></link>

<script type="text/javascript" src="/js/lib/modernizr.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery.easing.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/js/lib/ui-front.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>



<title>강남에서 대학가기 주소검색</title>
<script language="javascript">
	//특수문자, 특정문자열(sql예약어) 제거
	function checkSearchedWord(obj){
		//특수문자 제거
		if(obj.value.length >0){
			var expText = /[%=><]/ ;
			if(expText.test(obj.value) == true){
				obj.value = obj.value.split(expText).join(""); 
			}
			//체크 문자열
			var sqlArray = new Array( //sql 예약어
				"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC", "UNION",  "FETCH", "DECLARE", "TRUNCATE"
			);
			
			var regex ;
			var regex_plus ;
			for(var i=0; i<sqlArray.length; i++){
				regex = new RegExp("\\s" + sqlArray[i] + "\\s","gi") ;
				if (regex.test(obj.value)) {
					obj.value =obj.value.replace(regex, "");
				}
				regex_plus = new RegExp( "\\+" + sqlArray[i] + "\\+","gi") ;
				if (regex_plus.test(obj.value)) {
					obj.value =obj.value.replace(regex_plus, "");
				}
			}
		}
		return obj.value;
	}
	
	function searchUrlJuso(){
		$("#resultData").hide();
		var frm = document.AKCFrm;
		frm.keyword.value = checkSearchedWord(frm.keyword); // 특수문자 및 sql예약어 제거, 20160912
		$("#keyword").val(validateJuso($("#keyword").val())); //공백 및 특수문자 제거
		if(!checkValidate1(frm.keyword, "검색어")) return;
		else if(!checkValidate2(frm.keyword.value)) return;
		$("#keyword").val(regExpCheckJuso($("#keyword").val()));
		$("#AKCFrm").attr("action","http://www.juso.go.kr/addrlink/addrLinkUrlSearch.do").submit(); 
// 		$("#AKCFrm").attr("action","/admin/searchResult").submit(); 
	}
	
	function setParent(){
		var encodingType = "";
		if(encodingType=="EUC-KR"){
			document.charset ="EUC-KR";//파이어폭스에서 이것만쓰면 깨진다고함
			$("#rtForm").attr("accept-charset","EUC-KR");//이것만사용하면 ie에서 깨진다고함
		}
		var returnUrl = location.href;
		var rtRoadAddr = $.trim($("#rtRoadAddr").val());
		var rtAddrPart1 = $.trim($("#rtAddrPart1").val());
		var rtAddrPart2 = $.trim($("#rtAddrPart2").val());
		var rtEngAddr = $.trim($("#rtEngAddr").val());
		var rtJibunAddr = $.trim($("#rtJibunAddr").val());
		var rtAddrDetail = $.trim($("#rtAddrDetail").val());
		var rtZipNo = $.trim($("#rtZipNo").val());
		var rtAdmCd = $.trim($("#rtAdmCd").val());
		var rtRnMgtSn = $.trim($("#rtRnMgtSn").val());
		var rtBdMgtSn = $.trim($("#rtBdMgtSn").val());
		
		var rtRoadFullAddr = rtAddrPart1
		if(rtAddrDetail != "" && rtAddrDetail != null){
			rtRoadFullAddr += ", " + rtAddrDetail;
		}
		if(rtAddrPart2 != "" && rtAddrPart2 != null){
			rtRoadFullAddr += " " + rtAddrPart2;
		}
		
		$("#roadFullAddr").val(rtRoadFullAddr);
		$("#roadAddrPart1").val(rtAddrPart1);
		$("#roadAddrPart2").val(rtAddrPart2);
		$("#engAddr").val(rtEngAddr);
		$("#jibunAddr").val(rtJibunAddr);
		$("#zipNo").val(rtZipNo);
		$("#admCd").val(rtAdmCd);
		$("#rnMgtSn").val(rtRnMgtSn);
		$("#bdMgtSn").val(rtBdMgtSn);

		$("#addrDetail").val(rtAddrDetail);
		$("#rtForm").attr("action",returnUrl).submit();
	}
	
	function setMaping(idx){
		$("#serarchContentBox").css("height","360px");  // 로고 위치 지정
		
		var roadAddr = $("#roadAddrDiv"+idx).text()
		var addrPart1 = $("#roadAddrPart1Div"+idx).text();
		var addrPart2 = $("#roadAddrPart2Div"+idx).text();
		var engAddr = $("#engAddrDiv"+idx).text();
		var jibunAddr = $("#jibunAddrDiv"+idx).text();
		var zipNo = $("#zipNoDiv"+idx).text();
		
		var admCd = $("#admCdHid"+idx).val();
		var rnMgtSn = $("#rnMgtSnHid"+idx).val();
		var bdMgtSn = $("#bdMgtSnHid"+idx).val();
		
		$("#rtRoadAddr").val(roadAddr);
		$("#rtAddrPart1").val(addrPart1);
		$("#rtAddrPart2").val(addrPart2);
		$("#rtEngAddr").val(engAddr);
		$("#rtJibunAddr").val(jibunAddr);
		$("#rtZipNo").val(zipNo);
		$("#rtAdmCd").val(admCd);
		$("#rtRnMgtSn").val(rnMgtSn);
		$("#rtBdMgtSn").val(bdMgtSn);
		
		$("#resultList").hide();
		$("#resultData").show();
		
		$("#addrPart1").html(addrPart1);
		$("#addrPart2").html(addrPart2);
		$("#rtAddrDetail").focus();
	}
	
 	function enterSearchUrl() {
		var evtCode = (window.netscape) ? ev.which : event.keyCode;
		if (evtCode == 13) {    
			event.keyCode = 0;  
			searchUrlJuso(); 
		} 
	}
 	
	function init(){
		var browerName = navigator.appName;
		var browerAgent = navigator.userAgent;
		self.resizeTo(570, 520);
		
		if("" =="P0001" && "" == "1"){
			alert("검색 결과가 너무 많습니다(1,000건 이상)\n검색어 예를 참조하여 검색하시기 바랍니다.");
		}
		
		if("" =="E0005"){
			alert("");
		}
	}
	
	$(document).ready(function(){
		placeHolder();
		$('#searchRdNm').bind('click', function(){
		    $('.popWrap3').css({'display':'block','top':'21px','right':'121px'});
	    });
		$('#popupClose2').bind('click', function(){
	    	$('.popWrap3').css('display','none');
	    });
		
		$('.choIdx a').click(function(event){
			$('.choIdx a').removeClass('on');
			if($(this).hasClass('off')){
				return;
			}else{
				$(this).addClass('on');
				event.preventDefault();
				var target =this.hash;
				var $target=$(target);
				var top = $(target).position().top-106;
				if(prevPosition ==0){
					$('#roadNameList2').scrollTop(top);
					prevPosition = top;
				}else{
					$('#roadNameList2').scrollTop(prevPosition+top);
					prevPosition = prevPosition + top;
				}
				
				if($('#roadNameList2')[0].scrollHeight - $('#roadNameList2').scrollTop() == $('#roadNameList2').innerHeight()){
					prevPosition = $('#roadNameList2').scrollTop();
				}
			}
		});
		$('#roadNameList2').children().css('display','none');
		$('#roadNameList2').scroll(function(){prevPosition = this.scrollTop;});
	});
	window.onresize = placeHolderPoint;
	
	function placeHolderPoint(){
		$(":input[placeholderTxt]").each(function(){
			var labelId = "label"+this.id;
			var objVal = $(this).val();
			var placeTxt = $(this).attr("placeholderTxt");
			var left = parseInt($(this).offset().left);
			var top = parseInt($(this).offset().top);
			
			$("#"+labelId).css({"left":left+"px","top":top+"px"});
		});
	}
	
	function placeHolder(){
		$(":input[placeholderTxt]").each(function(){
			var labelId = "label"+this.id;
			var objVal = $(this).val();
			var placeTxt = $(this).attr("placeholderTxt");
			var left = parseInt($(this).offset().left);
			var top = parseInt($(this).offset().top);
			$(this).after("<label for='"+this.id+"' id='"+labelId+"' style ='position:absolute;left:"+left+"px;top:"+top+"px; font-size:15px;color:#1898d2;font-weight:bold; padding-left:10px;padding-top:11px;'><b>"+placeTxt+"</b></label>");
			
			if(objVal !=""){
				$("#"+labelId).hide();
			}
			
			$(this).focus(function(){
				$("#"+labelId).hide();
			});
			
			$(this).blur(function(){ 
				if($(this).val() == ""){
					$("#"+labelId).show();
				}
			});
		});
	}
	
	function searchTab(tabNum){
		resetDetailSearch()
		if(tabNum == 0){
			$("#roadTr1").show();
			$("#roadTr2").show();
			$("#jibunTr1").hide();
			$("#jibunTr2").hide();
			$("#buildTr1").hide();
			$("#buildTr2").hide();
		}else if(tabNum == 1){
			$("#roadTr1").hide();
			$("#roadTr2").hide();
			$("#jibunTr1").show();
			$("#jibunTr2").show();
			$("#buildTr1").hide();
			$("#buildTr2").hide();
		}else if(tabNum == 2){
			$("#roadTr1").hide();
			$("#roadTr2").hide();
			$("#jibunTr1").hide();
			$("#jibunTr2").hide();
			$("#buildTr1").show();
			$("#buildTr2").show();
		}
	}
	
	function detailSearch(){
		var dssearchType1 = $("input:radio[name=dssearchType1]:checked").val();
		var dscity1Val = $("#dscity1 option:selected").val();
		var dscounty1Val = $("#dscounty1 option:selected").val();
		if(dscity1Val == ""){
			alert("시도를 선택하세요.");
			return;
		}
		if(dscounty1Val == ""){
			alert("시군구를 선택하세요.");
			return;
		}

		var dscity1 = $("#dscity1 option:selected").text();
		var dscounty1 = $("#dscounty1 option:selected").text();
		var dstown = "";
		var dssan=0;
		var searchStr =  dscity1 + " " + dscounty1
		if(dssearchType1 == "road"){
			var dsrdNm1Val = $("#dsrd_nm1 option:selected").val();
			if(dsrdNm1Val == ""){
				alert("도로명을 선택하세요.");
				return;
			}
			var dsrdNm1 = $("#dsrd_nm1 option:selected").text();
			var dsma = $("#dsma").val();
			if(dsma == ""){
				alert("건물본번을 입력하세요.");
				return;
			}
			var dssb = $("#dssb").val();
			var dssbDash = "";
			if(dssb != ""){
				dssbDash = "-";
			}
			searchStr =  searchStr + " " + dsrdNm1 +" "+ dsma +dssbDash+dssb
		}else if(dssearchType1 == "jibun"){
			var dstown1Val = $("#dstown1 option:selected").val();
			
			if(dstown1Val == ""){
				alert("읍면동/리 를 선택하세요.");
				return;
			}
			dstown = $("#dstown1 option:selected").text();
			
			searchStr =  searchStr + " " + dstown;
			
			var dsri1Val = $("#dsri1 option:selected").val();
			if(dsri1Val != ""){
				var dsri1 = $("#dsri1 option:selected").text();
				searchStr =  searchStr + " " + dsri1
			}
			
			var dschSan = $("input:checkbox[name='dsch_san']").is(":checked");
			if(dschSan == true){
				searchStr =  searchStr + " 산";
				dssan = 1;
			}
			
			var dsbun1 = $("#dsbun1").val();
			if(dsbun1 == ""){
				alert("본번을 입력하세요.");
				return;
			}
			var dsbun2 = $("#dsbun2").val();
			var dsbun2Dash=""
			if(dsbun2 != ""){
				dsbun2Dash = "-";
			}
			searchStr =  searchStr + " " +dsbun1 + dsbun2Dash + dsbun2
		}else if(dssearchType1 == "building"){
			var dstown2Val = $("#dstown2 option:selected").val();
			if(dstown2Val == ""){
				alert("읍면동을 입력하세요.");
				return;
			}
			dstown = $("#dstown2 option:selected").text();
			searchStr = searchStr + " " + dstown;
			var dsbuilding1 = $.trim($("#dsbuilding1").val());
			if(dsbuilding1 == ""){
				alert("건물명을 입력하세요.");
				$("#dsbuilding1").val("");
				return;
			}
			searchStr = searchStr + " " + dsbuilding1;
		}
		$("#keyword").focus();
		$("#keyword").val(searchStr);
		$("#resultList").hide();
		$("#resultData").hide();
		
		$("#searchType").val("DETAIL");
		$("#dsgubuntext").val(dssearchType1); //구분
		$("#dscity1text").val(dscity1); //시도
		$("#dscounty1text").val(dscounty1); //시군구
		$("#dsemd1text").val(dstown); //읍면동
		$("#dsri1text").val(dsri1); //리
		$("#dsrd_nm1text").val(dsrdNm1); //도로명
		$("#dsbuilding1").val(dsbuilding1); //건물명
		$("#dssan1text").val(dssan); //산
		$("#dsma").val(dsma); //건물본번
		$("#dssb").val(dssb); //건물부번
		$("#dsbun1").val(dsbun1); //본번
		$("#dsbun2").val(dsbun2); //부번       
		$("#AKCFrm").attr("action","/addrlink/addrLinkUrlSearch.do").submit();
	}
	
	function isNumChk(){
		var evtCode = (window.netscape) ? ev.which : event.keyCode;
		if((evtCode < 48 || evtCode > 57) && evtCode!=8){ 
			event.preventDefault(); 
		}
	}
	function detailEnterSearch(){
		var evtCode = (window.netscape) ? ev.which : event.keyCode;
		if (evtCode == 13) {    
			event.keyCode = 0;  
			detailSearch();
		} 
	}
	
	function addrDetailChk(){
		var evtCode = (window.netscape) ? ev.which : event.keyCode;
		if(evtCode == 63 || evtCode == 35 || evtCode == 38 || evtCode == 43 || evtCode == 92 || evtCode == 34){ // # & + \ " 문자제한
			alert('특수문자 ? # & + \\ " 를 입력 할 수 없습니다.');
			if(event.preventDefault){
				event.preventDefault();
			}else{
				event.returnValue=false;
			}
		}
	}
	
	function addrDetailChk1(obj){
		if(obj.value.length > 0){
			var expText = /^[^?#&+\"\\]+$/;
			if(expText.test(obj.value) != true){
				alert('특수문자 ? # & + \\ " 를 입력 할 수 없습니다.');
				obj.value="";
			}
		}
	}
	
	function popClose(){
		window.close();
	}
	
	function addrJuminRenew(idx){
		$("#detDivX"+idx).show();
		$("#detListDivX"+idx).show();
		$("#detDiv"+idx).hide();
		
		var docHeight = $("#resultList").height(); // 결과 DIV 높이 가져옴
		if(docHeight > 300){ // 높이가 310인 경우 로고 위치 조정
			docHeight += 60;
			$("#serarchContentBox").css("height",docHeight+"px");// 로고 위치 지정
		}else{
	    	$("#serarchContentBox").css("360px");// 로고 위치 지정
	    }
	}
	function addrJuminRenewX(idx){
		$("#detDivX"+idx).hide();
		$("#detListDivX"+idx).hide();
		$("#detDiv"+idx).show();
		
		var docHeight = $("#resultList").height(); // 결과 DIV 높이 가져옴
		if(docHeight > 300){ // 높이가 310인 경우 로고 위치 조정
			docHeight += 60;
			$("#serarchContentBox").css("height",docHeight+"px");// 로고 위치 지정
		}else{
	    	$("#serarchContentBox").css("360px");// 로고 위치 지정
	    }
	}
	
	function inputTxt(){
		$('#keyword').val($('#selectRdNm').val());
		$('.popWrap3').css('display','none');
		$('.choIdx a').removeClass('on');
	}
	
	$(function(){
	    var docHeight = $("#resultList").height(); // 결과 DIV 높이 가져옴
	    
	    if(docHeight > 300){ // 높이가 310인 경우 로고 위치 조정
	    	docHeight += 60;
	    	$("#serarchContentBox").css("height",docHeight+"px");// 로고 위치 지정
	    }else{
	    	$("#serarchContentBox").css("360px");// 로고 위치 지정
	    }
	});
</script>

</head>
<body onload="init();" class ="visualSection"> 
	<form name="rtForm" id="rtForm" method="post">
		<input type="hidden" name="inputYn" id="inputYn" value="Y"/>  
		<input type="hidden" name="roadFullAddr" id="roadFullAddr"/>  
		<input type="hidden" name="roadAddrPart1" id="roadAddrPart1"/>
		<input type="hidden" name="roadAddrPart2" id="roadAddrPart2"/>
		<input type="hidden" name="engAddr" id="engAddr"/>            
		<input type="hidden" name="jibunAddr" id="jibunAddr"/>        
		<input type="hidden" name="zipNo" id="zipNo"/>                
		<input type="hidden" name="addrDetail" id="addrDetail"/>
		<input type="hidden" name="admCd" id="admCd" />
		<input type="hidden" name="rnMgtSn" id="rnMgtSn" />
		<input type="hidden" name="bdMgtSn" id="bdMgtSn" />      
	</form>

	<form name="AKCFrm" id="AKCFrm" method="post">
		<!--<input type="text" name="" id="" style="display:none;"/> textbox한개일경우 엔터시 자동 submit되는거 막기위해-->
		<input type="hidden" name="rtRoadAddr"  id="rtRoadAddr"  />
		<input type="hidden" name="rtAddrPart1" id="rtAddrPart1" />
		<input type="hidden" name="rtAddrPart2" id="rtAddrPart2" />
		<input type="hidden" name="rtEngAddr"   id="rtEngAddr"   />
		<input type="hidden" name="rtJibunAddr" id="rtJibunAddr" />
		<input type="hidden" name="rtZipNo" id="rtZipNo" />
		<input type="hidden" name="rtAdmCd" id="rtAdmCd" />
		<input type="hidden" name="rtRnMgtSn" id="rtRnMgtSn" />
		<input type="hidden" name="rtBdMgtSn" id="rtBdMgtSn" />
		
		<input type="hidden" name ="searchType"    id="searchType" />
		<input type="hidden" name ="dsgubuntext"   id="dsgubuntext" />   
		<input type="hidden" name ="dscity1text"   id="dscity1text" />
		<input type="hidden" name ="dscounty1text" id="dscounty1text" />
		<input type="hidden" name ="dsemd1text"    id="dsemd1text" />
		<input type="hidden" name ="dsri1text"     id="dsri1text" />
		<input type="hidden" name ="dsrd_nm1text"  id="dsrd_nm1text" />
		<input type="hidden" name ="dssan1text"    id="dssan1text" />
	
		<div class="pop-address-search" style="width: 100%;" >
			<div class="pop-address-search-inner" style="border: 0px;">
			<div style="height: 360px;" id="serarchContentBox">
				<fieldset>
					<legend>도로명주소 검색</legend>		
					<span class="wrap">
						<input type="text" class="popSearchInput" style="font-size: 13px; font-weight: bold; ime-mode:active;" title="검색어를 입력하세요" name="keyword" id="keyword" placeholder="도로명주소, 건물명 또는 지번입력" value="" onkeydown="enterSearchUrl();" tabindex="1"/>
						<input type="button" title="검색"  tabindex="2" onclick="javascript:searchUrlJuso();" style=" cursor: pointer;"/>
					</span>
					<a class="close" href="javascript:popClose();" title="창닫기" tabindex="3">닫기</a>
				</fieldset>
				<p class="guide" style="margin-top:3px;">검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동 25)</p>
				
				
				<!-- nodata -->
                
	               <div class="popSearchNoResult" style="margin-top:10px; margin-bottom:5px;">
						
					</div>
                
                
                <!-- //nodata -->
				
				

				<!-- 검색결과 -->
					
				
				<!-- //검색결과 -->
				<!-- 상세주소 -->
				<div class="detail"  style="display:none;" id="resultData">
					<p><strong>상세주소 입력</strong></p>
					<table class="data-row">
						<caption>주소 입력</caption>
						<colgroup>
							<col style="width:20%"></col>
							<col></col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">도로명주소</th>
								<td id="addrPart1" style="font-size:15px; height:20px; line-height:20px;"></td>
							</tr>
							<tr>
								<th scope="row"><label for="inputPopAddress">상세주소입력</label></th>
								<td>
									<input type="text" name="rtAddrDetail" id="rtAddrDetail" style="width: 100%; font-size: 13px;" onkeypress="addrDetailChk();" onkeyup="addrDetailChk1(this);" title="상세주소"/>
									<div id="addrPart2" style="font-size: 13px; line-height: 2em;"></div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btns-submit">
						<a class="btn-bl" href="javascript:setParent();">주소입력</a>
					</div>
				</div>
			</div>
				<!-- //상세주소 입력 -->
			<div class="logo" style="display: block;" >&nbsp;</div>
			</div>
		</div>
		</form>
</body>
</html>
