package member.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import member.service.*;

@Controller
@RequestMapping("/join")
public class MemberController {
	@Autowired
	MemberService ms;
	
	// ȸ������ 1.�Ǹ�Ȯ�� �� �������
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
	
	// ȸ������ 2.�����ۼ�
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
	
	// ���̵� �ߺ�üũ
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public boolean idCheck(@PathVariable(name="id")String id){
		return ms.idCheck(id);
	}
	
	// �г��� �ߺ�üũ
	@RequestMapping("/nickCheck/{nick}")
	@ResponseBody
	public boolean nickCheck(@PathVariable(name="nick")String nick){
		return ms.nickCheck(nick);
	}
	
	// ���� ����
	@RequestMapping("/{type}/{id}/{name}/{nick}/{pw}/{addr1}/{addr2}/{phone}/{agreesms}/{agreeemail}")
	@ResponseBody
	public boolean joinFinish(@PathVariable(name="type")String type, @PathVariable(name="id")String id, @PathVariable(name="name")String name,
											@PathVariable(name="nick")String nick, @PathVariable(name="pw")String pw, @PathVariable(name="addr1")String addr1,
											@PathVariable(name="addr2")String addr2, @PathVariable(name="phone")String phone, @PathVariable(name="agreesms")String agreesms,
											@PathVariable(name="agreeemail")String agreeemail, @RequestParam(name="email")String email){
		switch(type){
		case "normal":
			return ms.joinN(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, email);
		case "student":
//			ms.joinS(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, email);
			return true;
		case "parent":
//			ms.joinP(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, email);
			return true;
		case "teacher":
//			ms.joinT(id, name, nick, pw, addr1, addr2, phone, agreesms, agreeemail, email);
			return true;
		default:
			return false;
		}
	}
}
