package admin.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import admin.service.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService ad;
	
	// ��� ������
	@RequestMapping("/memberDetail/{id}")
	public ModelAndView memberDetail(@PathVariable(name="id")String id){
		ModelAndView mav = new ModelAndView("/admin/tab1Ajax.jsp");
		List<HashMap> list = ad.memberDetail(id);
		mav.addObject("memberList", list);
		return mav;
	}
}
