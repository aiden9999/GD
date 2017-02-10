package search.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class SearchService {
	@Autowired
	SqlSessionFactory fac;

	// 검색 게시판 리스트
	public List<HashMap> boardList(String search, int num, String type) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("search", "%"+search+"%");
		map.put("page", (num-1)*5);
		List<HashMap> list = ss.selectList("search.search"+type, map);
		ss.close();
		return list;
	}
	
	// 검색 게시판 페이지
	public int boardPage(String search, String type){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("search."+type+"Page", "%"+search+"%");
		ss.close();
		return n;
	}
//
//	// 검색 게시판 갯수
//	public int boardCount() {
//		SqlSession ss = fac.openSession();
//		int n = ss.selectOne("highExam.count");
//		ss.close();
//		return n;
//	}
}
