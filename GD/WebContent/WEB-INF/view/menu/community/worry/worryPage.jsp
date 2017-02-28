<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="worry_tit">
	고민상담 <span class="txt">강남에서 대학가기</span> <span class="txt1">고민상담
		입니다.</span>
</div>
<div class="worry_txtarea">
	<div class="inner">
		<c:choose>
			<c:when test="${login!=null }">
				<textarea placeholder="(고민상담 글쓰기)" style="resize: none" id="worry"></textarea>
				<div class="btn" onclick="submit()">등록</div>
			</c:when>
			<c:otherwise>
				<textarea placeholder="(로그인 후 이용할 수 있습니다.)" style="resize: none"
					readonly="readonly"></textarea>
				<div class="btn">등록</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<c:choose>
	<c:when test="${worryList.size()>0 }">
		<c:forEach var="i" begin="0" end="${worryList.size()-1 }">
			<div class="worry_txt_wrap">
				<c:choose>
					<c:when test="${worryList.get(i).CONTENT.length()>40 }">
						<div class="content">
							<label onclick="select(${i })" style="cursor: pointer;"> <font
								style="color: #88b04b; font-size: 15px; font-weight: bold;">
									${worryList.get(i).CONTENT.substring(0, 40) } ...... </font></label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="content">
							<label onclick="select(${i })" style="cursor: pointer;"> <font
								style="color: #88b04b; font-size: 15px; font-weight: bold;">
									${worryList.get(i).CONTENT } </font></label>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="name">${worryList.get(i).NAME }
					(${worryList.get(i).WRITER })</div>
				<div class="date">
					<span class="txt1">${worryList.get(i).DAY } |</span> <span
						class="txt3" style="cursor: default;"><font
						style="color: black; font-size: 13px; font-weight: normal">댓글
							(${worryList.get(i).REPLY })</font></span>
					<div id="dropdown${i }" class="contents">
						<div class="img">
							<img src="/img/sub02_arrow_up.png" onclick="clo(${i })">
						</div>
						<div class="txt_section">${worryList.get(i).CONTENT }</div>
						<div class="reply_section">
							<div class="reply_input">
								<c:choose>
                               		<c:when test="${login!=null }">
	                                    <input type="text" id="reply${worryList.get(i).AUTO }" name="reply">
	                                    <div class="btn" onclick="replySubmit(${worryList.get(i).AUTO })">등록</div>
                               		</c:when>
                               		<c:otherwise>
	                                    <input type="text" id="reply${worryList.get(i).AUTO }" name="reply"
	                                    		placeholder="(로그인 후 이용할 수 있습니다.)" readonly="readonly">
	                                    <div class="btn">등록</div>
                               		</c:otherwise>
                               	</c:choose>
							</div>
							<c:if test="${replyList.size()>0 }">
								<c:forEach var="j" begin="0" end="${replyList.size()-1 }">
									<c:if test="${worryList.get(i).AUTO == replyList.get(j).NUM }">
										<div class="reply_old">
											<div class="header">
												<div class="header_name">${replyList.get(j).NAME }
													(${replyList.get(j).ID })</div>
												<div class="header_date">${replyList.get(j).DAY }</div>
											</div>
											<div class="reply_content">${replyList.get(j).REPLY }</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="page_wrap">
			<div class="inner">
                <div class="arrow_wrap">
                    <div class="arrow prev" onclick="prev(this)" id="prev${start }" style="display: none">
                        <img src="/img/sub02_arrow_prev.png">
                    </div>
                    <div class="arrow next" onclick="next(this)" id="next${start }" style="display: none">
                        <img src="/img/sub02_arrow_next.png">
                    </div>
                </div>
                <div class="num_wrap" id="pages" align="center" style="font-size: 0">
                    <c:forEach var="i" begin="${start }" end="${end }">
                   		<c:choose>
                    		<c:when test="${i==selectPage }">
                          <div class="num sel" onclick="page(${i })" id="page${i }" style="width: 33px"><span>${i }</span></div>
                    		</c:when>
                    		<c:otherwise>
                          <div class="num" onclick="page(${i })" id="page${i }" style="width: 33px"><span>${i }</span></div>
                    		</c:otherwise>
                   		</c:choose>
                   	</c:forEach>
                </div>
            </div>
		</div>
		<div class="search_wrap">
			<div class="name_search">
				<select id="replySearch">
					<option value="writer">작성자</option>
					<option value="reply">내용</option>
				</select>
				<div class="input">
					<input type="text" id="search">
				</div>
				<div class="btn">
					<img src="/img/search1.png" onclick="searchWorry()">
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div align="center" style="margin-bottom: 30px">
			<label>검색된 고민이 없습니다.</label><br/><br/>
			<div class="btn" style="cursor: pointer; color: #88b04b" onclick="location.href='/worry'">이전으로</div>
		</div>
	</c:otherwise>
</c:choose>

<script>
	//페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==end && end>10){
			$("#prev"+start).show();
			$("#next"+start).hide();
		} else {
			if(start==1 && end<=10){
				$("#prev"+start).hide();
				$("#next"+start).hide();
			} else {
				if(start==1){
		  			$("#prev"+start).hide();
		  			$("#next"+start).show();
		  		} else if(end>=${worryPage }){
		  			$("#prev"+start).show();
		  			$("#next"+start).hide();
		  		}
			}
		}
	});
	//글 검색창에서 엔터
	$("#search").keyup(function(txt){
		if($("#search").val()!=""){
	 		if(txt.keyCode==13){
	 			searchWorry();
	 		}
		}
	});
	// 검색 페이지 처리
	function searchPage(num){
		$.ajax({
			type : "post",
			url : "/worry/search/${search }/${word }/"+num,
			async : false,
			success : function(txt){
				$("#worryList").html(txt);
			}
		});
	}
</script>