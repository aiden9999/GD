package admin.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import academy.service.*;
import admin.service.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService ad;
	@Autowired
	MailService ms;
	@Autowired
	AcademyService as;
	
	// 멤버 상세정보
	@RequestMapping("/memberDetail/{id}")
	public ModelAndView memberDetail(@PathVariable(name="id")String id){
		ModelAndView mav = new ModelAndView("/admin/tab1Ajax.jsp");
		List<HashMap> list = ad.memberDetail(id);
		mav.addObject("memberList", list);
		List<HashMap> acaList = as.allAcademy();
		mav.addObject("acaList", acaList);
		return mav;
	}
	
	// 관리자 권한주기 및 저장
	@RequestMapping("/giveAdmin/{id}/{what}/{grade}")
	@ResponseBody
	public boolean giveAdmin(@PathVariable(name="id")String id, @PathVariable(name="what")String what, @PathVariable(name="grade")String grade){
		return ad.giveAdmin(id, what, grade);
	}
	
	// 관리자 권한뺏기 및 저장
	@RequestMapping("/loseAdmin/{id}")
	@ResponseBody
	public boolean loseAdmin(@PathVariable(name="id")String id){
		return ad.loseAdmin(id);
	}
	
	// 관리자 권한 설정
	@RequestMapping("/setAdmin/{id}/{what}/{grade}/{admin}/{acaNum}")
	@ResponseBody
	public boolean setAdmin2(@PathVariable(name="id")String id, @PathVariable(name="what")String what,
												@PathVariable(name="grade")String grade, @PathVariable(name="admin")String admin,
												@PathVariable(name="acaNum")String num){
		return ad.setAdmin(id, what, grade, admin, num);
	}
	
	// tab2 글목록
	@RequestMapping("/board/{type}")
	public ModelAndView board(@PathVariable(name="type")String type){
		ModelAndView mav = new ModelAndView("/admin/tab2Ajax.jsp");
		List<HashMap> list = ad.board(type);
		mav.addObject("boardList", list);
		return mav;
	}
	
	// tab2 글 상세보기
	@RequestMapping("/boardDetail/{board}/{title}")
	@ResponseBody
	public List<HashMap> boardDetail(@PathVariable(name="board")String board, @PathVariable(name="title")String title){
		return ad.boardDetail(board, title);
	}
	
	// tab2 글 이동
	@RequestMapping("/boardDelete/{nowBoard}/{title}/{writer}/{content}")
	@ResponseBody
	public boolean boardMove(@PathVariable(name="nowBoard")String nowBoard, @PathVariable(name="title")String title, 
												@PathVariable(name="writer")String writer, @PathVariable(name="content")String content){
		return ad.boardMove(nowBoard, title, writer, content);
	}
	
	// 학원 등록 완료
	@RequestMapping("/registCommit")
	@ResponseBody
	public ModelAndView commit(@RequestParam(name="name")String name, @RequestParam(name="addr")String addr,
													@RequestParam(name="addr1")String addr1, @RequestParam(name="tell")String tell,
													@RequestParam(name="site")String site, @RequestParam(name="intro")String intro,
													@RequestParam(name="target")String target, @RequestParam(name="subject")String subject,
													@RequestParam(name="logo")MultipartFile logo, @RequestParam(name="pic1")MultipartFile pic1,
													@RequestParam(name="pic2", required=false)MultipartFile pic2,
													@RequestParam(name="pic3", required=false)MultipartFile pic3,
													@RequestParam(name="pic4", required=false)MultipartFile pic4,
													@RequestParam(name="pic5", required=false)MultipartFile pic5){
		ModelAndView mav = new ModelAndView("/admin/admin.jsp");
		String logoUUID = ad.logoUUID(logo);
		String pic1UUID = ad.picUUID(pic1);
		String pic2UUID = ad.picUUID(pic2);
		String pic3UUID = ad.picUUID(pic3);
		String pic4UUID = ad.picUUID(pic4);
		String pic5UUID = ad.picUUID(pic5);
		boolean b = ad.academyRegist(name, addr, addr1, tell, site, logoUUID, intro, pic1UUID, pic2UUID, pic3UUID,
									pic4UUID, pic5UUID, target, subject);
		List<HashMap> memberList = ad.memberList();
		mav.addObject("memberList", memberList);
		mav.addObject("b", b ? "y" : "n");
		return mav;
	}
	
	// 주소검색 호출
	@RequestMapping("/postCode")
	public String postCode(){
		return "/admin/postCode.jsp";
	}
	
	// 메일보내기
	@RequestMapping("/mail/{to}/{subject}/{content}")
	@ResponseBody
	public boolean mail(@PathVariable(name="to")String[] to, @PathVariable(name="subject")String subject,
									@PathVariable(name="content")String content, HttpSession session){
		List<String> emailList = ad.emailList(to);
		return ms.mailSend(emailList, subject, content);
	}
	
	// 주소검색 창
//	@RequestMapping("/search")
//	public String search(){
//		return "/admin/addrSearch.jsp";
//	}
//	
//	// 주소검색 결과
//	@RequestMapping("searchResult")
//	public String searchResult(){
//		return "/admin/searchResult.jsp";
//	}
}
