package member.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import member.service.*;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	MemberService ms;
	
	// 회원가입 1.실명확인 및 약관동의
	@RequestMapping("/{type}")
	public String join(@PathVariable(name="type")String type){
		switch(type){
		case "student":
			return "/member/joinS.jsp";
		case "parent":
			return "/member/joinP.jsp";
		case "normal":
			return "/member/joinN.jsp";
		case "teacher":
			return "/member/joinT.jsp";
		default:
			return "/";
		}
	}
	
	// 회원가입 2.정보작성
	@RequestMapping("/{type}/2")
	public String join2(@PathVariable(name="type")String type){
		switch(type){
		case "student":
			return "/member/joinS2.jsp";
		case "parent":
			return "/member/joinP2.jsp";
		case "normal":
			return "/member/joinN2.jsp";
		case "teacher":
			return "/member/joinT2.jsp";
		default:
			return "/";
		}
	}
	
	// 아이디 중복체크
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public boolean idCheck(@PathVariable(name="id")String id){
		return ms.idCheck(id);
	}
	
	// 닉네임 중복체크
	@RequestMapping("/nickCheck/{nick}")
	@ResponseBody
	public boolean nickCheck(@PathVariable(name="nick")String nick){
		return ms.nickCheck(nick);
	}
	
	// 일반 가입 저장
	@RequestMapping("/normal/{id}/{name}/{nick}/{pw}/{addr1}/{addr2}/{phone}/{agreesms}/{agreeemail}")
	@ResponseBody
	public boolean joinN(@PathVariable(name="id")String id, @PathVariable(name="name")String name,
											@PathVariable(name="nick")String nick, @PathVariable(name="pw")String pw, @PathVariable(name="addr1")String addr1,
											@PathVariable(name="addr2")String addr2, @PathVariable(name="phone")String phone, @PathVariable(name="agreesms")String agreesms,
											@PathVariable(name="agreeemail")String agreeemail, @RequestParam(name="email")String email){
		return ms.joinN(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, email);
	}
	
	// 학생 가입 저장
	@RequestMapping("/student/{id}/{name}/{nick}/{pw}/{addr1}/{addr2}/{phone}/{agreesms}/{agreeemail}/{schooladdr}/{school}/{grade}/{type}")
	@ResponseBody
	public boolean joinS(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="pw")String pw,
										@PathVariable(name="nick")String nick, @PathVariable(name="addr1")String addr1, @PathVariable(name="addr2") String addr2,
										@PathVariable(name="phone")String phone, @PathVariable(name="agreesms")String agreesms, @PathVariable(name="agreeemail")String agreeemail,
										@PathVariable(name="schooladdr")String schooladdr, @PathVariable(name="school")String school, @PathVariable(name="grade")String grade,
										@PathVariable(name="type")String type, @RequestParam(name="email")String email){
		return ms.joinS(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, schooladdr, school, grade, type, email);
	}
	
	// 선생님 가입 저장
	@RequestMapping("/teacher/{id}/{name}/{nick}/{pw}/{addr1}/{addr2}/{phone}/{agreesms}/{agreeemail}/{schooladdr}/{school}/{type}/{target}")
	@ResponseBody
	public boolean joinT(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="pw")String pw,
										@PathVariable(name="nick")String nick, @PathVariable(name="addr1")String addr1, @PathVariable(name="addr2") String addr2,
										@PathVariable(name="phone")String phone, @PathVariable(name="agreesms")String agreesms, @PathVariable(name="agreeemail")String agreeemail,
										@PathVariable(name="schooladdr")String schooladdr, @PathVariable(name="school")String school, @RequestParam(name="subject")String subject,
										@PathVariable(name="type")String type, @RequestParam(name="etc")String etc, @PathVariable(name="target")String target, @RequestParam(name="email")String email){
		return ms.joinT(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, schooladdr, school, subject, type, email, etc, target);
	}
}
