package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import academy.service.*;
import admin.service.*;
import main.service.*;
import notice.service.*;
import worry.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;
	@Autowired
	AcademyService as;
	@Autowired
	NoticeService ns;
	@Autowired
	WorryService ws;
	@Autowired
	AdminService ad;
	
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
	public ModelAndView information(){
//		return "/menu/information/index.jsp";
		ModelAndView mav = new ModelAndView("/menu/information/notice/notice.jsp");
		List<HashMap> noticeList = ns.noticeList(1);
		mav.addObject("noticeList", noticeList);
		int noticeCount = ns.noticeCount();
		mav.addObject("noticeCount", noticeCount);
		int noticePage = ns.noticeCount()%10==0 ? ns.noticeCount()/10 : ns.noticeCount()/10+1;
		mav.addObject("noticePage", noticePage);
		return mav;
	}

	// top 메뉴 커뮤니티
	@RequestMapping("/community")
	public ModelAndView community(){
		ModelAndView mav = new ModelAndView("/menu/community/worry/worry.jsp");
		List<HashMap> worryList = ws.worry(1);
		mav.addObject("worryList", worryList);
		List<HashMap> replyList = ws.replyList();
		mav.addObject("replyList", replyList);
		int worryPage = ws.worryCount()%10==0 ? ws.worryCount()/10 : ws.worryCount()/10+1;
		mav.addObject("worryPage", worryPage);
		return mav;
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
		int newsCount = as.newsCount(num);
		mav.addObject("newsCount", newsCount);
		int newsPage = newsCount%10==0 ? newsCount/10 : newsCount/10+1;
		mav.addObject("newsPage", newsPage);
		
		List<HashMap> review = as.reviewPage(num, 1);
//		List<HashMap> review = as.reviewPage(num);
		mav.addObject("review", review);
		List<HashMap> reviewTop = as.reviewTop(num);
		mav.addObject("reviewTop", reviewTop);
		double rePoint = as.rePoint(num);
		mav.addObject("rePoint", rePoint);
		int again = as.again(num);
		mav.addObject("again", again);
		int all = as.reviewAll(num);
		mav.addObject("all", all);
		int reviewPage = as.reviewAll(num)%7==0 ? as.reviewAll(num)/7 : as.reviewAll(num)/7+1;
		mav.addObject("reviewPage", reviewPage);
		int reviewCount = as.reviewAll(num)-(1-1)*10;
		mav.addObject("reviewCount", reviewCount);
		
		List<HashMap> comment = as.commentList(num);
		mav.addObject("comment", comment);
		int commentPoint = 0;
		for(HashMap m : comment){
			commentPoint += (int)m.get("POINT");
		}
		double totalPoint = Double.parseDouble(String.format("%.1f", commentPoint/(comment.size()/1.0)));
		mav.addObject("totalPoint", totalPoint);
		return mav;
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(){
		return "/member/join.jsp";
	}
	
	// 검색
	@RequestMapping("search/{search}")
	public ModelAndView search(@PathVariable(name="search")String search){
		ModelAndView mav = new ModelAndView("/main/search.jsp");
//		List<HashMap> list = ms.search(search);
//		mav.addObject("search", list);
		return mav;
	}
	
	// 관리자 페이지
	@RequestMapping("/admin")
	public ModelAndView admin(){
		ModelAndView mav = new ModelAndView("/admin/admin.jsp");
		List<HashMap> memberList = ad.memberList();
		mav.addObject("memberList", memberList);
		return mav;
	}
}
