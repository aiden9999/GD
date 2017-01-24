package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import academy.service.*;
import main.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;
	@Autowired
	AcademyService as;
	
	// ����
	@RequestMapping("/")
	public String index(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		ms.check(req, resp, session);
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

	// top �޴� �Խ�����
	@RequestMapping("/information")
	public String information(){
//		return "/menu/information/index.jsp";
		return "/menu/notice/index.jsp";
	}

	// top �޴� Ŀ�´�Ƽ
	@RequestMapping("/community")
	public String community(){
		return "/menu/community/index.jsp";
	}
	
	// �α���
	@RequestMapping("/login/{id}/{pw}/{auto}/{save}")
	@ResponseBody
	public boolean login(@PathVariable(name="id")String id, @PathVariable(name="pw")String pw, @PathVariable(name="auto")boolean auto,
									@PathVariable(name="save")boolean save, HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		return ms.login(id, pw, auto, save, session, req, resp);
	}
	
	// �α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		ms.logout(session, req, resp);
		return "redirect:/";
	}
	
	// �п� Ŭ��
	@RequestMapping("/academy/{num}")
	public ModelAndView academy(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/academy/academy.jsp");
		List<HashMap> list = as.academy(num);
		mav.addObject("list", list.get(0));
		List<HashMap> news = as.acanews(num, 1);
		mav.addObject("news", news);
		return mav;
	}
	
	// ȸ������
	@RequestMapping("/join")
	public String join(){
		return "/member/join.jsp";
	}
}
