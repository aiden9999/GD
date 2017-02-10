<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="aca_header">
	<div class="circle"></div>
	<div class="txt">학원</div>
</div>
<div class="txt_wrap">
	<c:forEach var="t" items="${academy }">
		<div class="txt" onclick="academy('${t.NUM }')">
			<span>${t.NAME }</span>(${t.SITE })
		</div>
	</c:forEach>
</div>
<div class="page_wrap">
	<div class="inner">
		<div class="arrow_wrap">
			<div class="arrow prev" onclick="acaPrev(this)" id="acaPrev${start }">
				<img src="/img/sub02_arrow_prev.png">
			</div>
			<div class="arrow next" onclick="acaNext(this)" id="acaNext${start }">
				<img src="/img/sub02_arrow_next.png">
			</div>
		</div>
		<div class="num_wrap" id="acaPages" align="center" style="font-size: 0">
			<c:forEach var="i" begin="${start }" end="${end }">
				<c:choose>
					<c:when test="${i==selectPage }">
						<div class="num sel" onclick="acaPage(${i})" id="acaPages${i }" style="width: 33px">
							<span>${i }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="num" onclick="acaPage(${i})" id="acaPages${i }" style="width: 33px">
							<span>${i }</span>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	//페이지 표시
	$(document).ready(function(){
		var start = ${start };
		var end = ${end };
		if(start==1 && end<10){
			$("#acaPrev"+start).hide();
			$("#acaNext"+start).hide();
		} else {
			if(start==1){
	  			$("#acaPrev"+start).hide();
	  			$("#acaNext"+start).show();
	  		} else if(end>=${acaPage }){
	  			$("#acaPrev"+start).show();
	  			$("#acaNext"+start).hide();
	  		}
		}
	});
</script>