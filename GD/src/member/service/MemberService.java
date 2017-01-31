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
	
	// 학부모 회원가입 완료
	public boolean joinP(String id, String name, String nick, String pw, String addr1, String addr2, String phone, String agreesms, String agreeemail,
										String child1, String _1schoolAddr, String _1schoolGrade, String _1school, String _1acaAddr1, String _1academy1,
										String _1teacher1, String _1acaAddr2, String _1academy2, String _1teacher2, String child2, String _2schoolAddr,
										String _2schoolGrade, String _2school, String _2acaAddr1, String _2academy1, String _2teacher1, String _2acaAddr2,
										String _2academy2, String _2teacher2, String child3, String _3schoolAddr, String _3schoolGrade, String _3school,
										String _3acaAddr1, String _3academy1, String _3teacher1, String _3acaAddr2, String _3academy2, String _3teacher2,
										String review, String email){
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
		map.put("child1", child1);
		map.put("1schoolAddr", _1schoolAddr);
		map.put("1schoolGrade", _1schoolGrade);
		map.put("1school", _1school);
		map.put("1acaAddr1", _1acaAddr1);
		map.put("1academy1", _1academy1);
		map.put("1teacher1", _1teacher1);
		map.put("1acaAddr2", _1acaAddr2);
		map.put("1academy2", _1academy2);
		map.put("1teacher2", _1teacher2);
		map.put("child2", child2);
		map.put("2schoolAddr", _2schoolAddr);
		map.put("2schoolGrade", _2schoolGrade);
		map.put("2school", _2school);
		map.put("2acaAddr1", _2acaAddr1);
		map.put("2academy1", _2academy1);
		map.put("2teacher1", _2teacher1);
		map.put("2acaAddr2", _2acaAddr2);
		map.put("2academy2", _2academy2);
		map.put("2teacher2", _2teacher2);
		map.put("child3", child3);
		map.put("3schoolAddr", _3schoolAddr);
		map.put("3schoolGrade", _3schoolGrade);
		map.put("3school", _3school);
		map.put("3acaAddr1", _3acaAddr1);
		map.put("3academy1", _3academy1);
		map.put("3teacher1", _3teacher1);
		map.put("3acaAddr2", _3acaAddr2);
		map.put("3academy2", _3academy2);
		map.put("3teacher2", _3teacher2);
		map.put("review", review);
		try{
			ss.insert("member.joinP", map);
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

	// 방문기록
	public List<HashMap> visit(String id) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.visitList", id);
		ss.close();
		return list;
	}
}
