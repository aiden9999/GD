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
	
	// ����
	@RequestMapping("/")
	public String index(){
		return "/main/index.jsp";
	}
	
	// top �޴� �ʵ��п�
	@RequestMapping("/elementary")
	public String elementary(){
		return "/menu/elementary/index.jsp";
	}

	// top �޴� �ߵ��п�
	@RequestMapping("/middle")
	public String middle(){
		return "/menu/middle/index.jsp";
	}

	// top �޴� ����п�
	@RequestMapping("/high")
	public String high(){
		return "/menu/high/index.jsp";
	}

	// top �޴� ����п�
	@RequestMapping("/information")
	public String information(){
		return "/menu/information/index.jsp";
	}

	// top �޴� ����п�
	@RequestMapping("/community")
	public String community(){
		return "/menu/community/index.jsp";
	}
}
