package academy.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import academy.service.*;
import review.service.*;

@Controller
@RequestMapping("/academy")
public class AcademyController {
	@Autowired
	AcademyService as;
	@Autowired
	ReviewService rs;
	
	// 리뷰작성
	@RequestMapping("/write/{num}")
	@ResponseBody
	public ModelAndView write(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/academy/review.jsp");
		mav.addObject("acaNum", num);
		return mav;
	}
	
	// 리뷰저장
	@RequestMapping("/review/{num}/{day}/{subject}/{subject1}/{className}/{grade}/{teacher}/{type}/{rate1}/{rate2}/{rate3}/{rate4}/"
								+ "{again}/{point}/{writer}/{name}")
	@ResponseBody
	public boolean review(@PathVariable(name="num")int num, @PathVariable(name="day")String day, @PathVariable(name="subject")String subject,
										@PathVariable(name="subject1")String subject1, @PathVariable(name="className")String className,
										@PathVariable(name="grade")String grade, @PathVariable(name="teacher")String teacher,
										@PathVariable(name="type")String type, @PathVariable(name="rate1")String rate1, @PathVariable(name="rate2")String rate2,
										@PathVariable(name="rate3")String rate3, @PathVariable(name="rate4")String rate4,
										@PathVariable(name="again")String again, @PathVariable(name="point")String point,
										@PathVariable(name="writer")String writer, @PathVariable(name="name")String name){
		boolean b = as.review(num, day, subject, subject1, className, grade, teacher, type, rate1, rate2, rate3, rate4, again, point, writer, name);
		if(b){
			as.updatePoint(num, point);
			as.updateAcademy(num, point);
		}
		return b;
	}
	
