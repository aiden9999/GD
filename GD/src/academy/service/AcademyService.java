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
		List<HashMap> list = ss.selectList("academy.acanews", num);
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
//	public List<HashMap> reviewPage(int num, int page) {
	public List<HashMap> reviewPage(int num) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.reviewPage", num);
		ss.close();
		return list;
	}
	
	// Top 리뷰 리스트
	public List<HashMap> reviewTop(int num){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", 1);
		List<HashMap> list = ss.selectList("academy.reviewTop", map);
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
		String s = String.format("%.1f", point/(list.size()/1.0));
		return Double.parseDouble(s);
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
		List<HashMap> list = ss.selectList("academy.reviewAll", num);
		ss.close();
		return list.size();
	}
}
