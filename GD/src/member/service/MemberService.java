package member.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
	
	// ���̵� �ߺ�üũ
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
	
	// �г��� �ߺ�üũ
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
	
	// �Ϲ� ȸ������ �Ϸ�
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
}
