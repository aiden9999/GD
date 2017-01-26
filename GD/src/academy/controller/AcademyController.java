package academy.controller;

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
	
	@RequestMapping("/write/{num}")
	@ResponseBody
	public ModelAndView write(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/academy/review.jsp");
		mav.addObject("acaNum", num);
		return mav;
	}
	
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
}
