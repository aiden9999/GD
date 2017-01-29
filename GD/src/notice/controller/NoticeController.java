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
	
	@RequestMapping("/write")
	public String write(){
		return "/menu/information/notice/write.jsp";
	}
}
