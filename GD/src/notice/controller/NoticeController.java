package notice.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import notice.service.*;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	NoticeService ns;
	
	// 공지사항 글쓰기
	@RequestMapping("/write")
	public String write(){
		return "/menu/information/notice/write.jsp";
	}
	
	// 공지사항 작성
	@RequestMapping("/write/{id}/{content}/{title}")
	@ResponseBody
	public boolean writeSave(@PathVariable(name="title")String title, @PathVariable(name="content")String content,
										@PathVariable(name="id")String id){
		return ns.write(title, content, id);
	}
}
