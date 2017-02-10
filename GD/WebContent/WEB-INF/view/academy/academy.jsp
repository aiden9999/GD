<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="/css/swiper.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel='stylesheet' type='text/css'>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<meta name="robots" content="follow">
<meta name="description"
	content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
<meta name="keywords" content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
<meta property="og:type" content="website">
<meta property="og:title" content="강남대치학원 멘토클리닉">
<meta property="og:description"
	content="대치동 내신 수시전문학원 국영수과사 과목별 학습비법 암기비법 중등 고등">
<meta property="og:image" content="http://www.mysite.com/myimage.jpg">
<meta property="og:url" content="http://mentorschool.co.kr">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=i9nljBxxeJZYnyH27RC1"></script>
<title></title>

<style>
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">
            var currentImage;
            var currentIndex = -1;
            var interval;
            function showImage(index){
                if(index < $('.bigPic_img').length){
                    var indexImage = $('.bigPic_img')[index]
                    if(currentImage){   
                        if(currentImage != indexImage ){
                            $(currentImage).css('z-index',2);
                            clearTimeout(myTimer);
                            $(currentImage).fadeOut(250, function() {
                                myTimer = setTimeout("showNext()", 2000000);
                                $(this).css({'display':'none','z-index':1})
                            });
                        }
                    }
                    $(indexImage).css({'display':'block', 'opacity':1});
                    currentImage = indexImage;
                    currentIndex = index;
                    $('#thumbs li').removeClass('active');
                    $($('#thumbs li')[index]).addClass('active');
                }
            }

            function showNext(){
                var len = $('.bigPic_img').length;
                var next = currentIndex < (len-1) ? currentIndex + 1 : 0;
                showImage(next);
            }

            var myTimer;

            $(document).ready(function() {
                myTimer = setTimeout("showNext()", 2000000);
                showNext(); //loads first image
                $('#thumbs li').bind('click',function(e){
                    var count = $(this).attr('rel');
                    showImage(parseInt(count)-1);
                });
            });
        </script>
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
                        <li onclick="location.href='/el'" class="gnb_menu">
                            <div class="txt">초등학원</div>
                        </li>
						<li onclick="location.href='/mi'" class="gnb_menu">
                            <div class="txt">중등학원</div>
                        </li>
                        <li onclick="location.href='/hi'" class="gnb_menu">
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
	<div class="main01-01">
		<div class="inner">
			<div class="aca_name">${list.NAME }</div>
			<section class="intro_section">
				<div class="intro_wrap">
					<div class="address_wrap">
						<div class="tit">주소</div>
						<div class="txt">
							${list.ADDR1 }<br>
							<span>지번</span>${list.ADDR2 }
						</div>
					</div>
					<div class="number_wrap">
						<div class="tit">전화번호</div>
						<div class="txt">${list.TEL }</div>
					</div>
					<div class="category_wrap">
						<div class="tit">분류</div>
						<div class="txt">${list.TYPE1 } > ${list.TYPE2 }</div>
					</div>
					<div class="homepage_wrap">
						<div class="tit">홈페이지</div>
						<a href="http://${list.SITE }" target="_blank">
							<div class="txt">${list.SITE }</div>
						</a>
					</div>
				</div>
				<div class="logo_box">
					<div class="img" style="background-image: url('/logo/${list.LOGO }'); width: 100%; height: 100%; background-size: 100%">
					</div>
				</div>
			</section>
			<section class="info_section">
				<div class="gnb_wrap">
					<ul>
						<li class="gnb sel" onclick="tab(this)" id="1">
							<div class="txt">상세 정보</div>
						</li>
						<li class="gnb" onclick="tab(this)" id="2">
							<div class="txt">학원 소식</div>
						</li>
						<li class="gnb" onclick="tab(this)" id="3">
							<div class="txt">학원 리뷰</div>
						</li>
						<li class="gnb" onclick="tab(this)" id="4">
							<div class="txt">한줄 평가</div>
						</li>
					</ul>
				</div>
				<div id="tab1" class="tab">
					<div class="txt_info">
						${list.INFO }
					</div>
					<div class="pic_info">
						<div class="tit_wrap">
							<div class="tit">사진정보</div>
							<div class="line"></div>
						</div>
						<div class="thums_box">
							<div class="bigpic_img">
								<img src="/pic/${list.PIC1 }" id="big" style="width: 795px; height: 510px">
							</div>
							<ul id="thumbs" class="thumbs_slider">
								<div class="thumbs_inner">
									<li class="item_slide active" rel="1" onclick="change(1)">
										<img src="/pic/${list.PIC1 }" id="pic1"/>
									</li>
									<c:if test="${list.PIC2!=null }">
										<li class="item_slide" rel="2" onclick="change(2)">
											<img src="/pic/${list.PIC2 }" id="pic2"/>
										</li>
									</c:if>
									<c:if test="${list.PIC3!=null }">
										<li class="item_slide" rel="3" onclick="change(3)">
											<img src="/pic/${list.PIC3 }" id="pic3"/>
										</li>
									</c:if>
									<c:if test="${list.PIC4!=null }">
										<li class="item_slide" rel="4" onclick="change(4)">
											<img src="/pic/${list.PIC4 }" id="pic4"/>
										</li>
									</c:if>
									<c:if test="${list.PIC5!=null }">
										<li class="item_slide" rel="5" onclick="change(5)">
											<img src="/pic/${list.PIC5 }" id="pic5"/>
										</li>
									</c:if>
								</div>
							</ul>
							<div class="arrow_wrap">
								<div class="arrow up th_arrow_up" style="display: none" id="arrow_up">
									<img src="/img/arrow_up.png" onclick="move('up')">
								</div>
								<c:if test="${list.PIC1!=null && list.PIC2!=null && list.PIC3!=null && list.PIC4!=null }">
									<div class="arrow down th_arrow_down" id="arrow_down">
										<img src="/img/arrow_down.png" onclick="move('down')">
									</div>
								</c:if>
							</div>
						</div>
						<div class="tit_wrap road_wrap">
							<div class="tit">찾아가는길</div>
							<div class="line"></div>
						</div>
						<div class="map">
							<div class="naver_map" id="map"></div>

							<script type="text/javascript">
	                            var HOME_PATH = window.HOME_PATH || '.';
	                            var cityhall = new naver.maps.LatLng(37.497936, 127.0590851),
	                                map = new naver.maps.Map('map', {
	                                    center: cityhall,
	                                    zoom: 10
	                                }),
	                                marker = new naver.maps.Marker({
	                                    map: map,
	                                    position: cityhall
	                                });
	
	                            var contentString = [
	                                    '<div class="iw_inner">',
	                                    '<img src="'+ HOME_PATH +'/img/map_logo.png" width="200" height="28" alt="멘토클리닉" class="thumb" /><br />',
	                                    '</div>'
	                                ].join('');
	
	                            var infowindow = new naver.maps.InfoWindow({
	                                content: contentString,
	                                maxWidth: 200,
	                                backgroundColor: "#eee",
	                                borderColor: "#2db400",
	                                borderWidth: 2,
	                                anchorSize: new naver.maps.Size(30, 30),
	                                anchorSkew: true,
	                                anchorColor: "#eee",
	                                pixelOffset: new naver.maps.Point(70, 60)
	                            });
	
	                            naver.maps.Event.addListener(marker, "click", function(e) {
	                                if (infowindow.getMap()) {
	                                    infowindow.close();
	                                } else {
	                                    infowindow.open(map, marker);
	                                }
	                            });
	
	                            </script>
						</div>
						<div class="traffic_wrap">
							<div class="subway_wrap">
								<div class="tit">주변 지하철역</div>
								<div class="txt_wrap">
									<div class="circle_wrap">
										<div class="circle">2</div>
										<div class="txt">2호선 (선릉역)</div>
									</div>
									<div class="circle_wrap">
										<div class="circle">3</div>
										<div class="txt">3호선 (대치역)</div>
									</div>
									<div class="circle_wrap">
										<div class="circle">분당</div>
										<div class="txt">분당선 (한티역)</div>
									</div>
								</div>
							</div>
							<div class="bus_wrap">
								<div class="tit">주변 버스정류장</div>
								<div class="txt">대치삼성아파트입구(23-223)</div>
							</div>
						</div>
					</div>
				</div>
				<div id="tab2" style="display: none" class="tab">
					<c:choose>
						<c:when test="${news!=null}">
							<div class="board_wrap">
								<div class="txt_box">
									<div class="tit txt_number">
										<span>번호</span>
									</div>
									<div class="tit txt_tit">
										<span>제목</span>
									</div>
									<div class="tit txt_name">
										<span>작성자</span>
									</div>
									<div class="tit txt_date">
										<span>작성일</span>
									</div>
								</div>
								<c:choose>
									<c:when test="${news.size()>0 }">
										<c:forEach var="i" begin="0" end="${news.size()-1 }">
											<div class="txt_box">
												<div class="txt txt_number">
													<c:choose>
														<c:when test="${news.get(i).AUTO<10}">
															<span>0${news.get(i).AUTO }</span>
														</c:when>
														<c:otherwise>
															<span>${news.get(i).AUTO }</span>
														</c:otherwise>
													</c:choose>
												</div>
												<c:choose>
													<c:when test="${login!=null }">
														<div onclick="select(${news.get(i).AUTO })" class="txt txt_tit">
															<span>${news.get(i).TITLE }</span>
														</div>
													</c:when>
													<c:otherwise>
														<div class="txt txt_tit">
															<span>${news.get(i).TITLE }</span>
														</div>
													</c:otherwise>
												</c:choose>
												<div id="dropdown${i }" class="contents">
													<div class="img">
														<img src="/img/sub02_arrow_up.png" onclick="clo(${news.get(i).AUTO })">
													</div>
													<div class="drop_txt">
														${news.get(i).CONTENT }
													</div>
												</div>
												<div class="txt txt_name">
													<span>${news.get(i).WRITER }</span>
												</div>
												<div class="txt txt_date">
													<span>${news.get(i).DAY }</span>
												</div>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="txt_box" align="center">
											<div style="margin-top: 20px; margin-bottom: 20px"><label>등록된 글이 없습니다.</label></div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="write_wrap">
								<div class="empty_box"></div>
								<c:if test="${login!=null }">
									<div class="write_btn">
										<div class="txt" onclick="wr()">글쓰기</div>
									</div>
								</c:if>
							</div>
							<div class="page_wrap">
								<div class="inner">
									<div class="arrow_wrap">
										<div class="arrow prev" onclick="newsPrev(this)" id="newsPrev1" style="display: none">
											<img src="/img/sub02_arrow_prev.png" onclick="newsPrev(this)"
												id="prev1">
										</div>
										<div class="arrow next" onclick="newsNext(this)" id="newsNext1">
											<img src="/img/sub02_arrow_next.png" onclick="newsNext(this)"
												id="next1">
										</div>
									</div>
									<div class="num_wrap" id="newsPages" align="center" style="font-size: 0">
										<c:forEach var="i" begin="1" end="${newsPage>10 ? 10 : newsPage }">
											<c:choose>
												<c:when test="${i==1 }">
													<div class="num sel" onclick="newsPage(${i })" id="newsPage${i }" style="width: 33px">
														<span>${i }</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="num" onclick="newsPage(${i })" id="newsPage${i }" style="width: 33px">
														<span>${i }</span>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div align="center" style="margin-top: 20px; margin-bottom: 20px">
								<label>등록된 글이 없습니다.</label>
								<div class="write_wrap">
								<div class="empty_box"></div>
								<div class="write_btn">
									<div class="txt" onclick="wr()">글쓰기</div>
								</div>
							</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div id="tab3" style="display: none" class="tab">
					 <c:choose>
						<c:when test="${review.size()!=0 && rePoint!=null && all!=null && again!=null && reviewTop!=null}">
							<div class="grade_wrap" id="gradeDiv">
								<div class="star_grade">
									<div class="txt">
										강남대치학원 멘토클리닉의 전체과목 평점<br>
										<span>${rePoint } / 5.0</span>
									</div>
									<div class="star_wrap1">
										<c:choose>
											<c:when test="${rePoint>4.9 }">
												<c:forEach var="i" begin="1" end="5">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${rePoint>=4 }">
												<c:forEach var="i" begin="1" end="4">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
												<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
											</c:when>
											<c:when test="${rePoint>=3 }">
												<c:forEach var="i" begin="1" end="3">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
												<c:forEach var="i" begin="1" end="2">
													<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${rePoint>=1 }">
												<c:forEach var="i" begin="1" end="2">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
												<c:forEach var="i" begin="1" end="3">
													<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${rePoint>=0 }">
												<div class="star">
													<img src="/img/main01_03_star.png">
												</div>
												<c:forEach var="i" begin="1" end="4">
													<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
												</c:forEach>
											</c:when>
										</c:choose>
									</div>
								</div>
								<div class="bar_grade">
									<div class="bar_wrap">
										<div class="txt">${again }%</div>
										<div class="bar" id="bar" style="width: ${again }%"></div>
									</div>
									<div class="txt">
										<span>${all }</span> 명의 학생중 <span>${again }%</span> 가<br> 강남대치학원 멘토클리닉을
										다시 다니고 싶어합니다.
									</div>
								</div>
							</div>
							<div class="board_wrap" id="boardDiv">
								<div class="txt_box">
									<div class="tit txt_number">
										<span>번호</span>
									</div>
									<div class="tit txt_tit">
										<span>기간 / 과목 / 평점</span>
									</div>
									<div class="tit txt_rec">
										<span>추천</span>
										<div class="love">
											<img src="/img/main01_03_love.png">
										</div>
									</div>
								</div>
								<c:forEach var="i" begin="0" end="${reviewTop.size()-1 }">
									<div class="txt_box best">
										<div class="txt txt_number">
											<div class="best_txt">BEST</div>
											<img src="/img/sub03_new_box.png">
										</div>
										<c:choose>
											<c:when test="${login!=null }">
												<div class="txt txt_tit" onclick="reviewDetail('${reviewTop.get(i).AUTO}')">
													<span>${reviewTop.get(i).DAY } / ${reviewTop.get(i).SUBJECT } / ${reviewTop.get(i).POINT }</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="txt txt_tit">
													<span>${reviewTop.get(i).DAY } / ${reviewTop.get(i).SUBJECT } / ${reviewTop.get(i).POINT }</span>
												</div>
											</c:otherwise>
										</c:choose>
										<div class="txt txt_rec">
											<span>${reviewTop.get(i).RECOMEND }</span>
											<div class="love">
												<img src="/img/main01_03_love.png">
											</div>
										</div>
									</div>
								</c:forEach>
								<c:forEach var="i" begin="0" end="${review.size()-1 }">
									<div class="txt_box">
										<div class="txt txt_number">
											<div class="best_txt">${reviewCount-i }</div>
										</div>
										<c:choose>
											<c:when test="${login!=null }">
												<div class="txt txt_tit" onclick="reviewDetail('${review.get(i).AUTO}')">
													<span>${review.get(i).DAY } / ${review.get(i).SUBJECT } / ${review.get(i).POINT }</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="txt txt_tit">
													<span>${review.get(i).DAY } / ${review.get(i).SUBJECT } / ${review.get(i).POINT }</span>
												</div>
											</c:otherwise>
										</c:choose>
										<div class="txt txt_rec">
											<span>${review.get(i).RECOMEND }</span>
											<div class="love">
												<img src="/img/main01_03_love.png">
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="write_wrap" id="writeDiv">
								<div class="empty_box"></div>
								<c:if test="${login!=null }">
									<div class="write_btn" onclick="review(${list.NUM})">
										<div class="txt">리뷰쓰기</div>
									</div>
								</c:if>
							</div>
							<div class="page_wrap" id="pageDiv">
								<div class="inner">
									<div class="arrow_wrap">
										<div class="arrow prev" onclick="reviewPrev(this)" id="reviewPrev1" style="display: none">
											<img src="/img/sub02_arrow_prev.png">
										</div>
										<div class="arrow next" onclick="reviewNext(this)" id="reviewNext1">
											<img src="/img/sub02_arrow_next.png">
										</div>
									</div>
									<div class="num_wrap" id="reviewPages" align="center" style="font-size: 0">
										<c:forEach var="i" begin="1" end="${reviewPage>10 ? 10 : reviewPage }">
											<c:choose>
												<c:when test="${i==1 }">
													<div class="num sel" onclick="reviewPage(${i })" id="reviewPage${i }" style="width: 33px">
														<span>${i }</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="num" onclick="reviewPage(${i })" id="reviewPage${i }" style="width: 33px">
														<span>${i }</span>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div align="center" style="margin-top: 20px; margin-bottom: 20px" id="noReview">
								<label>등록된 리뷰가 없습니다.</label>
								<div class="write_wrap" id="writeDiv">
								<div class="empty_box"></div>
								<c:if test="${login!=null }">
									<div class="write_btn" onclick="review(${list.NUM})">
										<div class="txt">리뷰쓰기</div>
									</div>
								</c:if>
							</div>
							</div>
						</c:otherwise>
					 </c:choose>
					 <div class="review_wrap1" id="reviewDiv" style="display: none">
					    <div class="review_intro">
					        <div class="txt">
					            <span class="txt1">강남에서 대학가기</span>는 내아이의학원을 고를 때 <span class="txt1">‘이런 리뷰가있으면 좋겠다 ’</span> 라는마음가짐으로 리뷰를 수집합니다.<br>
					            작성하신리뷰는 <span class="txt1">익명</span>으로 저장되며 작성자의 개인정보는 어디에도 노출되지 않습니다.<br><br>
					        </div>
					        <div class="txt2">
					            1. 구체적 이지 못한 리뷰의 경우<span class="txt3"> 추가 작성</span>이 요청될 수있습니다.<br>
					            2. 리뷰작성 시 <span class="txt3">객관전인 사실과 실제 경험</span>을 바탕으로 작성해주세요.<br>
					            3. 비방, 욕설, 허위 사실이포함된 리뷰는등록되지않습니다.
					        </div>
					    </div>
					    <div class="academy_input">
					        <div class="inner">
					            <div class="aca_term academy_info">
					                <div class="tit">수강기간</div>
					                <input type="text" id="re_day" placeholder="ex. 6개월">
					            </div>
					            <div class="aca_subject academy_info">
					                <div class="tit">수강과목</div>
					                <input type="text" id="re_subject" placeholder="ex. 수학">
					            </div>
					            <div class="aca_subject1 academy_info">
					                <div class="tit">상세과목(선택사항)</div>
					                <input type="text" id="re_subject1" placeholder="ex. 미분과 적분">
					            </div>
					            <div class="aca_class academy_info">
					                <div class="tit">수업이름</div>
					                <input type="text" id="re_className" placeholder="ex. 대입 준비반">
					            </div>
					            <div class="aca_age academy_info">
					                <div class="tit">수강당시학년</div>
					                <input type="text" id="re_grade" placeholder="ex. 고등학교 3학년">
					            </div>
					            <div class="aca_teacher academy_info">
					                <div class="tit">선생님</div>
					                <input type="text" id="re_teacher" placeholder="ex. 홍길동">
					            </div>
					            <div class="aca_sort academy_info">
					                <div class="tit">문/이과(선택사항)</div>
					                <label><input type="radio" name="sort" value="liberal" id="type1"><span>문과</span></label>
					                <label><input type="radio" name="sort" value="science" id="type2"><span>이과</span></label>
					                <label><input type="radio" name="sort" value="art" id="type3"><span>예체능</span></label>
					            </div>
					        </div>
					    </div>
					</div>
					<div class="feeling_wrap" id="feelingDiv" style="display: none">
					    <div class="feeling_tit" style="width: 340px">
					        <div class="tit">학원 총 평점</div>
					        <div class="star_wrap" style="float: none">
					        	<c:forEach var="i" begin="1" end="5">
						            <div class="star" onclick="rePoint(${i })">
						                <img src="/img/main01_03_star1.png" id="star${i }">
						            </div>
					        	</c:forEach>
					        </div>
					        <div class="txt" style="position: absolute; right: 0; top: 10%" id="totalPoint">(0.0)
					        	<font style="color: red; font-weight: normal">*평점은 추후 수정불가</font>
					        </div>
					    </div>
					    <div class="feeling_txtarea">
					        <div class="ft_txtarea">
					            <div class="tit">수업방식 및 특징<br><span>(20 ~ 100자)</span></div>
					            <textarea id="rate1" style="resize: none"></textarea>
					        </div>
					        <div class="ft_txtarea">
					            <div class="tit">수강전 학생 상태<br><span>(20 ~ 100자)</span></div>
					            <textarea id="rate2" style="resize: none"></textarea>
					        </div>
					        <div class="ft_txtarea">
					            <div class="tit">좋은점<br><span>(20 ~ 100자)</span></div>
					            <textarea id="rate3" style="resize: none"></textarea>
					        </div>
					        <div class="ft_txtarea">
					            <div class="tit">아쉬운점<br><span>(20 ~ 100자)</span></div>
					            <textarea id="rate4" style="resize: none"></textarea>
					        </div>
					        <div class="ft_radio">
					            <div class="tit">예전으로 돌아가도 이 학원을 다니실건가요?</div>
					            <div class="input_wrap">
					                <label><input type="radio" name="again" value="yes" id="radioYes"><span>네</span></label>
					            </div>
					            <div class="input_wrap">
					                <label><input type="radio" name="again" value="no" id="radioNo"><span>다른곳을 알아본다</span></label>
					            </div>
					        </div>
					    </div>
					    <div class="cannext_wrap">
					        <div class="btn cancel" onclick="cancel()">취 소</div>
					        <div class="btn next" onclick="reSave()">저 장</div>
					    </div>
					</div>
					<div class="review_wrap" id="reviewDetail" style="display: none"></div>
				</div>
				<div id="tab4" style="display: none" class="tab">
					<c:choose>
						<c:when test="${comment.size()!=0 && totalPoint!=null}">
							<div class="test_wrap" id="replySection">
								<div class="test_tit">
									<div class="test">평가</div>
									<div class="star_wrap">
										<c:choose>
											<c:when test="${totalPoint>4.9 }">
												<c:forEach var="i" begin="1" end="5">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${totalPoint>=4 }">
												<c:forEach var="i" begin="1" end="4">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
												<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
											</c:when>
											<c:when test="${totalPoint>=3 }">
												<c:forEach var="i" begin="1" end="3">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
												<c:forEach var="i" begin="1" end="2">
													<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${totalPoint>=1 }">
												<c:forEach var="i" begin="1" end="2">
													<div class="star">
														<img src="/img/main01_03_star.png">
													</div>
												</c:forEach>
												<c:forEach var="i" begin="1" end="3">
													<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
												</c:forEach>
											</c:when>
											<c:when test="${totalPoint>=0 }">
												<div class="star">
													<img src="/img/main01_03_star.png">
												</div>
												<c:forEach var="i" begin="1" end="4">
													<div class="star">
														<img src="/img/main01_03_star1.png">
													</div>
												</c:forEach>
											</c:when>
										</c:choose>
									</div>
									<div class="point_wrap">
										<div class="txt">${totalPoint } / 5.0</div>
										<div class="txt1">${comment.size() }명</div>
									</div>
								</div>
								<div class="test_input">
									<div class="input_inner">
										<div id="select_box" class="select_box">
											<select id="ex_select">
												<option value="choose">평점선택</option>
												<option value="1">1점</option>
												<option value="2">2점</option>
												<option value="3">3점</option>
												<option value="4">4점</option>
												<option value="5">5점</option>
											</select>
										</div>
										<div class="text_wrap">
											<c:choose>
												<c:when test="${login!=null }">
													<div class="text_box">
														<!-- 	<input type="text" id="point_txt" placeholder="( 최소 10자이상, 최대 100까지 입력 가능합니다. )" maxlength="100"> -->
														<textarea rows="1" cols="134" id="point_txt"
															style="resize: none"
															placeholder="( 최소 10자이상, 최대 한글 100자/영어 200자 까지 입력 가능합니다. )"></textarea>
													</div>
													<div class="btn">
														<div class="regi" onclick="submit()">등록</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="text_box">
														<textarea rows="1" cols="134" id="point_txt"
															style="resize: none" placeholder="( 로그인 후 작성 가능합니다. )"
															readonly="readonly"></textarea>
													</div>
													<div class="btn">
														<div class="regi">등록</div>
													</div>
												</c:otherwise>
											</c:choose>
											<div class="txt" id="countTxt">0 / 200</div>
										</div>
									</div>
								</div>
							</div>
							<div class="reply_section">
								<c:forEach var="i" begin="0" end="${comment.size()-1 }">
									<div class="reply_wrap">
										<div class="star_wrap">
											<c:forEach var="j" begin="1" end="${comment.get(i).POINT }">
												<div class="star">
													<img src="/img/main01_04_star.png">
												</div>
											</c:forEach>
										</div>
										<div class="txt" id="replyTxt${i }">${comment.get(i).COMMENT }</div>
										<div class="id" id="replyId${i }">
											${comment.get(i).NAME }(${comment.get(i).ID })<span class="txt1" id="replyTime${i }">${comment.get(i).DAY }</span>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="page_wrap">
                        		<div class="inner">
									<div class="arrow_wrap">
		                                <div class="arrow prev" onclick="prev(this)" id="commentPrev1" style="display: none">
		                                    <img src="/img/sub02_arrow_prev.png">
		                                </div>
		                                <div class="arrow next" onclick="next(this)" id="commentNext1">
		                                    <img src="/img/sub02_arrow_next.png">
		                                </div>
		                            </div>
									<div class="num_wrap" id="commentPages" align="center" style="font-size: 0">
		                                <c:forEach var="i" begin="1" end="${commentPage>10 ? 10 : commentPage }">
		                            		<c:choose>
			                            		<c:when test="${i==1 }">
					                                <div class="num sel" onclick="commentPage(${i })" id="commentPage${i }" style="width: 33px"><span>${i }</span></div>
			                            		</c:when>
			                            		<c:otherwise>
					                                <div class="num" onclick="commentPage(${i })" id="commentPage${i }" style="width: 33px"><span>${i }</span></div>
			                            		</c:otherwise>
		                            		</c:choose>
		                            	</c:forEach>
		                            </div>
		                        </div>
		                    </div>
						</c:when>
						<c:otherwise>
							<div class="test_wrap">
								<div class="test_tit">
									<div class="test">평가</div>
									<div class="star_wrap">
										<c:forEach var="i" begin="1" end="5">
											<div class="star">
												<img src="/img/main01_03_star1.png">
											</div>
										</c:forEach>
									</div>
									<div class="point_wrap">
										<div class="txt">0.0 / 5.0</div>
										<div class="txt1">0명</div>
									</div>
								</div>
								<div class="test_input">
									<div class="input_inner">
										<div id="select_box" class="select_box">
											<select id="ex_select">
												<option value="choose">평점선택</option>
												<option value="1">1점</option>
												<option value="2">2점</option>
												<option value="3">3점</option>
												<option value="4">4점</option>
												<option value="5">5점</option>
											</select>
										</div>
										<div class="text_wrap">
											<c:choose>
												<c:when test="${login!=null }">
													<div class="text_box">
														<!-- 	<input type="text" id="point_txt" placeholder="( 최소 10자이상, 최대 100까지 입력 가능합니다. )" maxlength="100"> -->
														<textarea rows="1" cols="134" id="point_txt"
															style="resize: none"
															placeholder="( 최소 10자이상, 최대 한글 100자/영어 200자 까지 입력 가능합니다. )"></textarea>
													</div>
													<div class="btn">
														<div class="regi" onclick="submit()">등록</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="text_box">
														<textarea rows="1" cols="134" id="point_txt"
															style="resize: none" placeholder="( 로그인 후 작성 가능합니다. )"
															readonly="readonly"></textarea>
													</div>
													<div class="btn">
														<div class="regi">등록</div>
													</div>
												</c:otherwise>
											</c:choose>
											<div class="txt" id="countTxt">0 / 200</div>
										</div>
									</div>
								</div>
							</div>
							<div class="reply_section">
								<div align="center" style="margin-top: 20px; margin-bottom: 20px" id="noComment">
									<label>등록된 평가가 없습니다.</label>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</section>
		</div>
	</div>
	<footer>
		<div class="inner">
			<div class="logo" onclick="location.href='/'">
				<label><span>L</span>ogo</label>
			</div>
			<div class="txt">
				주소 : 서울 강남구 테헤란로 407 EK타워 4층 미래로입시컨설팅대표이사 : 이혁진 <br>상담시간 : 월 ~
				금 - 오전 10시 ~ 오후 9시 ( 점심시간 오전 11시 30분 ~ 오후 1시) 토 - 오전 10시 ~ 오후 5시 <br>Copyright(c)
				TS group. All Rights Reserved.
			</div>
		</div>
	</footer>
