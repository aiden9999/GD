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
	
	// 메인
	@RequestMapping("/")
	public String index(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		ms.check(req, resp, session);
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

	// top 메뉴 입시정보
	@RequestMapping("/information")
	public String information(){
//		return "/menu/information/index.jsp";
		return "/menu/notice/index.jsp";
	}

	// top 메뉴 커뮤니티
	@RequestMapping("/community")
	public String community(){
		return "/menu/community/index.jsp";
	}
	
	// 로그인
	@RequestMapping("/login/{id}/{pw}/{auto}/{save}")
	@ResponseBody
	public boolean login(@PathVariable(name="id")String id, @PathVariable(name="pw")String pw, @PathVariable(name="auto")boolean auto,
									@PathVariable(name="save")boolean save, HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		return ms.login(id, pw, auto, save, session, req, resp);
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		ms.logout(session, req, resp);
		return "redirect:/";
	}
	
	// 학원 클릭
	@RequestMapping("/academy/{num}")
	public ModelAndView academy(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/academy/academy.jsp");
		List<HashMap> list = as.academy(num);
		mav.addObject("list", list.get(0));
		List<HashMap> news = as.acanews(num, 1);
		mav.addObject("news", news);
		return mav;
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(){
		return "/member/join.jsp";
	}
}
