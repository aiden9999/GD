package info.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class InfoService {
	@Autowired
	SqlSessionFactory fac;

	// 정보변경
	public boolean modify(String id, String nick, String addr1, String addr2, String phone, String email,
			String agreeSms, String agreeEmail, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("nick", nick);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("phone", phone);
		map.put("email", email);
		map.put("agreeSms", agreeSms);
		map.put("agreeEmail", agreeEmail);
		String type = (String)session.getAttribute("type");
		String sql = "info.modify";
		String s = "";
		switch(type){
		case "학생":
			s = "S";
			break;
		case "일반":
			s = "N";
			break;
		case "선생님":
			s = "T";
			break;
		case "부모님":
			s = "P";
			break;
		}
		int n = ss.update(sql+s, map);
		if(n>0){
			ss.commit();
			HashMap login = ss.selectOne("member.searchMember"+s, id);
			login.put("email1", login.get("EMAIL").toString().substring(0, login.get("EMAIL").toString().indexOf('@')));
			login.put("email2", login.get("EMAIL").toString().substring(login.get("EMAIL").toString().indexOf('@')+1));
			session.setAttribute("login", login);
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 정보변경, 비밀번호 변경
	public boolean modify2(String id, String nick, String addr1, String addr2, String phone, String email,
			String agreeSms, String agreeEmail, HttpSession session, String pw) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("nick", nick);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("phone", phone);
		map.put("email", email);
		map.put("agreeSms", agreeSms);
		map.put("agreeEmail", agreeEmail);
		map.put("pw", pw);
		String type = (String)session.getAttribute("type");
		String sql = "info.modify2";
		String s = "";
		switch(type){
		case "학생":
			s = "S";
			break;
		case "일반":
			s = "N";
			break;
		case "선생님":
			s = "T";
			break;
		case "부모님":
			s = "P";
			break;
		}
		int n = ss.update(sql+s, map);
		if(n>0){
			ss.commit();
			HashMap login = ss.selectOne("member.searchMember"+s, id);
			login.put("email1", login.get("EMAIL").toString().substring(0, login.get("EMAIL").toString().indexOf('@')));
			login.put("email2", login.get("EMAIL").toString().substring(login.get("EMAIL").toString().indexOf('@')+1));
			session.setAttribute("login", login);
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 회원탈퇴
	public boolean exit(String id, String reason, String etc, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("reason", reason);
		map.put("etc", etc);
		String type = (String)session.getAttribute("type");
		String sql = "info.exit";
		String s = "";
		switch(type){
		case "학생":
			s = "S";
			break;
		case "일반":
			s = "N";
			break;
		case "선생님":
			s = "T";
			break;
		case "부모님":
			s = "P";
			break;
		}
		int n = ss.delete(sql+s, map);
		if(n>0){
			try{
				ss.insert("info.exitList", map);
				ss.commit();
				ss.close();
				return true;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return false;
			}
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
