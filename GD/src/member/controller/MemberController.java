package member.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import member.service.*;

@Controller()
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService ms;
	
	// ���̵� / ��й�ȣ ã��
	@RequestMapping("/search")
	public String search(){
		return "/member/search.jsp";
	}
	
	// ���̵� ã��
	@RequestMapping("/searchId/{name}/{phone}")
	@ResponseBody
	public ModelAndView searchId(@PathVariable(name="name")String name, @PathVariable(name="phone")String phone){
		ModelAndView mav = new ModelAndView("/member/searchId.jsp");
		List<HashMap> list = ms.searchId(name, phone);
		mav.addObject("list", list);
		return mav;
	}
	
	// ��й�ȣ ã��
	@RequestMapping("/searchPw/{id}/{name}")
	@ResponseBody
	public boolean searchPw(@PathVariable(name="id")String id, @PathVariable(name="name")String name){
		return ms.searchPw(id, name);
	}
	
	// ������
	@RequestMapping("/info/{id}")
	public ModelAndView info(@PathVariable(name="id")String id, HttpSession session){
		ModelAndView mav = inner(id);
		session.removeAttribute("info");
		return mav;
	}
	
	// �� ��
	@RequestMapping("/info/myBoard/{id}")
	public ModelAndView myBoard(@PathVariable(name="id")String id, HttpSession session){
		ModelAndView mav = inner(id);
		session.setAttribute("info", "board");
		return mav;
	}
	
	// �� ���
	@RequestMapping("/info/myReply/{id}")
	public ModelAndView myReply(@PathVariable(name="id")String id, HttpSession session){
		ModelAndView mav = inner(id);
		session.setAttribute("info", "reply");
		return mav;
	}
	
	// ������ ���θ޼���
	public ModelAndView inner(String id){
		ModelAndView mav = new ModelAndView("/member/info.jsp");
		List<HashMap> visit = ms.visit(id);
		mav.addObject("visit", visit);
		mav.addObject("lastVisit", visit.get(visit.size()-1).get("VISIT"));
		List<HashMap> monthVisit = new Vector<>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(System.currentTimeMillis());
		now = now.substring(now.indexOf('-')+1, now.lastIndexOf('-'));
		for(HashMap m : visit){
			Date date = (Date)m.get("VISIT");
			String month = date.toString().substring(date.toString().indexOf('-')+1, date.toString().lastIndexOf('-'));
			if(now.equals(month)){
				monthVisit.add(m);
			}
		}
		mav.addObject("monthVisit", monthVisit);
		mav.addObject("point", 0);
		
//		List<HashMap> board1 = ms.board1(id);
//		mav.addObject("board1", board1);
		List<HashMap> board2 = ms.board2(id);
		mav.addObject("board2", board2);
		
//		List<HashMap> reply1 = ms.reply1(id);
//		mav.addObject("reply1", reply1);
		List<HashMap> reply2 = ms.reply2(id);
		mav.addObject("reply2", reply2);
		return mav;
	}
}