	// 한줄평가 등록
	@RequestMapping("/comment/{id}/{name}/{point}/{num}/{comment}")
	@ResponseBody
	public boolean comment(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="point")String point,
											@PathVariable(name="num")int num, @PathVariable(name="comment")String comment){
		boolean b = as.comment(id, name, point, num, comment);
		if(b){
			as.updateAcademy(num, point);
			as.replyUp(num);
		}
		return b;
	}
	
	// 학원소식 페이지 이동
	@RequestMapping("/newsPage/{pageNum}/{acaNum}")
	public ModelAndView newsPage(@PathVariable(name="pageNum")int pageNum, @PathVariable(name="acaNum")int acaNum){
		ModelAndView mav = new ModelAndView("/academy/tab2Ajax.jsp");
		List<HashMap> news = as.acanews(acaNum, pageNum);
		int newsPage = as.newsCount(acaNum)%10==0 ? as.newsCount(acaNum)/10 : as.newsCount(acaNum)/10+1;
		int newsCount = as.newsCount(acaNum)-(pageNum-1)*10;
		mav.addObject("news", news);
		mav.addObject("newsPage", newsPage);
		mav.addObject("selectPage", pageNum);
		mav.addObject("newsCount", newsCount);
		int start = 1+(int)((pageNum-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>newsPage ? newsPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// 리뷰 페이지 이동
	@RequestMapping("/reviewPage/{pageNum}/{acaNum}")
	public ModelAndView reviewPage(@PathVariable(name="pageNum")int pageNum, @PathVariable(name="acaNum")int acaNum){
		ModelAndView mav = new ModelAndView("/academy/tab3Ajax.jsp");
		List<HashMap> review = as.reviewPage(acaNum, pageNum);
		mav.addObject("review", review);
		List<HashMap> reviewTop = as.reviewTop(acaNum);
		mav.addObject("reviewTop", reviewTop);
		double rePoint = as.rePoint(acaNum);
		mav.addObject("rePoint", rePoint);
		int again = as.again(acaNum);
		mav.addObject("again", again);
		int all = as.reviewAll(acaNum);
		mav.addObject("all", all);
		int reviewCount = as.reviewAll(acaNum)-(pageNum-1)*7;
		mav.addObject("reviewCount", reviewCount);
		int reviewPage = as.reviewAll(acaNum)%7==0 ? as.reviewAll(acaNum)/7 : as.reviewAll(acaNum)/7+1;
		mav.addObject("reviewPage", reviewPage);
		mav.addObject("selectPage", pageNum);
		int start = 1+(int)((pageNum-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>reviewPage ? reviewPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// 한줄평가 페이지 이동
	@RequestMapping("/commentPage/{pageNum}/{acaNum}")
	public ModelAndView commentPage(@PathVariable(name="pageNum")int pageNum, @PathVariable(name="acaNum")int acaNum){
		ModelAndView mav = new ModelAndView("/academy/commentAjax.jsp");
		List<HashMap> list = as.commentList(acaNum, pageNum);
		mav.addObject("comment", list);
		mav.addObject("selectPage", pageNum);
		int commentPage = as.commentPage(acaNum)%5==0 ? as.commentPage(acaNum)/5 : as.commentPage(acaNum)/5+1;
		mav.addObject("commentPage", commentPage);
		int commentPoint = 0;
		List<HashMap> commentAll = as.commentAll(acaNum);
		for(HashMap m : commentAll){
			commentPoint += (int)m.get("POINT");
		}
		double totalPoint = Double.parseDouble(String.format("%.1f", commentPoint/(commentAll.size()/1.0)));
		mav.addObject("totalPoint", totalPoint);
		int start = 1+(int)((pageNum-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>commentPage ? commentPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// 학원소식 작성
	@RequestMapping("/writeNews/{acaNum}")
	public ModelAndView writeNews(@PathVariable(name="acaNum")int num){
		ModelAndView mav = new ModelAndView("/academy/write.jsp");
		mav.addObject("acaNum", num);
		return mav;
	}
	
	// 학원소식 저장
	@RequestMapping("/saveNews/{writer}/{name}/{title}/{content}/{acaNum}")
	@ResponseBody
	public boolean saveNews(@PathVariable(name="writer")String writer, @PathVariable(name="name")String name,
											@PathVariable(name="title")String title, @PathVariable(name="content")String content,
											@PathVariable(name="acaNum")int acaNum){
		return as.saveNews(writer, name, title, content, acaNum);
	}
	
	// 학원 조회수 증가
	@RequestMapping("/countUp/{num}")
	public void countUp(@PathVariable(name="num")int num, HttpServletRequest req, HttpServletResponse resp){
		as.countUp(num, req, resp);
	}
	
	// 리뷰 상세보기
	@RequestMapping("/reviewDetail/{auto}")
	public ModelAndView reviewDetail(@PathVariable(name="auto")int auto){
		ModelAndView mav = new ModelAndView("/academy/reviewDetail.jsp");
		HashMap list = as.reviewDetail(auto);
		mav.addObject("list", list);
		List<HashMap> reply = rs.replyList(auto);
		mav.addObject("reply", reply);
		return mav;
	}
	
	// 학원소식 상세보기
	@RequestMapping("/view/{acaName}/{acaNum}/{num}")
	public ModelAndView view(@PathVariable(name="acaName")String acaName, @PathVariable(name="acaNum")String acaNum,
												@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/academy/view.jsp");
		HashMap map = as.view(num);
		mav.addObject("map", map);
		mav.addObject("name", acaName);
		mav.addObject("acaNum", acaNum);
		return mav;
	}
	
	// 학원소식 삭제
	@RequestMapping("/delete/{num}")
	@ResponseBody
	public boolean delete(@PathVariable(name="num")int num){
		return as.delete(num);
	}
	
	// 한줄평가 수정
	@RequestMapping("/commentModify/{num}/{comment}")
	@ResponseBody
	public boolean commentModify(@PathVariable(name="num")int num, @PathVariable(name="comment")String comment){
		return as.commentModify(num, comment);
	}
	
	// 한줄평가 삭제
	@RequestMapping("/commentRemove/{num}")
	@ResponseBody
	public boolean commentRemove(@PathVariable(name="num")int num){
		return as.commentRemove(num);
	}
}
