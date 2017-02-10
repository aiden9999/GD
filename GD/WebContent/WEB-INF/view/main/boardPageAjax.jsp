<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="inner" style="width: 420px">
	<div class="arrow_wrap">
		<div class="arrow prev" onclick="boardPrev(this)" id="boardPrev${start }" style="display: none">
			<img src="/img/sub02_arrow_prev.png">
		</div>
		<div class="arrow next" onclick="boardNext(this)" id="boardNext${start }" style="display: none">
			<img src="/img/sub02_arrow_next.png">
		</div>
	</div>
	<div class="num_wrap" align="center" style="font-size: 0; width: 350px">
		<c:forEach var="i" begin="${start }" end="${end }">
			<c:choose>
				<c:when test="${i==selectPage }">
					<div class="num sel" onclick="boardPage(${i})" id="boardPage${i }" style="width: 33px">
						<span>${i }</span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="num" onclick="boardPage(${i})" id="boardPage${i }" style="width: 33px">
						<span>${i }</span>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</div>

<script>
	//페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==1 && end<10){
			$("#boardPrev"+start).hide();
			$("#boardNext"+start).hide();
		} else {
			if(start==1){
	  			$("#boardPrev"+start).hide();
	  			$("#boardNext"+start).show();
	  		} else if(end>=${listPage }){
	  			$("#boardPrev"+start).show();
	  			$("#boardNext"+start).hide();
	  		}
		}
	});
</script>