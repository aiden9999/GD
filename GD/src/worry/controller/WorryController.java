package worry.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import worry.service.*;

@Controller
@RequestMapping("/worry")
public class WorryController {
	@Autowired
	WorryService ws;
	
	// 등록
	@RequestMapping("/write/{id}/{name}/{worry}")
	@ResponseBody
	public boolean write(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="worry")String worry){
		return ws.write(id, name, worry);
	}
	
	// 댓글등록
	@RequestMapping("/reply/{id}/{name}/{reply}/{num}")
	@ResponseBody
	public boolean reply(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="reply")String reply,
										@PathVariable(name="num")int num){
		boolean b = ws.reply(id, name, reply, num);
		if(b){
			ws.replyUp(num);
		}
		return b;
	}
	
	// 검색 Ajax 및 검색 페이징처리
	@RequestMapping("/search/{search}/{word}/{page}")
	public ModelAndView sesarch(@PathVariable(name="search")String search, @PathVariable(name="word")String word,
													@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/menu/community/worry/worryAjax.jsp");
		List<HashMap> worryList = ws.worryAjax(search, word, page);
		mav.addObject("worryList", worryList);
		List<HashMap> replyList = ws.replyList();
		mav.addObject("replyList", replyList);
		int worryPage = ws.searchPage(search, word)%10==0 ? ws.searchPage(search, word)/10 : ws.searchPage(search, word)/10+1;
		mav.addObject("worryPage", worryPage);
		mav.addObject("search", search);
		mav.addObject("word", word);
		mav.addObject("selectPage", page);
		int start = 1+(int)((page-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>worryPage ? worryPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// 기본 페이징처리
	@RequestMapping("/page/{page}")
	public ModelAndView page(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/menu/community/worry/worryPage.jsp");
		List<HashMap> worryList = ws.worry(page);
		mav.addObject("worryList", worryList);
		List<HashMap> replyList = ws.replyList();
		mav.addObject("replyList", replyList);
		int worryPage = ws.worryCount()%10==0 ? ws.worryCount()/10 : ws.worryCount()/10+1;
		mav.addObject("worryPage", worryPage);
		mav.addObject("selectPage", page);
		int start = 1+(int)((page-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>worryPage ? worryPage : start+9;
		mav.addObject("end", end);
		return mav;
	}
}
