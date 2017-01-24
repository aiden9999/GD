package member.controller;

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
}
