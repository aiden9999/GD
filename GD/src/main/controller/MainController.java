package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import academy.service.*;
import admin.service.*;
import highExam.service.*;
import main.service.*;
import notice.service.*;
import univExam.service.*;
import waggle.service.*;
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
	@Autowired
	HighExamService hs;
	@Autowired
	UnivExamService us;
	@Autowired
	WaggleService was;
	
	// 메인
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		ModelAndView mav = new ModelAndView("/main/index.jsp");
		ms.check(req, resp, session);
		List<List<HashMap>> total = ms.mainAca();
		List<HashMap> ele = total.get(0);
		List<HashMap> mid = total.get(1);
		List<HashMap> hig = total.get(2);
		mav.addObject("ele", ele);
		mav.addObject("mid", mid);
		mav.addObject("hig", hig);
		
		// 내글, 내댓글
		if(session.getAttribute("login")!=null){
			int myBoard = ms.myBoard((String)((HashMap)session.getAttribute("login")).get("ID"));
			mav.addObject("myBoard", myBoard);
			
			int myReply = ms.myReply((String)((HashMap)session.getAttribute("login")).get("ID"));
			mav.addObject("myReply", myReply);
		}
		
		// 공지사항
		List<HashMap> notice = ms.mainNotice();
		mav.addObject("notice", notice);
		
		// 수다방
		List<HashMap> waggle = ms.mainWaggle();
		mav.addObject("waggle", waggle);
		
		// 입시정보
		List<List<HashMap>> exam = ms.mainExam();
		mav.addObject("highExam", exam.get(0));
		mav.addObject("univExam", exam.get(1));
		
		// 메인 추천학원
		List<HashMap> recAca = ms.recomendAcademy();
		mav.addObject("recAca", recAca);
		
		// 아이피 저장 및 방문자수 리턴
		String ipSize = ms.visitIp(req);
		String todayVisit = ipSize.substring(0, ipSize.indexOf('/'));
		String totalVisit = ipSize.substring(ipSize.indexOf('/')+1);
		mav.addObject("todayVisit", todayVisit);
		mav.addObject("totalVisit", totalVisit);
		return mav;
	}
	
	// 타 메뉴에서 메인 접근
	@RequestMapping("/{type}")
	public ModelAndView index2(@PathVariable(name="type")String type, HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		ModelAndView mav = new ModelAndView("/main/index.jsp");
		ms.check(req, resp, session);
		List<List<HashMap>> total = ms.mainAca();
		List<HashMap> ele = total.get(0);
		List<HashMap> mid = total.get(1);
		List<HashMap> hig = total.get(2);
		mav.addObject("ele", ele);
		mav.addObject("mid", mid);
		mav.addObject("hig", hig);
		
		if(session.getAttribute("login")!=null){
			int myBoard = ms.myBoard((String)((HashMap)session.getAttribute("login")).get("ID"));
			mav.addObject("myBoard", myBoard);
			
			int myReply = ms.myReply((String)((HashMap)session.getAttribute("login")).get("ID"));
			mav.addObject("myReply", myReply);
		}
		// 공지사항
		List<HashMap> notice = ms.mainNotice();
		mav.addObject("notice", notice);
		
		// 수다방
		List<HashMap> waggle = ms.mainWaggle();
		mav.addObject("waggle", waggle);
		
		// 입시정보
		List<List<HashMap>> exam = ms.mainExam();
		mav.addObject("highExam", exam.get(0));
		mav.addObject("univExam", exam.get(1));
		
		// 메인 추천학원
		List<HashMap> recAca = ms.recomendAcademy();
		mav.addObject("recAca", recAca);
		
		// 아이피 저장 및 방문자수 리턴
		String ipSize = ms.visitIp(req);
		String todayVisit = ipSize.substring(0, ipSize.indexOf('/'));
		String totalVisit = ipSize.substring(ipSize.indexOf('/')+1);
		mav.addObject("todayVisit", todayVisit);
		mav.addObject("totalVisit", totalVisit);
		
		mav.addObject("type", type);
		return mav;
	}
	
	// top 메뉴 초등학원
	@RequestMapping("/elementary")
	public ModelAndView elementary(){
		ModelAndView mav = new ModelAndView("/menu/elementary/index.jsp");
		List<List<HashMap>> total = ms.mainAca();
		List<HashMap> ele = total.get(0);
		mav.addObject("list", ele);
		mav.addObject("type", 0);
		return mav;
	}

	// top 메뉴 중등학원
	@RequestMapping("/middle")
	public ModelAndView middle(){
		ModelAndView mav = new ModelAndView("/menu/middle/index.jsp");
		List<List<HashMap>> total = ms.mainAca();
		List<HashMap> mid = total.get(1);
		mav.addObject("list", mid);
		mav.addObject("type", 1);
		return mav;
	}

	// top 메뉴 고등학원
	@RequestMapping("/high")
	public ModelAndView high(){
		ModelAndView mav = new ModelAndView("/menu/high/index.jsp");
		List<List<HashMap>> total = ms.mainAca();
		List<HashMap> hig = total.get(2);
		mav.addObject("list", hig);
		mav.addObject("type", 2);
		return mav;
	}
	
	// top 메뉴 재수학원
	@RequestMapping("/misfortune")
	public ModelAndView misf(){
		ModelAndView mav = new ModelAndView("/menu/misfortune/index.jsp");
		List<List<HashMap>> total = ms.mainAca();
		List<HashMap> mis = total.get(3);
		mav.addObject("list", mis);
		mav.addObject("type", 3);
		return mav;
	}

	// top 메뉴 공지사항
	@RequestMapping("/notice")
	public ModelAndView notice(){
//		return "/menu/information/index.jsp";
		ModelAndView mav = new ModelAndView("/menu/community/notice/notice.jsp");
		List<HashMap> noticeList = ns.noticeList(1);
		mav.addObject("noticeList", noticeList);
		int noticeCount = ns.noticeCount();
		mav.addObject("noticeCount", noticeCount);
		int noticePage = ns.noticeCount()%10==0 ? ns.noticeCount()/10 : ns.noticeCount()/10+1;
		mav.addObject("noticePage", noticePage);
		return mav;
	}
	
	// top 메뉴 수다방
	@RequestMapping("/waggle")
	public ModelAndView waggle(){
		ModelAndView mav = new ModelAndView("/menu/community/waggle/waggle.jsp");
		List<HashMap> waggleList = was.waggle(1);
		mav.addObject("waggleList", waggleList);
		List<HashMap> replyList = was.replyList();
		mav.addObject("replyList", replyList);
		int wagglePage = was.waggleCount()%10==0 ? was.waggleCount()/10 : was.waggleCount()/10+1;
		mav.addObject("wagglePage", wagglePage);
		return mav;
	}

	// top 메뉴 고민상담
	@RequestMapping("/worry")
	public ModelAndView worry(){
		ModelAndView mav = new ModelAndView("/menu/community/worry/worry.jsp");
		List<HashMap> worryList = ws.worry(1);
		mav.addObject("worryList", worryList);
		List<HashMap> replyList = ws.replyList();
		mav.addObject("replyList", replyList);
		int worryPage = ws.worryCount()%10==0 ? ws.worryCount()/10 : ws.worryCount()/10+1;
		mav.addObject("worryPage", worryPage);
		return mav;
	}
	
	// top 메뉴 고등입시
	@RequestMapping("/highExam")
	public ModelAndView highExam(){
		ModelAndView mav = new ModelAndView("/menu/information/highExam/highExam.jsp");
		List<HashMap> list = hs.highExam(1);
		mav.addObject("list", list);
		int noticeCount = hs.highCount();
		mav.addObject("highCount", noticeCount);
		int noticePage = hs.highCount()%10==0 ? hs.highCount()/10 : hs.highCount()/10+1;
		mav.addObject("highPage", noticePage);
		return mav;
	}

	// top 메뉴 대학입시
	@RequestMapping("/univExam")
	public ModelAndView univExam(){
		ModelAndView mav = new ModelAndView("/menu/information/univExam/univExam.jsp");
		List<HashMap> list = us.univExam(1);
		mav.addObject("list", list);
		int noticeCount = us.univCount();
		mav.addObject("univCount", noticeCount);
		int noticePage = us.univCount()%10==0 ? us.univCount()/10 : us.univCount()/10+1;
		mav.addObject("univPage", noticePage);
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
		
		List<HashMap> comment = as.commentList(num, 1);
		mav.addObject("comment", comment);
		int commentPoint = 0;
		List<HashMap> commentAll = as.commentAll(num);
		for(HashMap m : commentAll){
			commentPoint += (int)m.get("POINT");
		}
		double totalPoint = Double.parseDouble(String.format("%.1f", commentPoint/(commentAll.size()/1.0)));
		mav.addObject("totalPoint", totalPoint);
		int commentPage = as.commentPage(num)%5==0 ? as.commentPage(num)/5 : as.commentPage(num)/5+1;
		mav.addObject("commentPage", commentPage);
		return mav;
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(){
		return "/member/join.jsp";
	}
	
	// 검색
	@RequestMapping("/search/{search}")
	public ModelAndView search(@PathVariable(name="search")String search, HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = inner(search, 1);
		ms.searchUpdate(search, req, resp);
		return mav;
	}
	
	// 검색 내부메서드
	public ModelAndView inner(String search, int num){
		ModelAndView mav = new ModelAndView("/main/search.jsp");
		mav.addObject("searchWord", search);
		List<HashMap> list = ms.academy(search, num);
		mav.addObject("academy", list);
		int acaPage = ms.academyPage(search);
		mav.addObject("acaPage", acaPage);
		
		List<HashMap> notice = ms.notice(search, num);
		mav.addObject("notice", notice);
		int noticePage = ms.noticePage(search);
		noticePage = noticePage%5==0 ? noticePage/5 : noticePage/5+1;
		mav.addObject("boardPage", noticePage);
		return mav;
	}
	
	// 검색 게시판 변경
	@RequestMapping("/boardChange/{board}/{search}/{page}")
	public ModelAndView boardChange(@PathVariable(name="board")String board, @PathVariable(name="search")String search,
															@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/main/boardListAjax.jsp");
		List<HashMap> list = ms.boardChange(board, search, page);
		mav.addObject("list", list);
		int listPage = ms.boardPage(board, search);
		listPage = listPage%5==0 ? listPage/5 : listPage/5+1;
		mav.addObject("boardPage", listPage);
		int start = 1+(int)((listPage-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>listPage ? listPage : start+9;
		mav.addObject("end", end);
		mav.addObject("selectPage", page);
		String type = "";
		switch(board){
		case "notice":
			type = "공지사항";
			break;
		case "highExam":
			type = "고등입시";
			break;
		case "univExam":
			type = "대학입시";
			break;
		case "worry":
			type = "고민상당";
			break;
		case "waggle":
			type = "수다방";
			break;
		case "acaNews":
			type = "학원소식";
			break;
		case "acaComment":
			type = "한줄평가";
			break;
		}
		mav.addObject("type", type);
		return mav;
	}
	
	// 검색 게시판 변경 페이지
	@RequestMapping("/boardPage/{board}/{search}/{page}")
	public ModelAndView boardPage(@PathVariable(name="board")String board, @PathVariable(name="search")String search,
														@PathVariable(name="page")int num){
		ModelAndView mav = new ModelAndView("/main/boardPageAjax.jsp");
		int page = ms.boardPage(board, search);
		page = page%5==0 ? page/5 : page/5+1;
		mav.addObject("boardPage", page);
		int start = 1+(int)((num-1)/5)*5;
		mav.addObject("start", start);
		int end = start+9>page ? page: start+9;
		mav.addObject("end", end);
		mav.addObject("selectPage", num);
		return mav;
	}
	
	// 관리자 페이지
	@RequestMapping("/admin")
	public ModelAndView admin(){
		ModelAndView mav = new ModelAndView("/admin/admin.jsp");
		List<HashMap> memberList = ad.memberList();
		mav.addObject("memberList", memberList);
		List<HashMap> acaList = as.allAcademy();
		mav.addObject("acaList", acaList);
		return mav;
	}
	
	// 메인 학원리스트 정렬
	@RequestMapping("/main/alignAjax/{align}/{num}")
	public ModelAndView eleAjax(@PathVariable(name="align")String align, @PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/main/alignAjax.jsp");
		List<List<HashMap>> total = ms.align(align);
		List<HashMap> list = total.get(num);
		mav.addObject("list", list);
		String alignAcaName = "";
		switch(num){
		case 0:
			alignAcaName = "초등";
			break;
		case 1:
			alignAcaName = "중등";
			break;
		case 2:
			alignAcaName = "고등";
			break;
		}
		mav.addObject("alignAcaName", alignAcaName);
		return mav;
	}
	
	// 메인 초등, 중등, 고등, 재수 정렬
	@RequestMapping("/main/searchAlign/{align}/{num}")
	public ModelAndView searchAlign(@PathVariable(name="align")String align, @PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView();
		List<List<HashMap>> total = ms.align(align);
		List<HashMap> list = new Vector<>();
		switch(num){
		case 0:
			list = total.get(0);
			mav.addObject("list", list);
			mav.addObject("type", 0);
			mav.setViewName("/menu/elementary/index.jsp");
			mav.addObject("align", align);
			break;
		case 1:
			list = total.get(1);
			mav.addObject("list", list);
			mav.addObject("type", 1);
			mav.setViewName("/menu/middle/index.jsp");
			mav.addObject("align", align);
			break;
		case 2:
			list = total.get(2);
			mav.addObject("list", list);
			mav.addObject("type", 2);
			mav.setViewName("/menu/high/index.jsp");
			mav.addObject("align", align);
			break;
		case 3:
			list = total.get(3);
			mav.addObject("list", list);
			mav.addObject("type", 3);
			mav.setViewName("/menu/misfortune/index.jsp");
			mav.addObject("align", align);
			break;
		}
		return mav;
	}
}
