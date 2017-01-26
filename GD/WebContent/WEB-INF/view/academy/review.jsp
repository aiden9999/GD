<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="review_wrap1">
    <div class="review_intro">
        <div class="txt">
            <span class="txt1">강남에서 대학가기</span>는 내아이의학원을 고를 더 <span class="txt1">‘이런 리뷰가있으면 좋겠다 ’</span> 라는마음가짐으로 리뷰를 수집합니다.<br>
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
            <div class="academy_name academy_info">
                <div class="tit">학원명</div>
                <input type="text" id="aca_name">
            </div>
            <div class="aca_loca academy_info">
                <div class="tit">학원위치</div>
                <input type="text" id="aca_loca"><span>시</span>
                <input type="text" id="aca_loca"><span>구</span>
                <input type="text" id="aca_loca"><span>동</span>
            </div>
            <div class="aca_term academy_info">
                <div class="tit">수강기간</div>
                <input type="text" id="aca_term">
            </div>
            <div class="aca_subject academy_info">
                <div class="tit">수강과목</div>
                <input type="text" id="aca_subject">
            </div>
            <div class="aca_subject1 academy_info">
                <div class="tit">상세과목(선택사항)</div>
                <input type="text" id="aca_subject1">
            </div>
            <div class="aca_class academy_info">
                <div class="tit">수업이름</div>
                <input type="text" id="aca_subject1">
            </div>
            <div class="aca_age academy_info">
                <div class="tit">수강당시학년</div>
                <input type="text" id="aca_term">
            </div>
            <div class="aca_teacher academy_info">
                <div class="tit">선생님</div>
                <input type="text" id="aca_term">
            </div>
            <div class="aca_sort academy_info">
                <div class="tit">문/이과(선택사항)</div>
                <input type="radio" name="sort" value="liberal"><span>문과</span>
                <input type="radio" name="sort" value="science"><span>이과</span>
                <input type="radio" name="sort" value="art"><span>예체능</span>
            </div>
        </div>
    </div>
</div>
<div class="feeling_wrap">
    <div class="feeling_tit">
        <div class="tit">학원 총 평점</div>
        <div class="star_wrap">
            <div class="star">
                <img src="img/main01_03_star.png">
            </div>
            <div class="star">
                <img src="img/main01_03_star.png">
            </div>
            <div class="star">
                <img src="img/main01_03_star.png">
            </div>
            <div class="star">
                <img src="img/main01_03_star.png">
            </div>
            <div class="star">
                <img src="img/main01_03_star1.png">
            </div>
        </div>
        <div class="txt">(4.0)</div>
    </div>
    <div class="feeling_txtarea">
        <div class="ft_txtarea">
            <div class="tit">수업방식 및 특징<br><span>(최소 20자)</span></div>
            <textarea></textarea>
        </div>
        <div class="ft_txtarea">
            <div class="tit">수강전 학생 상태<br><span>(최소 20자)</span></div>
            <textarea></textarea>
        </div>
        <div class="ft_txtarea">
            <div class="tit">좋은점<br><span>(최소 30자)</span></div>
            <textarea></textarea>
        </div>
        <div class="ft_txtarea">
            <div class="tit">아쉬운점<br><span>(최소 30자)</span></div>
            <textarea></textarea>
        </div>
        <div class="ft_radio">
            <div class="tit">예전으로 돌아가도 이 학원을 다니실건가요?</div>
            <div class="input_wrap">
                <input type="radio" name="yes" value="yes"><span>네</span>
            </div>
            <div class="input_wrap">
                <input type="radio" name="no" value="no"><span>다른곳을 알아본다</span>
            </div>
        </div>
    </div>
    <div class="cannext_wrap">
        <div class="btn cancel">취 소</div>
        <div class="btn next">저 장</div>
    </div>
</div>