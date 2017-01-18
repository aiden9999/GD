package main.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import main.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;
	
	// 메인
	@RequestMapping("/")
	public String index(){
		return "/main/index.jsp";
	}
	
	// top 메뉴 초등학원
	@RequestMapping("/elementary")
	public String elementary(){
		return "/menu/elementary/index.jsp";
	}

	// top 메뉴 중등학원
	@RequestMapping("/middle")
	public String middle(){
		return "/menu/middle/index.jsp";
	}

	// top 메뉴 고등학원
	@RequestMapping("/high")
	public String high(){
		return "/menu/high/index.jsp";
	}

	// top 메뉴 고등학원
	@RequestMapping("/information")
	public String information(){
		return "/menu/information/index.jsp";
	}

	// top 메뉴 고등학원
	@RequestMapping("/community")
	public String community(){
		return "/menu/community/index.jsp";
	}
}
