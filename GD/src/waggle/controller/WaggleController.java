package waggle.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import waggle.service.*;

@Controller
@RequestMapping("/waggle")
public class WaggleController {
	@Autowired
	WaggleService ws;
	
	// 등록
	@RequestMapping("/write/{id}/{name}/{waggle}")
	@ResponseBody
	public boolean write(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="waggle")String waggle){
		return ws.write(id, name, waggle);
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
		ModelAndView mav = new ModelAndView("/menu/community/waggle/waggleAjax.jsp");
		List<HashMap> waggleList = ws.waggleAjax(search, word, page);
		mav.addObject("waggleList", waggleList);
		List<HashMap> replyList = ws.replyList();
		mav.addObject("replyList", replyList);
		int wagglePage = ws.searchPage(search, word)%10==0 ? ws.searchPage(search, word)/10 : ws.searchPage(search, word)/10+1;
		mav.addObject("wagglePage", wagglePage);
		mav.addObject("search", search);
		mav.addObject("word", word);
		return mav;
	}
	
	// 기본 페이징처리
	@RequestMapping("/page/{page}")
	public ModelAndView page(@PathVariable(name="page")int page){
		ModelAndView mav = new ModelAndView("/menu/community/waggle/wagglePage.jsp");
		List<HashMap> waggleList = ws.waggle(page);
		mav.addObject("waggleList", waggleList);
		List<HashMap> replyList = ws.replyList();
		mav.addObject("replyList", replyList);
		int wagglePage = ws.waggleCount()%10==0 ? ws.waggleCount()/10 : ws.waggleCount()/10+1;
		mav.addObject("wagglePage", wagglePage);
		return mav;
	}
}
