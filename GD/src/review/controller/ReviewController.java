package review.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import review.service.*;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	ReviewService rs;
	
	// ���� ��õ
	@RequestMapping("/recomend/{num}")
	@ResponseBody
	public boolean recomend(@PathVariable(name="num")int num, HttpServletRequest req, HttpServletResponse resp){
		return rs.recomend(num, req, resp);
	}
	
	// ���� ��ȸ�� ����
	@RequestMapping("/countUp/{num}")
	public void countUp(@PathVariable(name="num")int num, HttpServletRequest req, HttpServletResponse resp){
		rs.countUp(num, req, resp);
	}
	
	// ���� ��� ���
	@RequestMapping("/reply/{id}/{name}/{num}/{reply}")
	@ResponseBody
	public boolean writeRep(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="num")int num,
											@PathVariable(name="reply")String reply){
		boolean b = rs.writeRep(id, name, num, reply);
		if(b){
			rs.reviewRepUp(num);
		}
		return b;
	}
	
	// ���� ��� ����
	@RequestMapping("/replyModify/{num}/{reply}")
	@ResponseBody
	public boolean replyModify(@PathVariable(name="num")int num, @PathVariable(name="reply")String reply){
		return rs.replyModify(num, reply);
	}
	
	// ���� ����
	@RequestMapping("/reviewModify/{num}/{day}/{subject}/{subject1}/{className}/{grade}/{teacher}/{type}/"
								+ "{rate1}/{rate2}/{rate3}/{rate4}/{again}")
	@ResponseBody
	public boolean reviewModify(@PathVariable(name="num")int num, @PathVariable(name="day")String day,
												@PathVariable(name="subject")String subject, @PathVariable(name="subject1")String subject1,
												@PathVariable(name="className")String className, @PathVariable(name="grade")String grade,
												@PathVariable(name="teacher")String teacher, @PathVariable(name="type")String type,
												@PathVariable(name="rate1")String rate1, @PathVariable(name="rate2")String rate2,
												@PathVariable(name="rate3")String rate3, @PathVariable(name="rate4")String rate4,
												@PathVariable(name="again")String again){
		return rs.reviewModify(num, day, subject, subject1, className, grade, teacher, type, rate1, rate2, rate3, rate4, again);
	}
}
