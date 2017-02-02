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
	
	// ������ �����ֱ� �� ����
	@RequestMapping("/giveAdmin/{id}/{what}/{grade}")
	@ResponseBody
	public boolean giveAdmin(@PathVariable(name="id")String id, @PathVariable(name="what")String what, @PathVariable(name="grade")String grade){
		return ad.giveAdmin(id, what, grade);
	}
	
	// ������ ���ѻ��� �� ����
	@RequestMapping("/loseAdmin/{id}")
	@ResponseBody
	public boolean loseAdmin(@PathVariable(name="id")String id){
		return ad.loseAdmin(id);
	}
	
	// tab2 �۸��
	@RequestMapping("/board/{type}")
	public ModelAndView board(@PathVariable(name="type")String type){
		ModelAndView mav = new ModelAndView("/admin/tab2Ajax.jsp");
		List<HashMap> list = ad.board(type);
		mav.addObject("boardList", list);
		return mav;
	}
	
	// tab2 �� �󼼺���
	@RequestMapping("/boardDetail/{board}/{title}")
	@ResponseBody
	public List<HashMap> boardDetail(@PathVariable(name="board")String board, @PathVariable(name="title")String title){
		return ad.boardDetail(board, title);
	}
	
	// tab2 �� �̵�
	@RequestMapping("/boardDelete/{nowBoard}/{title}/{writer}/{content}")
	@ResponseBody
	public boolean boardMove(@PathVariable(name="nowBoard")String nowBoard, @PathVariable(name="title")String title, 
												@PathVariable(name="writer")String writer, @PathVariable(name="content")String content){
		return ad.boardMove(nowBoard, title, writer, content);
	}
	
	// �п� ���
	@RequestMapping("/regist")
	public String regist(){
		return "/admin/regist.jsp";
	}
}
