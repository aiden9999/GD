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
	
	@RequestMapping("/")
	public ModelAndView worry(){
		ModelAndView mav = new ModelAndView("/menu/community/worry/worry.jsp");
//		List<HashMap> list = ws.worry(1);
//		mav.addObject("list", list);
		return mav;
	}
}
