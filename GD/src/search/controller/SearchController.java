package search.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;
import search.service.*;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	SearchService ss;
	@Autowired
	MainService ms;
	
	// �˻� �п� ������ �̵�
	@RequestMapping("/acaPage/{search}/{page}")
	public ModelAndView acaPage(@PathVariable(name="search")String search, @PathVariable(name="page")int num){
		ModelAndView mav = new ModelAndView("/main/acaAjax.jsp");
		List<HashMap> list = ms.academy(search, num);
		mav.addObject("academy", list);
		int acaPage = ms.academyPage(search);
		mav.addObject("acaPage", acaPage);
		mav.addObject("selectPage", num);
		int start = 1+(int)((acaPage-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>acaPage ? acaPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// �˻� �Խ��� ������ �̵�
	@RequestMapping("/boardList/{search}/{page}/{type}")
	public ModelAndView boardList(@PathVariable(name="search")String search, @PathVariable(name="page")int num,
														@PathVariable(name="type")String type){
		ModelAndView mav = new ModelAndView("/main/boardListAjax.jsp");
		List<HashMap> list = ss.boardList(search, num, type);
		mav.addObject("list", list);
		int listPage = ss.boardPage(search, type);
		listPage = listPage%5==0 ? listPage/5 : listPage/5+1;
		mav.addObject("listPage", listPage);
		mav.addObject("selectPage", num);
		int start = 1+(int)((listPage-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>listPage ? listPage : start+9;
		mav.addObject("end", end);
		mav.addObject("selectPage", num);
		String board = "";
		switch(type){
		case "notice":
			board = "��������";
			break;
		case "highExam":
			board = "����Խ�";
			break;
		case "univExam":
			board = "�����Խ�";
			break;
		case "worry":
			board = "��λ��";
			break;
		case "waggle":
			board = "���ٹ�";
			break;
		case "acaNews":
			board = "�п��ҽ�";
			break;
		case "acaComment":
			board = "������";
			break;
		}
		mav.addObject("type", board);
		return mav;
	}
	
	// �˻� �Խ��� ������
//	@RequestMapping("/boardPage/{search}/{page}/{type}")
//	public ModelAndView boardPage(@PathVariable(name="search")String search, @PathVariable(name="page")int num,
//														@PathVariable(name="type")String type){
//		ModelAndView mav = new ModelAndView("/main/boardPageAjax.jsp");
//		int listPage = ss.boardPage(search, type);
//		listPage = listPage%5==0 ? listPage/5 : listPage/5+1;
//		mav.addObject("listPage", listPage);
//		mav.addObject("selectPage", num);
//		int start = 1+(int)((listPage-1)/5)*5;
//		mav.addObject("start", start);
//		int end = start+9>listPage ? listPage : start+9;
//		mav.addObject("end", end);
//		return mav;
//	}
	
	// �˻� �Խ��� ����
	@RequestMapping("/boardChange/{board}/{word}/{page}")
	public ModelAndView boardChange(@PathVariable(name="board")String board, @PathVariable(name="word")String word,
															@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/main/boardListAjax.jsp");
		List<HashMap> boardList = ss.boardList(word, page, board);
		mav.addObject("boardList", boardList);
		return mav;
	}
	
	// �˻� �Խ��� ������
	@RequestMapping("/boardPage/{board}/{word}/{page}")
	public ModelAndView boardPage(@PathVariable(name="board")String board, @PathVariable(name="word")String word,
														@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/main/boardPageAjax.jsp");
		int boardPage = ss.boardPage(word, board);
		boardPage = boardPage%5==0 ? boardPage/5 : boardPage/5+1; 
		mav.addObject("boardPage", boardPage);
		mav.addObject("selectPage", page);
		int start = 1+(int)((page-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>boardPage ? boardPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// �˻� �Խ��� ������ ��
	@RequestMapping("/boardP/{board}/{word}/{page}")
	@ResponseBody
	public int boardP(@PathVariable(name="board")String board, @PathVariable(name="word")String word,
								@PathVariable(name="page")int page){
		int boardP = ss.boardPage(word, board);
		boardP = boardP%5==0 ? boardP/5 : boardP/5+1;
		return boardP;
	}
}