</body>

<script>
		// 조회수 증가
		$(document).ready(function(){
			$.ajax({
				type : "post",
				url : "/academy/countUp/"+${list.NUM },
				async : true
			});
		});
		// 한줄평가 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${commentPage } ? ${commentPage } : start+9;
			if(start==1 && end<10){
				$("#commentPrev"+start).hide();
				$("#commentNext"+start).hide();
			} else {
				if(start==1){
		  			$("#commentPrev"+start).hide();
		  			$("#commentNext"+start).show();
		  		} else if(end>=${commentPage }){
		  			$("#commentPrev"+start).show();
		  			$("#commentNext"+start).hide();
		  		}
			}
		});
		// 리뷰 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${reviewPage } ? ${reviewPage } : start+9;
			if(start==1 && end<10){
				$("#reviewPrev"+start).hide();
				$("#reviewNext"+start).hide();
			} else {
				if(start==1){
		  			$("#reviewPrev"+start).hide();
		  			$("#reviewNext"+start).show();
		  		} else if(end>=${reviewPage }){
		  			$("#reviewPrev"+start).show();
		  			$("#reviewNext"+start).hide();
		  		}
			}
		});
		 // 학원소식 페이지 표시
	    $(document).ready(function(){
			var start = 1;
			var end = start+9>=${newsPage } ? ${newsPage } : start+9;
			if(start==1 && end<10){
				$("#newsPrev"+start).hide();
				$("#newsNext"+start).hide();
			} else {
				if(start==1){
		  			$("#newsPrev"+start).hide();
		  			$("#newsNext"+start).show();
		  		} else if(end>=${newsPage }){
		  			$("#newsPrev"+start).show();
		  			$("#newsNext"+start).hide();
		  		}
			}
		});
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
    	// 학원정보 탭
    	function tab(element){
    		// 탭 변경
    		var id = element.id;
    		var ar = new Array("1", "2", "3", "4");
    		for(var i=0; i<ar.length; i++){
    			if(ar[i]==id){
    				$("#tab"+id).show();
    				$("#"+id).prop("class", "gnb sel");
    			} else {
    				$("#tab"+ar[i]).hide();
    				$("#"+ar[i]).prop("class", "gnb");
    			}
    		}
   			$("#gradeDiv").show();
       		$("#boardDiv").show();
       		$("#writeDiv").show();
       		$("#pageDiv").show();
       		$("#noReview").show();
       		$("#reviewDiv").hide();
       		$("#feelingDiv").hide();
       		$("#reviewDetail").hide();
    	}
    	// 사진 화살표 클릭
    	var tsn = 0;
    	function move(arrow){
    		if(arrow=="up"){
    			tsn--;
    			$("#arrow_up").hide();
    			$("#arrow_down").show();
    		} else {
    			tsn++;
    			$("#arrow_up").show();
    			$("#arrow_down").hide();
    		}
    		$(".thumbs_inner").stop().animate({
    			top : -461 * tsn
    		});
    	}
    	// 사진 변경
    	function change(num){
    		var src = $("#pic"+num).prop("src");
    		$("#big").prop("src", src);
    	}
    	// 글 선택
     	function select(num) { 
    		location.href="/academy/view/${list.NAME }/${list.NUM }/"+num;
        }
     	// 글 닫기
        function clo(num) {
            var x = document.getElementById("dropdown"+num);
            x.className = x.className.replace(" drop_show", "");
        }
     	// 학원소식 페이지 클릭
     	function newsPage(num){
     		$.ajax({
     			type : "post",
     			url : "/academy/newsPage/"+num+"/"+${list.NUM },
     			async : false,
     			success : function(txt){
     				$("#tab2").html(txt);
     			}
     		});
     	}
     	// 리뷰 페이지 클릭
     	function reviewPage(num){
     		$.ajax({
     			type : "post",
     			url : "/academy/reviewPage/"+num+"/${list.NUM }",
     			async : false,
     			success : function(txt){
     				$("#tab3").html(txt);
     			}
     		});
     	}
     	// 리뷰 이전 클릭
     	function reviewPrev(element){
     		var id = element.id;
      		id = id.substring(id.indexOf('prev')+4);
      		var start = Number(id)-10;
      		var end = start+9>=${reviewPage } ? ${reviewPage } : start+9;
    		$("#reviewNext"+id).show();
      		if(start==1){
      			$("#reviewPrev"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='reviewPage("+i+")' id='reviewPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='reviewPage("+i+")' id='reviewPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#reviewPrev"+id).prop("id", "reviewPrev"+start);
      		$("#reviewNext"+id).prop("id", "reviewNext"+start);
      		$("#reviewPages").html(html);
     	}
     	// 리뷰 다음 클릭
     	function reviewNext(element){
     		var id = element.id;
      		id = id.substring(id.indexOf('xt')+2);
      		var start = Number(id)+10;
      		var end = start+9>=${reviewPage } ? ${reviewPage } : start+9;
    		$("#reviewPrev"+id).show();
    		if(end>=${commentPage }){
      			$("#reviewNext"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='reviewPage("+i+")' id='reviewPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='reviewPage("+i+")' id='reviewPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#reviewPrev"+id).prop("id", "reviewPrev"+start);
      		$("#reviewNext"+id).prop("id", "reviewNext"+start);
      		$("#reviewPages").html(html);
     	}
    	// 한줄평가 페이지 클릭
   		function commentPage(num){
     		$.ajax({
     			type : "post",
     			url : "/academy/commentPage/"+num+"/${list.NUM }",
     			async : false,
     			success : function(txt){
     				$("#tab4").html(txt);
     			}
     		});
     	}
     	// 글쓰기
     	function wr(){
     		location.href="/academy/writeNews/${list.NUM }";
     	}
     	// 한줄평가 이전 클릭
     	function prev(element){
     		var id = element.id;
      		id = id.substring(id.indexOf('v')+1);
      		var start = Number(id)-10;
      		var end = start+9>=${commentPage } ? ${commentPage } : start+9;
    		$("#commentNext"+id).show();
      		if(start==1){
      			$("#commentPrev"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='commentPage("+i+")' id='commentPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='commentPage("+i+")' id='commentPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#commentPrev"+id).prop("id", "commentPrev"+start);
      		$("#commentNext"+id).prop("id", "commentNext"+start);
      		$("#commentPages").html(html);
     	}
     	// 한줄평가 다음 클릭
     	function next(element){
     		var id = element.id;
      		id = id.substring(id.indexOf('xt')+2);
      		var start = Number(id)+10;
      		var end = start+9>=${commentPage } ? ${commentPage } : start+9;
    		$("#commentPrev"+id).show();
    		if(end>=${commentPage }){
      			$("#commentNext"+id).hide();
      		}
      		var html = "";
      		for(var i=start; i<=end; i++){
      			if(i==start){
      				html += "<div class='num sel' onclick='commentPage("+i+")' id='commentPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			} else {
      				html += "<div class='num' onclick='commentPage("+i+")' id='commentPage"+i+"' style='width: 33px'><span>"+i+"</span></div>";
      			}
      		}
      		$("#commentPrev"+id).prop("id", "commentPrev"+start);
      		$("#commentNext"+id).prop("id", "commentNext"+start);
      		$("#commentPages").html(html);
     	}
     	// 한줄평가 등록
     	function submit(){
     		var comment = $("#point_txt").val();
     		var point = $("#ex_select").val();
     		var num = ${list.NUM };
     		if(comment.length==0){
     			alert("한줄평가를 입력해주세요.");
     		} else if(comment.length<10){
     			alert("10자이상 입력해주세요.");
     		} else if(point=="choose"){
     			alert("평점을 선택해주세요.");
     		} else {
     			$.ajax({
     				type : "post",
     				url : "/academy/comment/${login.ID }/${login.NAME }/"+point+"/"+num+"/"+comment,
     				async : false,
     				success : function(txt){
     					if(txt){
     						alert("등록완료");
     						location.reload();
     					} else {
     						alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
     					}
     				}
     			});
     		}
     	}
     	// 한줄평가 입력시 글자수 감소 및 입력창 증가/감소
     	$("#point_txt").keyup(function(txt){
     		var strValue = $("#point_txt").val();
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
	            $("#point_txt").val(str2);
	        }
	        
     		$("#countTxt").html(totalByte+" / 200");
     		if(totalByte>=132){
     			$("#point_txt").prop("rows", "2");
     		} else if(totalByte<132){
     			$("#point_txt").prop("rows", "1");
     		}
     	});
     	// 리뷰쓰기
     	function review(num){
     		$("#gradeDiv").hide();
     		$("#boardDiv").hide();
     		$("#writeDiv").hide();
     		$("#pageDiv").hide();
     		$("#reviewDiv").show();
     		$("#feelingDiv").show();
     		$("#noReview").hide();
     	}
     	// 리뷰 취소
     	function cancel(){
     		$("#radioYes").prop("checked", false);
     		$("#radioNo").prop("checked", false);
     		$("#type1").prop("checked", false);
     		$("#type2").prop("checked", false);
     		$("#type3").prop("checked", false);
     		$("#rate1").val("");
     		$("#rate2").val("");
     		$("#rate3").val("");
     		$("#rate4").val("");
     		$("#re_day").val("");
     		$("#re_subject").val("");
     		$("#re_subject1").val("");
     		$("#re_className").val("");
     		$("#re_grade").val("");
     		$("#re_teacher").val("");
     		
     		$("#gradeDiv").show();
     		$("#boardDiv").show();
     		$("#writeDiv").show();
     		$("#pageDiv").show();
     		$("#reviewDiv").hide();
     		$("#feelingDiv").hide();
     		$("#noReview").show();
     	}
     	// 리뷰 저장
     	function reSave(){
     		var num = ${list.NUM };
     		var day = $("#re_day").val();
     		var subject = $("#re_subject").val();
     		var subject1 = $("#re_subject1").val()!="" ? $("#re_subject1").val() : "null";
     		var className = $("#re_className").val();
     		var grade = $("#re_grade").val();
     		var teacher = $("#re_teacher").val();
     		var type = $("#type1").prop("checked") ? "문과" : $("#type2").prop("checked") ? "이과" : $("#type3").prop("checked") ? "예체능" : false;
     		var rate1 = $("#rate1").val();
     		var rate2 = $("#rate2").val();
     		var rate3 = $("#rate3").val();
     		var rate4 = $("#rate4").val();
     		var again = $("#radioYes").prop("checked") ? "y" : $("#radioNo").prop("checked") ? "n" : false;
     		var point = repoint;
     		var writer = "";
     		if(${login!=null}){
     			writer = "${login.ID}";
     		}
     		if(day=="" || subject=="" || className=="" || grade=="" || teacher=="" || !type || rate1=="" || rate2=="" || rate3=="" || rate4=="" ||
     				!again || point==0){
     			alert("입력하지 않은 항목이 있습니다.");
     		} else if(rate1.length<20 || rate2.length<20 || rate3.length<20 || rate4.length<20){
     			alert("평가항목은 20~100자로 작성해주세요.");
     		} else {
	     		$.ajax({
	     			type : "post",
	     			url : "/academy/review/"+num+"/"+day+"/"+subject+"/"+subject1+"/"+className+"/"+grade+"/"+teacher+"/"+type+"/"+
	     					rate1+"/"+rate2+"/"+rate3+"/"+rate4+"/"+again+"/"+point+"/"+writer+"/${login.NAME }",
	     			async : false,
	     			success : function(txt){
	     				if(txt){
	     					alert("등록되었습니다.");
	     					location.href="/academy/"+num;
	     				} else {
	     					alert("등록에 실패하였습니다\n잠시후 다시 시도해주세요.");
	     				}
	     			}
	     		});
     		}
     	}
     	// 평점 클릭
     	var repoint = 0;
     	function rePoint(num){
     		for(var i=1; i<=5; i++){
     			if(i<=num){
     				$("#star"+i).prop("src", "/img/main01_03_star.png");
     			} else {
     				$("#star"+i).prop("src", "/img/main01_03_star1.png");
     			}
     		}
     		repoint = num;
     		var txt = "<font style='color: red; font-weight: normal'>*평점은 추후 수정불가</font>"
     		$("#totalPoint").html("("+num+".0)"+txt);
     	}
    	// 리뷰 클릭
     	function reviewDetail(auto){
     		$.ajax({
     			tyep : "post",
     			url : "/academy/reviewDetail/"+auto,
     			async : false,
     			success : function(txt){
     				$("#reviewDetail").html(txt);
     				$("#reviewDetail").show();
     				$("#gradeDiv").hide();
     				$("#boardDiv").hide();
     				$("#writeDiv").hide();
     				$("#pageDiv").hide();
     				$("#reviewDiv").hide();
     				$("#feelingDiv").hide();
     			}
     		});
     	}
    </script>

</html>