package member.controller;

import java.text.*;
import java.util.*;

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
	
	// 아이디 / 비밀번호 찾기
	@RequestMapping("/search")
	public String search(){
		return "/member/search.jsp";
	}
	
	// 아이디 찾기
	@RequestMapping("/searchId/{name}/{phone}")
	@ResponseBody
	public ModelAndView searchId(@PathVariable(name="name")String name, @PathVariable(name="phone")String phone){
		ModelAndView mav = new ModelAndView("/member/searchId.jsp");
		List<HashMap> list = ms.searchId(name, phone);
		mav.addObject("list", list);
		return mav;
	}
	
	// 비밀번호 찾기
	@RequestMapping("/searchPw/{id}/{name}")
	@ResponseBody
	public boolean searchPw(@PathVariable(name="id")String id, @PathVariable(name="name")String name){
		return ms.searchPw(id, name);
	}
	
	// 내정보
	@RequestMapping("/info/{id}")
	public ModelAndView info(@PathVariable(name="id")String id){
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
		return mav;
	}
}
