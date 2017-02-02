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
                	<c:if test="${login==null }">
	                	<div class="txt" onclick="login()">로그인</div>
                	</c:if>
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
                        <li onclick="location.href='/elementary'" class="gnb_menu">
                            <div class="txt">초등학원</div>
                        </li>
						<li onclick="location.href='/middle'" class="gnb_menu">
                            <div class="txt">중등학원</div>
                        </li>
                        <li onclick="location.href='/high'" class="gnb_menu">
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
        <div class="admin01">
            <div class="inner">
                <div class="tit">
                    <div class="icon_wrap">
                        <div class="img"><img src="/img/key.png"></div>
                        <div class="txt">강남에서 대학가기 관리자 페이지</div>
                    </div>
                </div>
                <div class="container">
                    <div class="tab_wrap">
                        <div class="tit sel" id="t1" onclick="tab(1)">
                            <div class="txt"> 회 원 목 록 </div>
                        </div>
                        <div class="tit" id="t2" onclick="tab(2)">
                            <div class="txt"> 게 시 판 관 리 </div>
                        </div>
                        <div class="tit" id="t3" onclick="tab(3)">
                            <div class="txt"> 문 자 전 송 </div>
                        </div>
                        <!-- tab1 -->
                        <div class="contents" id="tab1">
                            <div class="inner">
                                <div class=list_wrap>
                                    <div class="tit">회원목록</div>
                                    <div class="list">
                                    	<c:forEach var="i" begin="0" end="${memberList.size()-1 }">
	                                        <div class="name_wrap">
	                                            <div class="dot"></div>
	                                            <div class="name" style="cursor: pointer;" onclick="memberInfo(this)" id="${memberList.get(i).ID }">
	                                            	${memberList.get(i).NAME }(${memberList.get(i).ID })
	                                            </div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <div class="detailinfo_wrap" id="memDetail">
                                    <div class="tit">상세정보</div>
                                    <div class="info_wrap">
                                        <div class="tit">아이디</div>
                                        <div class="txt" id="id">${memberList.get(0).ID }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">이름</div>
                                        <div class="txt">${memberList.get(0).NAME }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">필명</div>
                                        <div class="txt">${memberList.get(0).NICK }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">구분</div>
                                        <div class="txt" id="what">${memberList.get(0).WHAT }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">등급</div>
                                        <div class="txt" id="grade">${memberList.get(0).GRADE }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">전화번호</div>
                                        <div class="txt">${memberList.get(0).PHONE }</div>
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">이메일</div>
                                        <div class="txt">${memberList.get(0).EMAIL }</div>
                                    </div>
                                    <c:choose>
                                    	<c:when test="${memberList.get(0).ADMIN=='y' }">
                                    		<c:choose>
                                    			<c:when test="${memberList.get(0).NAME=='관리자' }">
				                                    <div class="info_wrap checks">
				                                        <input type="checkbox" id="giveAdmin" checked="checked" disabled="disabled">
				                                        <label for="giveAdmin" class="tit">관리자 권한부여</label>
				                                    </div>
                                    			</c:when>
                                    			<c:otherwise>
				                                    <div class="info_wrap checks">
				                                        <input type="checkbox" id="giveAdmin" checked="checked">
				                                        <label for="giveAdmin" class="tit">관리자 권한부여</label>
				                                    </div>
                                    			</c:otherwise>
                                    		</c:choose>
                                    	</c:when>
                                    	<c:otherwise>
		                                    <div class="info_wrap checks">
		                                        <input type="checkbox" id="giveAdmin">
		                                        <label for="giveAdmin" class="tit">관리자 권한부여</label>
		                                    </div>
                                    	</c:otherwise>
                                    </c:choose>
                                    <div class="cannext_wrap" style="margin: 70px 0">
                                        <div class="btn cancel" onclick="location.href='/'">취 소</div>
                                        <c:choose>
                                        	<c:when test="${memberList.get(0).NAME=='관리자' }">
		                                        <div class="btn next" style="cursor: default;">저 장</div>
                                        	</c:when>	
                                        	<c:otherwise>
                                        		<div class="btn next" onclick="tab1Save()">저 장</div>
                                        	</c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab2 -->
                        <div class="contents" id="tab2" style="display: none">
                            <div class="inner">
                                <div class="board_sel">
                                    <select id="nowBoard">
                                        <option value="choose">게시판 선택</option>
                                        <option value="notice">공지사항</option>
                                        <option value="highExam">고등입시</option>
                                        <option value="univExam">대학입시</option>
                                    </select>
                                </div>
                                <div class=list_wrap>
                                    <div class="tit">글 목록</div>
                                    <div class="list" id="boardList" style="height: 350px">
                                        <div class="name_wrap">
                                            <div class="name">게시판을 선택해주세요.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="detailinfo_wrap2">
                                    <div class="tit">상세정보</div>
                                    <div class="info_wrap">
                                        <div class="tit">제목</div>
                                        <input type="text" id="tab2Title" readonly="readonly">
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">작성자</div>
                                        <input type="text" id="tab2Writer" readonly="readonly">
                                    </div>
                                    <div class="info_wrap">
                                        <div class="tit">내용</div>
                                        <textarea id="tab2Content" style="resize: none; heigth: 300px" readonly="readonly"></textarea>
                                    </div>
                                    <div class="board_sel" style="margin-top: 200px">
