package academy.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import academy.service.*;

@Controller
@RequestMapping("/academy")
public class AcademyController {
	@Autowired
	AcademyService as;
	
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
								+ "{again}/{point}/{writer}")
	@ResponseBody
	public boolean review(@PathVariable(name="num")int num, @PathVariable(name="day")String day, @PathVariable(name="subject")String subject,
										@PathVariable(name="subject1")String subject1, @PathVariable(name="className")String className,
										@PathVariable(name="grade")String grade, @PathVariable(name="teacher")String teacher,
										@PathVariable(name="type")String type, @PathVariable(name="rate1")String rate1, @PathVariable(name="rate2")String rate2,
										@PathVariable(name="rate3")String rate3, @PathVariable(name="rate4")String rate4,
										@PathVariable(name="again")String again, @PathVariable(name="point")String point,
										@PathVariable(name="writer")String writer){
		return as.review(num, day, subject, subject1, className, grade, teacher, type, rate1, rate2, rate3, rate4, again, point, writer);
	}
	
	// 한줄평가 등록
	@RequestMapping("/comment/{id}/{name}/{point}/{num}/{comment}")
	@ResponseBody
	public boolean comment(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="point")String point,
											@PathVariable(name="num")int num, @PathVariable(name="comment")String comment){
		return as.comment(id, name, point, num, comment);
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
		return mav;
	}
	
	// 리뷰 페이지 이동
	@RequestMapping("/reviewPage/{pageNum}/{acaNum}")
	public ModelAndView reviewPage(@PathVariable(name="pageNum")int pageNum, @PathVariable(name="acaNum")int acaNum){
		ModelAndView mav = new ModelAndView("/academy/tab3Ajax.jsp");
		List<HashMap> review = as.reviewPage(acaNum, pageNum);
//		List<HashMap> review = as.reviewPage(num);
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
		return mav;
	}
}
