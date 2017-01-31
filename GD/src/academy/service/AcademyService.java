package academy.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class AcademyService {
	@Autowired
	SqlSessionFactory fac;
	
	// 학원 정보
	public List<HashMap> academy(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.academy", num);
		ss.close();
		return list;
	}
	
	// 학원 소식 리스트
	public List<HashMap> acanews(int num, int page){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", (page-1)*10);
		List<HashMap> list = ss.selectList("academy.acanews", map);
		ss.close();
		int count = newsCount(num);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			m.put("rownum", count-1-i);
			list.set(i, m);
		}
		return list;
	}
	
	// 학원 소식 갯수
	public int newsCount(int num){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("academy.newsCount", num);
		ss.close();
		return n;
	}

	// 리뷰 작성
	public boolean review(int num, String day, String subject, String subject1, String className, String grade,
			String teacher, String type, String rate1, String rate2, String rate3, String rate4, String again,
			String point, String writer) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("num", num);
		map.put("day", day);
		map.put("subject", subject);
		map.put("subject1", subject1);
		map.put("className", className);
		map.put("grade", grade);
		map.put("teacher", teacher);
		map.put("type", type);
		map.put("rate1", rate1);
		map.put("rate2", rate2);
		map.put("rate3", rate3);
		map.put("rate4", rate4);
		map.put("again", again);
		map.put("point", point);
		map.put("writer", writer);
		try{
			ss.insert("academy.review", map);
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

	// 페이지 리뷰 리스트
	public List<HashMap> reviewPage(int num, int page) {
//	public List<HashMap> reviewPage(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", (page-1)*7);
		List<HashMap> list = ss.selectList("academy.reviewPage", map);
		ss.close();
		return list;
	}
	
	// Top 리뷰 리스트
	public List<HashMap> reviewTop(int num){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> list = ss.selectList("academy.reviewTop", num);
		ss.close();
		return list;
	}
	
	// 리뷰 평점
	public double rePoint(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.reviewAll", num);
		ss.close();
		int point = 0	;
		for(HashMap map : list){
			point += (int)map.get("POINT");
		}
		double s = Double.parseDouble(String.format("%.1f", point/(list.size()/1.0)));
		return s;
	}
	
	// 재등원 의사
	public int again(int num){
		SqlSession ss = fac.openSession();
		int again = ss.selectOne("academy.again", num);
		ss.close();
		int all = reviewAll(num);
		return (int)(((again/1.0)/all)*100);
	}
	
	// 전체리뷰 갯수
	public int reviewAll(int num){
		SqlSession ss = fac.openSession();
		int reviewCount= ss.selectOne("academy.reviewCount", num);
		ss.close();
		return reviewCount;
	}

	// 한줄평가 등록
	public boolean comment(String id, String name, String point, int num, String comment) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("point", point);
		map.put("num", num);
		map.put("comment", comment);
		try{
			ss.insert("academy.comment", map);
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

	// 한줄평가 리스트
	public List<HashMap> commentList(int num) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.commentList", num);
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
}
