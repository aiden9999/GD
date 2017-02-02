package univExam.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import univExam.service.*;

@Controller
@RequestMapping("/univExam")
public class UnivExamController {
	@Autowired
	UnivExamService us;
	
	// 대학입시 글쓰기
	@RequestMapping("/write")
	public String write(){
		return "/menu/information/univExam/write.jsp";
	}
	
	// 대학입시 작성
	@RequestMapping("/write/{id}/{name}/{title}/{content}")
	@ResponseBody
	public boolean writeSave(@PathVariable(name="title")String title, @PathVariable(name="content")String content,
										@PathVariable(name="id")String id, @PathVariable(name="name")String name){
		return us.write(title, content, id, name);
	}
	
	// 대학입시 페이지
	@RequestMapping("/page/{pageNum}")
	public ModelAndView univPage(@PathVariable(name="pageNum")int pageNum){
		ModelAndView mav = new ModelAndView("/menu/information/univExam/univAjax.jsp");
		List<HashMap> list = us.univExam(pageNum);
		mav.addObject("list", list);
		int univCount = us.univCount()-(pageNum-1)*10;
		mav.addObject("univCount", univCount);
		int univPage = us.univCount()%10==0 ? us.univCount()/10 : us.univCount()/10+1;
		mav.addObject("univPage", univPage);
		mav.addObject("selectPage", pageNum);
		return mav;
	}
}
