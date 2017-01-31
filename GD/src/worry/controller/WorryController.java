package worry.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import worry.service.*;

@Controller
@RequestMapping("/worry")
public class WorryController {
	@Autowired
	WorryService ws;
	
	// 등록
	@RequestMapping("/write/{id}/{name}/{worry}")
	@ResponseBody
	public boolean write(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="worry")String worry){
		return ws.write(id, name, worry);
	}
	
	// 댓글등록
	@RequestMapping("/reply/{id}/{name}/{reply}/{num}")
	@ResponseBody
	public boolean reply(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="reply")String reply,
										@PathVariable(name="num")int num){
		return ws.reply(id, name, reply, num);
	}
}
