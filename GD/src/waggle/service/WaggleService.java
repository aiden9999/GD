package waggle.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class WaggleService {
	@Autowired
	SqlSessionFactory fac;
	
	// ��λ�� ����Ʈ
	public List<HashMap> waggle(int page){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("waggle.waggle", (page-1)*10);
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
	
	// ��λ�� ���
	public boolean write(String id, String name, String waggle){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("waggle", waggle);
		try{
			ss.insert("waggle.write", map);
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

	// ��� ���
	public boolean reply(String id, String name, String reply, int num) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("reply", reply);
		map.put("num", num);
		try{
			ss.insert("waggle.reply", map);
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
	
	// ��� ����Ʈ
	public List<HashMap> replyList(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("waggle.replyList");
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
	
	// ���ٹ� ����
	public int waggleCount(){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("waggle.waggleCount");
		ss.close();
		return n;
	}
	
	// ���ٹ� ��� �� ����
	public void replyUp(int num){
		SqlSession ss = fac.openSession();
		ss.update("waggle.replyUp", num);
		ss.commit();
		ss.close();
	}
	
	// �˻� Ajax ���� ����Ʈ
	public List<HashMap> waggleAjax(String search, String word, int page){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("word", "%"+word+"%");
		map.put("page", (page-1)*10);
		List<HashMap> list = ss.selectList("waggle.waggleAjax"+search, map);
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
	
	// �˻� Ajax ���� ������
	public int searchPage(String search, String word){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("waggle.searchPage"+search, "%"+word+"%");
		ss.close();
		return n;
	}
}
