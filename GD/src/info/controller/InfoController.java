package info.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import info.service.*;

@Controller
@RequestMapping("/info")
public class InfoController {
	@Autowired
	InfoService is;
	
	// Á¤º¸º¯°æ
	@RequestMapping("/modify/{id}/{nick}/{addr1}/{addr2}/{phone}/{email}/{agreeSms}/{agreeEmail}")
	@ResponseBody
	public boolean modify(@PathVariable(name="id")String id, @PathVariable(name="nick")String nick, @PathVariable(name="addr1")String addr1,
										@PathVariable(name="addr2")String addr2, @PathVariable(name="phone")String phone,
										@PathVariable(name="email")String email, @PathVariable(name="agreeSms")String agreeSms,
										@PathVariable(name="agreeEmail")String agreeEmail, HttpSession session){
		return is.modify(id, nick, addr1, addr2, phone, email, agreeSms, agreeEmail, session);
	}
	
	// Á¤º¸º¯°æ, ºñ¹Ð¹øÈ£ º¯°æ
	@RequestMapping("/modify2/{id}/{nick}/{addr1}/{addr2}/{phone}/{email}/{agreeSms}/{agreeEmail}/{pw}")
	@ResponseBody
	public boolean modify2(@PathVariable(name="id")String id, @PathVariable(name="nick")String nick, @PathVariable(name="addr1")String addr1,
										@PathVariable(name="addr2")String addr2, @PathVariable(name="phone")String phone,
										@PathVariable(name="email")String email, @PathVariable(name="agreeSms")String agreeSms,
										@PathVariable(name="agreeEmail")String agreeEmail, @PathVariable(name="pw")String pw, 
										HttpSession session){
		return is.modify2(id, nick, addr1, addr2, phone, email, agreeSms, agreeEmail, session, pw);
	}
	
	// È¸¿øÅ»Åð
	@RequestMapping("/exit/{id}/{reason}/{etc}")
	@ResponseBody
	public boolean exit(@PathVariable(name="id")String id, @PathVariable(name="reason")String reason,
									@PathVariable(name="etc")String etc, HttpSession session){
		return is.exit(id, reason, etc, session);
	}
	
	// Å»Åð¿Ï·á ÆË¾÷
	@RequestMapping("/exit")
	public String exitEnd(){
		return "/member/exit.jsp";
	}
}