<!--                                         <select id="targetBoard" style="margin-top: 200px"> -->
<!--                                             <option value="choose">게시판 선택</option> -->
<!--                                             <option value="notice">공지사항</option> -->
<!--                                             <option value="exam">입시정보</option> -->
<!--                                         </select> -->
                                        <div class="btn" onclick="boardDelete()" style="margin-left: 160px">삭제</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab3 -->
                        <div class="contents" id="tab3" style="display: none">
                            <div class="inner">
                                <div class="list_wrap list_wrap3">
                                    <div class="tit">회원목록</div>
                                    <div class="list">
                                    	<c:forEach var="i" items="${memberList }">
	                                        <div class="name_wrap">
	                                            <div class="dot"></div>
	                                            <div class="name" onclick="take(this)" style="cursor: pointer;">${i.NAME }(${i.ID })</div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                                <div class="receive_wrap">
                                    <div class="tit">수신목록&nbsp;
                                    	<font style="color: black; font-weight: normal; font-size: 15px" id="giveCount">0 / 100</font>
                                    </div>
                                    <div class="list" id="takeList"></div>
                                </div>
                                <div class="letter_wrap">
                                    <div class="tit">문자 전송</div>
                                    <textarea placeholder="내용을 입력해주세요." style="resize: none" id="message"></textarea>
                                    <div class="txt" id="words">0 / 200</div>
                                    <div class="cannext_wrap">
                                        <div class="btn cancel" onclick="location.href='/'">취 소</div>
                                        <div class="btn next">전 송</div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
		// 탭이동
		function tab(num){
			for(var i=1; i<4; i++){
				var x = document.getElementById("t"+i);
            	if(i==num){
            		if(x.className.indexOf(" sel") == -1){
            			x.className += " sel";
            			$("#tab"+i).show();
            		}
            	} else {
            		x.className = x.className.replace(" sel", "");
            		$("#tab"+i).hide();
            	}
			}
		}
		// tab1 회원 상세정보
		function memberInfo(element){
			var id = element.id;
			$.ajax({
				type : "post",
				url : "/admin/memberDetail/"+id,
				async : false,
				success : function(txt){
					$("#memDetail").html(txt);
				}
			});
		}
		// 관리자 권한주기, 권한뺏기 및 저장
		function tab1Save(){
			var admin = $("#giveAdmin").prop("checked");
			var id = $("#id").html();
			var what = $("#what").html();
			var grade = $("#grade").html();
			if(admin){
				$.ajax({
					type : "post",
					url : "/admin/giveAdmin/"+id+"/"+what+"/"+grade,
					async : false,
					success : function(txt){
						if(txt){
							alert("저장되었습니다.");
							location.reload();
						} else {
							alert("저장에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			} else {
				$.ajax({
					type : "post",
					url : "/admin/loseAdmin/"+id,
					async : false,
					success : function(txt){
						if(txt){
							alert("저장되었습니다.");
							location.reload();
						} else {
							alert("저장에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
		// 메인관리자 권한 체크해제
		function change(){
			$("#giveAdmin").prop("checked", true);
			alert("메인관리자의 권한은 제거할 수 없습니다.");
		}
		// tab2 게시판 선택
		$("#nowBoard").change(function(){
			var board = $("#nowBoard").val();
			if(board!="choose"){
				$.ajax({
					type : "post",
					url : "/admin/board/"+board,
					async : false,
					success : function(txt){
						$("#boardList").html(txt);
					}
				});
			} else {
				var html = "<div class='name_wrap'><div class='name'>게시판을 선택해주세요.</div></div>";
				$("#boardList").html(html);
				$("#tab2Title").val("");
				$("#tab2Writer").val("");
				$("#tab2Content").val("");
			}
		});
		// tab2 게시판 글 선택
		function boardDetail(title){
			var board = $("#nowBoard").val();
			$.ajax({
				type : "post",
				url : "/admin/boardDetail/"+board+"/"+title,
				async : false,
				success : function(txt){
					$("#tab2Title").val(txt[0].TITLE);
					$("#tab2Writer").val(txt[0].WRITER);
					$("#tab2Content").val(txt[0].CONTENT);
				}
			});
		}
		// tab2 게시판 글 삭제
		function boardDelete(){
			var nowBoard = $("#nowBoard").val();
			var title = $("#tab2Title").val();
			var writer = $("#tab2Writer").val();
			var content = $("#tab2Content").val();
			if(nowBoard=="choose"){
				alert("게시판을 선택해주세요.");
			} else if(title.length==0){
				alert("글을 선택해주세요.");
			} else {
				$.ajax({
					type : "post",
					url : "/admin/boardDelete/"+nowBoard+"/"+title+"/"+writer+"/"+content,
					async : false,
					success : function(txt){
						if(txt){
							alert("삭제되었습니다.");
							location.reload();
						} else {
							alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
						}
					}
				});
			}
		}
		// tab3 회원 클릭
		var num = 0;
		function take(element){
			var html = "<div class='name_wrap' id='give"+num+"'>";
			html += "<div class='dot'></div>&nbsp;";
			html += "<div class='name'>"+element.innerHTML+"</div>&nbsp;";
			html += "<div class='X_mark' onclick='remov("+num+")'>X</div></div>";
			if($("#takeList").html().indexOf(element.innerHTML)>0){
				alert("이미 수신목록에 있습니다.");
			} else {
				$("#takeList").append(html);
				num ++;
				$("#giveCount").html(num+" / 100");
			}
		}
		// tab3 회원 제거
		function remov(num2){
			$("#give"+num2).remove();
			var count = $("#giveCount").html();
			count = count.substring(0, count.indexOf('/')-1);
			count --;
			num --;
			$("#giveCount").html(count+" / 100");
		}
		// tab3 문자내용 입력
     	$("#message").keyup(function(txt){
     		var strValue = $("#message").val();
	        var strLen = strValue.length;
	        var totalByte = 0;
	        var len = 0;
	        var oneChar = "";
	        var str2 = "";
	 
	        for (var i = 0; i < strLen; i++) {
	            var oneChar = strValue.charAt(i);
	            if (escape(oneChar).length > 4) {
	                totalByte += 2;
	            } else {
	                totalByte++;
	            }
	 
	            // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	            if (totalByte <= 200) {
	                len = i + 1;
	            }
	        }
	 
	        // 넘어가는 글자는 자른다.
	        if (totalByte > 200) {
	            str2 = strValue.substr(0, len);
	            totalByte = 200;
	            $("#message").val(str2);
	        }
	        
     		$("#words").html(totalByte+" / 200");
     		if(totalByte>=132){
     			$("#message").prop("rows", "2");
     		} else if(totalByte<132){
     			$("#message").prop("rows", "1");
     		}
     	});
	</script>
	
</html>