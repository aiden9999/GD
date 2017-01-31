package worry.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class WorryService {
	@Autowired
	SqlSessionFactory fac;
	
	// °í¹Î»ó´ã ¸®½ºÆ®
	public List<HashMap> worry(int page){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("worry.worry", (page-1)*10);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String id = (String)m.get("WRITER");
			String id1 = id.substring(0, id.length()/2);
			String id2 = id.substring(id.length()/2);
			for(int j=0; j<id2.length(); j++){
				id1 += "*";
			}
			m.put("WRITER", id1);
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// °í¹Î»ó´ã µî·Ï
	public boolean write(String id, String name, String worry){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("worry", worry);
		try{
			ss.insert("worry.write", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// ´ñ±Û µî·Ï
	public boolean reply(String id, String name, String reply, int num) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("reply", reply);
		map.put("num", num);
		try{
			ss.insert("worry.reply", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// ´ñ±Û ¸®½ºÆ®
	public List<HashMap> replyList(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("worry.replyList");
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String id = (String)m.get("ID");
			String id1 = id.substring(0, id.length()/2);
			String id2 = id.substring(id.length()/2);
			for(int j=0; j<id2.length(); j++){
				id1 += "*";
			}
			m.put("ID", id1);
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// °í¹Î»ó´ã °¹¼ö
	public int worryCount(){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("worry.worryCount");
		ss.close();
		return n;
	}
}
