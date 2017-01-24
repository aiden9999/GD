package member.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
	
	// 아이디 중복체크
	public boolean idCheck(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.idCheck", id);
		ss.close();
		if(list.size()==0){
			return true;
		} else {
			return false;
		}
	}
	
	// 닉네임 중복체크
	public boolean nickCheck(String nick){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.nickCheck", nick);
		ss.close();
		if(list.size()==0){
			return true;
		} else {
			return false;
		}
	}
	
	// 일반 회원가입 완료
	public boolean joinN(String id, String name, String nick, String pw, String addr1, String addr2, String phone, String agreesms, String agreeemail, String email){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("pw", pw);
		map.put("nick", nick);
		map.put("phone", phone);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("agreesms", agreesms);
		map.put("agreeemail", agreeemail);
		map.put("email", email);
		try{
			ss.insert("member.joinN", map);
			ss.insert("member.joinId", id);
			ss.insert("member.joinNick", nick);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	// 학생 회원가입 완료
	public boolean joinS(String id, String name, String nick, String pw, String addr1, String addr2, String phone, String agreesms, String agreeemail,
										String schooladdr, String school, String grade, String type, String email){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("pw", pw);
		map.put("nick", nick);
		map.put("phone", phone);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("agreesms", agreesms);
		map.put("agreeemail", agreeemail);
		map.put("email", email);
		map.put("schooladdr", schooladdr);
		map.put("school", school);
		map.put("grade", grade);
		map.put("type", type);
		try{
			ss.insert("member.joinS", map);
			ss.insert("member.joinId", id);
			ss.insert("member.joinNick", nick);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	// 선생님 회원가입 완료
	public boolean joinT(String id, String name, String nick, String pw, String addr1, String addr2, String phone, String agreesms, String agreeemail,
										String schooladdr, String school, String subject, String type, String email, String etc, String target){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("pw", pw);
		map.put("nick", nick);
		map.put("phone", phone);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("agreesms", agreesms);
		map.put("agreeemail", agreeemail);
		map.put("email", email);
		map.put("schooladdr", schooladdr);
		map.put("school", school);
		map.put("subject", subject);
		map.put("type", type);
		map.put("etc", etc);
		map.put("target", target);
		try{
			ss.insert("member.joinT", map);
			ss.insert("member.joinId", id);
			ss.insert("member.joinNick", nick);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	// 아이디 찾기
	public List<HashMap> searchId(String name, String phone){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("phone", phone);
		List<HashMap> list = ss.selectList("member.searchIdS", map);
		if(list.size()!=0){
			ss.close();
			return list;
		} else {
			list = ss.selectList("member.searchIdN", map);
			if(list.size()!=0){
				ss.close();
				return list;
			} else {
				list = ss.selectList("member.searchIdP", map);
				if(list.size()!=0){
					ss.close();
					return list;
				} else {
					list = ss.selectList("member.searchIdT", map);
					if(list.size()!=0){
						ss.close();
						return list;
					} else {
						ss.close();
						return null;
					}
				}
			}
		}
	}
	
	// 비밀번호 찾기
	public boolean searchPw(String id, String name){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		List<HashMap> list = ss.selectList("member.searchPwS", map);
		if(list.size()!=0){
			return true;
		} else {
			list = ss.selectList("member.searchPwN", map);
			if(list.size()!=0){
				return true;
			} else {
				list = ss.selectList("member.searchPwP", map);
				if(list.size()!=0){
					return true;
				} else {
					list = ss.selectList("member.searchPwT", map);
					if(list.size()!=0){
						return true;
					} else {
						return false;
					}
				}
			}
		}
	}
}
