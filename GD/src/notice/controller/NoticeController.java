package notice.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import notice.service.*;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService ns;
	
	// 공지사항 글쓰기
	@RequestMapping("/write")
	public String write(){
		return "/menu/community/notice/write.jsp";
	}
	
	// 공지사항 작성
	@RequestMapping("/write/{id}/{name}/{title}/{content}")
	@ResponseBody
	public boolean writeSave(@PathVariable(name="title")String title, @PathVariable(name="content")String content,
										@PathVariable(name="id")String id, @PathVariable(name="name")String name){
		return ns.write(title, content, id, name);
	}
	
	// 공지사항 페이지
	@RequestMapping("/page/{pageNum}")
	public ModelAndView noticePage(@PathVariable(name="pageNum")int pageNum){
		ModelAndView mav = new ModelAndView("/menu/community/notice/noticeAjax.jsp");
		List<HashMap> noticeList = ns.noticeList(pageNum);
		mav.addObject("noticeList", noticeList);
		int noticeCount = ns.noticeCount()-(pageNum-1)*10;
		mav.addObject("noticeCount", noticeCount);
		int noticePage = ns.noticeCount()%10==0 ? ns.noticeCount()/10 : ns.noticeCount()/10+1;
		mav.addObject("noticePage", noticePage);
		mav.addObject("selectPage", pageNum);
		return mav;
	}
}
