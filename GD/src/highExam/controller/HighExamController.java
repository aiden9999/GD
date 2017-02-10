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
	
	// 고등입시 글쓰기
	@RequestMapping("/write")
	public String write(){
		return "/menu/information/highExam/write.jsp";
	}
	
	// 고등입시 작성
	@RequestMapping("/write/{id}/{name}/{title}/{content}")
	@ResponseBody
	public boolean writeSave(@PathVariable(name="title")String title, @PathVariable(name="content")String content,
										@PathVariable(name="id")String id, @PathVariable(name="name")String name){
		return hs.write(title, content, id, name);
	}
	
	// 고등입시 페이지
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
		int start = 1+(int)((pageNum-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>highPage ? highPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// 고등입시 상세보기
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/menu/information/highExam/view.jsp");
		List<HashMap> list = hs.view(num);
		mav.addObject("map", list.get(0));
		return mav;
	}
	
	// 고등입시 수정
	@RequestMapping("/modify/{num}/{title}/{content}")
	@ResponseBody
	public boolean modify(@PathVariable(name="num")int num, @PathVariable(name="title")String title,
											@PathVariable(name="content")String content){
		return hs.modify(num, title, content);
	}
	
	// 고등입시 삭제
	@RequestMapping("/delete/{num}")
	@ResponseBody
	public boolean delete(@PathVariable(name="num")int num){
		return hs.delete(num);
	}
}
