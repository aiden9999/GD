<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="worry_tit">
	수다방 <span class="txt">강남에서 대학가기</span> <span class="txt1">자유수다방
		입니다.</span>
</div>
<div class="worry_txtarea">
	<div class="inner">
		<c:choose>
			<c:when test="${login!=null }">
				<textarea placeholder="(수다방 글쓰기)" style="resize: none" id="waggle"></textarea>
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
	<c:when test="${waggleList.size()>0 }">
		<c:forEach var="i" begin="0" end="${waggleList.size()-1 }">
			<div class="worry_txt_wrap">
				<c:choose>
					<c:when test="${waggleList.get(i).CONTENT.length()>40 }">
						<div class="content">
							<label onclick="select(${i })" style="cursor: pointer;">
								<font
								style="color: #88b04b; font-size: 15px; font-weight: bold;">
									${waggleList.get(i).CONTENT.substring(0, 40) } ...... </font>
							</label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="content">
							<label onclick="select(${i })" style="cursor: pointer;">
								<font
								style="color: #88b04b; font-size: 15px; font-weight: bold;">
									${waggleList.get(i).CONTENT } </font>
							</label>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="name">${waggleList.get(i).NAME }
					(${waggleList.get(i).WRITER })</div>
				<div class="date">
					<span class="txt1">${waggleList.get(i).DAY } |</span> <span
						class="txt3" style="cursor: default;"><font
						style="color: black; font-size: 13px; font-weight: normal">댓글
							(${waggleList.get(i).REPLY })</font></span>
					<div id="dropdown${i }" class="contents">
						<div class="img">
							<img src="/img/sub02_arrow_up.png" onclick="clo(${i })">
						</div>
						<div class="txt_section">${waggleList.get(i).CONTENT }</div>
						<div class="reply_section">
							<div class="reply_input">
								<c:choose>
                               		<c:when test="${login!=null }">
	                                    <input type="text" id="reply${waggleList.get(i).AUTO }" name="reply">
	                                    <div class="btn" onclick="replySubmit(${waggleList.get(i).AUTO })">등록</div>
                               		</c:when>
                               		<c:otherwise>
	                                    <input type="text" id="reply${waggleList.get(i).AUTO }" name="reply"
	                                    		readonly="readonly" placeholder="(로그인 후 이용할 수 있습니다.)">
	                                    <div class="btn">등록</div>
                               		</c:otherwise>
                               	</c:choose>
							</div>
							<c:if test="${replyList.size()>0 }">
								<c:forEach var="j" begin="0" end="${replyList.size()-1 }">
									<c:if test="${waggleList.get(i).AUTO == replyList.get(j).NUM }">
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
					<div class="arrow prev">
						<img src="/img/sub02_arrow_prev.png" onclick="prev()">
					</div>
					<div class="arrow next">
						<img src="/img/sub02_arrow_next.png" onclick="next()">
					</div>
				</div>
				<div class="num_wrap">
					<c:forEach var="i" begin="1" end="${wagglePage }">
						<c:choose>
							<c:when test="${i==1 }">
								<div class="num sel" onclick="searchPage(${i })" id="searchPage${i }">
									<span>${i }</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="num" onclick="searchPage(${i })" id="searchPage${i }">
									<span>${i }</span>
								</div>
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
					<img src="/img/search1.png" onclick="searchwaggle()">
				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div align="center" style="margin-bottom: 30px">
			<label>검색된 수다가 없습니다.</label><br/><br/>
			<div class="btn" style="cursor: pointer; color: #88b04b" onclick="location.href='/waggle'">이전으로</div>
		</div>
	</c:otherwise>
</c:choose>

<script>
	//글 검색창에서 엔터
	$("#search").keyup(function(txt) {
		if ($("#search").val() != "") {
			if (txt.keyCode == 13) {
				searchwaggle();
			}
		}
	});
	// 검색 페이지 처리
	function searchPage(num) {
		$.ajax({
			type : "post",
			url : "/waggle/search/${search }/${word }/" + num,
			async : false,
			success : function(txt) {
				$("#waggleList").html(txt);
			}
		});
	}
</script>