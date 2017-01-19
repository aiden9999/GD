<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
        <script>
            function myFunction(num) { 
                var x =document.getElementById("dropdown"+num);
                if (x.className.indexOf("drop_show") == -1) {
                    x.className += " drop_show";
                }
            }
            function clo(num) {
                var x = document.getElementById("dropdown"+num);
                x.className = x.className.replace(" drop_show", "");
            }
        </script>
    </head>
     
    <body>
        <header>
            <div class="header_top">
                <div class="inner">
                    <div class="logo" onclick="location.href='/'"><span >L</span>ogo</div>
                    <div class="search">
                        <input type="text" id="hsearch" style="border: 2px solid #888f8d; height: 24px; " maxlength="10">
                        <img class="hsearch" src="/img/search.png" onclick="search()">
                    </div>
                    <div class="txt" onclick="login()">로그인</div>
                </div>
            </div>
            <div class="gnb">
                <div class="inner">
                    <ul>
                        <li>
                            <div class="txt">초등학원</div>
                        </li>
                        <li>
                            <div class="txt">중등학원</div>
                        </li>
                        <li>
                            <div class="txt">고등학원</div>
                        </li>
                        <li>
                            <div class="txt">입시정보</div>
                        </li>
                        <li>
                            <div class="txt">커뮤니티</div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="sub03">
            <div class="inner">
                <section class="notice_wrap">
                    <div class="notice_tit">공지사항</div>
                    <div class="notice_txt">
                        <span>강남에서 대학가기</span>
                        공지사항 게시판 입니다.
                    </div>
                </section>
                <section class="info_section">
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
                        <div class="txt_box new">
                            <div class="txt txt_number">
                                <span>new</span>
                            </div>
                            <div onclick="myFunction(1)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown1" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(1)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>매쓰클럽</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box new">
                            <div class="txt txt_number">
                                <span>new</span>
                            </div>
                            <div onclick="myFunction(2)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown2" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(2)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>매쓰클럽</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>03</span>
                            </div>
                            <div onclick="myFunction(3)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown3" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(3)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>04</span>
                            </div>
                            <div onclick="myFunction(4)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown4" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(4)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>05</span>
                            </div>
                            <div onclick="myFunction(5)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown5" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(5)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>06</span>
                            </div>
                            <div onclick="myFunction(6)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown6" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(6)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>07</span>
                            </div>
                            <div onclick="myFunction(7)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown7" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(7)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>08</span>
                            </div>
                            <div onclick="myFunction(8)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown8" class="contents">
                                <div class="img"><img src="/img/sub02_arrow_up.png" onclick="clo(8)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>09</span>
                            </div>
                            <div onclick="myFunction(9)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown9" class="contents">
                                <div class="img"><img src="img/sub02_arrow_up.png" onclick="clo(9)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                        <div class="txt_box">
                            <div class="txt txt_number">
                                <span>10</span>
                            </div>
                            <div onclick="myFunction(10)" class="txt txt_tit">
                                <span>안녕하세요 대치동 학원정보는 MATHSCHOOL</span>
                            </div>
                            <div id="dropdown10" class="contents">
                                <div class="img"><img src="img/sub02_arrow_up.png" onclick="clo(10)"></div>
                                <div class="drop_txt">
                                 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL 안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL
안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOOL안녕하세요 대치동 학원정보는 MATH SCHOO
                                </div>
                            </div>
                            <div class="txt txt_name">
                                <span>tjfdk</span>
                            </div>
                            <div class="txt txt_date">
                                <span>2017-01-17</span>
                            </div>
                        </div>
                    </div>
                    <div class="write_wrap">
                        <div class="empty_box"></div>
                        <div class="write_btn">
                            <div class="txt">글쓰기</div>
                        </div>
                    </div>
                    <div class="page_wrap">
                        <div class="inner">
                            <div class="arrow_wrap">
                                <div class="arrow prev">
                                    <img src="img/sub02_arrow_prev.png">
                                </div>
                                <div class="arrow next">
                                    <img src="img/sub02_arrow_next.png">
                                </div>
                            </div>
                            <div class="num_wrap">
                                <div class="num sel">1</div>
                                <div class="num">2</div>
                                <div class="num">3</div>
                                <div class="num">4</div>
                                <div class="num">5</div>
                                <div class="num">6</div>
                                <div class="num">7</div>
                                <div class="num">8</div>
                                <div class="num">9</div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <footer>
            <div class="inner">
                <div class="logo"><span >L</span>ogo</div>
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
 		    		alert(search);
 	    		}
 			}
 		});
 		// 검색버튼 클릭
 		function search(){
 			var search = $("#hsearch").val();
 			if(search!=""){
 	    		alert($("#hsearch").val());
 			}
 		}
     	// 로그인
     	function login(){
     		// 회원가입 페이지로 이동
     		alert("login");
     	}
    </script>
    
</html>