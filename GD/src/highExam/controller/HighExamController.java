package highExam.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import highExam.service.*;

@Controller
@RequestMapping("/highExam")
public class HighExamController {
	@Autowired
	HighExamService hs;
	
	// ����Խ� �۾���
	@RequestMapping("/write")
	public String write(){
		return "/menu/information/highExam/write.jsp";
	}
	
	// ����Խ� �ۼ�
	@RequestMapping("/write/{id}/{name}/{title}/{content}")
	@ResponseBody
	public boolean writeSave(@PathVariable(name="title")String title, @PathVariable(name="content")String content,
										@PathVariable(name="id")String id, @PathVariable(name="name")String name){
		return hs.write(title, content, id, name);
	}
	
	// ����Խ� ������
	@RequestMapping("/page/{pageNum}")
	public ModelAndView highPage(@PathVariable(name="pageNum")int pageNum){
		ModelAndView mav = new ModelAndView("/menu/information/highExam/highAjax.jsp");
		List<HashMap> list = hs.highExam(pageNum);
		mav.addObject("list", list);
		int highCount = hs.highCount()-(pageNum-1)*10;
		mav.addObject("highCount", highCount);
		int highPage = hs.highCount()%10==0 ? hs.highCount()/10 : hs.highCount()/10+1;
		mav.addObject("highPage", highPage);
		mav.addObject("selectPage", pageNum);
		return mav;
	}
}
