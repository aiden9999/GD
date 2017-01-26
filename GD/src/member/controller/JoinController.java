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
	
	// 학부모 가입 저장
	@RequestMapping("/parent/{id}/{name}/{nick}/{pw}/{addr1}/{addr2}/{phone}/{agreesms}/{agreeemail}/{child1}/{1schoolAddr}/"
								+ "{1schoolGrade}/{1school}/{1acaAddr1}/{1academy1}/{1teacher1}/{1acaAddr2}/{1academy2}/{1teacher2}/"
								+ "{child2}/{2schoolAddr}/{2schoolGrade}/{2school}/{2acaAddr1}/{2academy1}/{2teacher1}/{2acaAddr2}/"
								+ "{2academy2}/{2teacher2}/{child3}/{3schoolAddr}/{3schoolGrade}/{3school}/{3acaAddr1}/{3academy1}/"
								+ "{3teacher1}/{3acaAddr2}/{3academy2}/{3teacher2}/{review}")
	@ResponseBody
	public boolean joinP(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="pw")String pw,
			@PathVariable(name="nick")String nick, @PathVariable(name="addr1")String addr1, @PathVariable(name="addr2") String addr2,
			@PathVariable(name="phone")String phone, @PathVariable(name="agreesms")String agreesms, @PathVariable(name="agreeemail")String agreeemail,
			@PathVariable(name="child1")String child1, @PathVariable(name="1schoolAddr")String _1schoolAddr,
			@PathVariable(name="1schoolGrade")String _1schoolGrade, @PathVariable(name="1school")String _1school,
			@PathVariable(name="1acaAddr1")String _1acaAddr1, @PathVariable(name="1academy1")String _1academy1,
			@PathVariable(name="1teacher1")String _1teacher1, @PathVariable(name="1acaAddr2")String _1acaAddr2,
			@PathVariable(name="1academy2")String _1academy2, @PathVariable(name="1teacher2")String _1teacher2,
			@PathVariable(name="child2")String child2, @PathVariable(name="2schoolAddr")String _2schoolAddr,
			@PathVariable(name="2schoolGrade")String _2schoolGrade, @PathVariable(name="2school")String _2school,
			@PathVariable(name="2acaAddr1")String _2acaAddr1, @PathVariable(name="2academy1")String _2academy1,
			@PathVariable(name="2teacher1")String _2teacher1, @PathVariable(name="2acaAddr2")String _2acaAddr2,
			@PathVariable(name="2academy2")String _2academy2, @PathVariable(name="2teacher2")String _2teacher2,
			@PathVariable(name="child3")String child3, @PathVariable(name="3schoolAddr")String _3schoolAddr,
			@PathVariable(name="3schoolGrade")String _3schoolGrade, @PathVariable(name="3school")String _3school,
			@PathVariable(name="3acaAddr1")String _3acaAddr1, @PathVariable(name="3academy1")String _3academy1,
			@PathVariable(name="3teacher1")String _3teacher1, @PathVariable(name="3acaAddr2")String _3acaAddr2,
			@PathVariable(name="3academy2")String _3academy2, @PathVariable(name="3teacher2")String _3teacher2,
			@PathVariable(name="review")String review, @RequestParam(name="email")String email){
		return ms.joinP(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, child1, _1schoolAddr, _1schoolGrade,
								_1school, _1acaAddr1, _1academy1, _1teacher1, _1acaAddr2, _1academy2, _1teacher2, child2, _2schoolAddr,
								_2schoolGrade, _2school, _2acaAddr1, _2academy1, _2teacher1, _2acaAddr2, _2academy2, _2teacher2, child3,
								_3schoolAddr, _3schoolGrade, _3school, _3acaAddr1, _3academy1, _3teacher1, _3acaAddr2, _3academy2, _3teacher2,
								review, email);
	}
}
