package univExam.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class UnivExamService {
	@Autowired
	SqlSessionFactory fac;
	
	// 대학입시 작성
	public boolean write(String title, String content, String id, String name) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		map.put("name", name);
		try{
			ss.insert("univExam.write", map);
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
	
	// 대학입시 리스트
	public List<HashMap> univExam(int page){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("univExam.univExam", (page-1)*10);
		for(int i=0; i<list.size(); i++){
			String id = (String)list.get(i).get("WRITER");
			HashMap li = ss.selectOne("member.searchMemberN", id);
			if(li==null){
				li = ss.selectOne("member.searchMemberS", id);
				if(li==null){
					li = ss.selectOne("member.searchMemberT", id);
					if(li==null){
						li = ss.selectOne("member.searchMemberP", id);
					}
				}
			}
			if(id.equals((String)li.get("ID"))){
				HashMap m = list.get(i);
				m.put("WRITER", li.get("NAME"));
				list.set(i, m);
			}
		}
		ss.close();
		return list;
	}
	
	// 대학입시 갯수
	public int univCount(){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("univExam.count");
		ss.close();
		return n;
	}

	// 대학입시 상세보기
	public List<HashMap> view(int num) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("univExam.view", num);
		ss.close();
		return list;
	}

	// 대학입시 수정
	public boolean modify(int num, String title, String content) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		int n = ss.update("univExam.modify", map);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 대학입시 삭제
	public boolean delete(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("univExam.delete", num);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
