package search.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class SearchService {
	@Autowired
	SqlSessionFactory fac;

	// �˻� �Խ��� ����Ʈ
	public List<HashMap> boardList(String search, int num, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("search", "%"+search+"%");
		map.put("page", (num-1)*5);
		List<HashMap> list = ss.selectList("search.search"+type, map);
		ss.close();
		return list;
	}
	
	// �˻� �Խ��� ������
	public int boardPage(String search, String type){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("search."+type+"Page", "%"+search+"%");
		ss.close();
		return n;
	}
//
//	// �˻� �Խ��� ����
//	public int boardCount() {
//		SqlSession ss = fac.openSession();
//		int n = ss.selectOne("highExam.count");
//		ss.close();
//		return n;
//	}
}
