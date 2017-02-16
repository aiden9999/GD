package academy.service;

import java.util.*;

import javax.servlet.http.*;

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
			String point, String writer, String name) {
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
		map.put("name", name);
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
	public List<HashMap> commentList(int num, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", (page-1)*5);
		List<HashMap> list = ss.selectList("academy.commentList", map);
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String id = (String)m.get("ID");
			String id1 = id.substring(0, id.length()/2);
			String id2 = id.substring(id.length()/2);
			for(int j=0; j<id2.length(); j++){
				id1 += "*";
			}
			m.put("ID", id1);
			m.put("WRITER", id);
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// 한줄평가 전체 리스트
	public List<HashMap> commentAll(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.commentAll", num);
		ss.close();
		return list;
	}
	
	// 한줄평가 페이지
	public int commentPage(int num){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("academy.commentPage", num);
		ss.close();
		return n;
	}
	
	// 학원소식 저장
	public boolean saveNews(String writer, String name, String title, String content, int acaNum) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("writer", writer);
		map.put("name", name);
		map.put("title", title);
		map.put("content", content);
		map.put("acaNum", acaNum);
		try{
			ss.insert("academy.saveNews", map);
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
	
	// 리뷰 포인트 업데이트
	public void updatePoint(int num, String point){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		HashMap academy = ss.selectOne("academy.academy", num);
		float total = (float)academy.get("POINT")*(int)academy.get("PEOPLE");
		total += Integer.parseInt(point);
		double d = Double.parseDouble(String.format("%.1f", total/((int)academy.get("PEOPLE")+1/1.0)));
		map.put("point", d);
		ss.update("academy.reviewUp", map);
		ss.commit();
		ss.close();
	}
	
	// 학원 총 포인트 업데이트
	public void updateAcademy(int num, String point) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		HashMap academy = ss.selectOne("academy.academy", num);
		float total = (float)academy.get("TOTAL")*(int)academy.get("PEOPLE");
		total += Integer.parseInt(point);
		peopleUp(num);
		float count = (float)((int)academy.get("COUNT")/100.0);
		float search = (float)((int)academy.get("SEARCH")/100.0);
		double d = Double.parseDouble(String.format("%.2f", total/((int)academy.get("PEOPLE")+1/1.0)+count+search));
		map.put("total", d);
		ss.update("academy.updatePoint", map);
		ss.commit();
		ss.close();
	}

	// 한줄평가 등록 후 댓글갯수 증가
	public void replyUp(int num) {
		SqlSession ss = fac.openSession();
		ss.update("academy.replyUp", num);
		ss.commit();
		ss.close();
	}
	
	// 학원 리뷰 등 작성인원 증가
	public void peopleUp(int num){
		SqlSession ss = fac.openSession();
		ss.update("academy.peopleUp", num);
		ss.commit();
		ss.close();
	}

	// 학원 조회수 증가 및 포인트 증가
	public void countUp(int num, HttpServletRequest req, HttpServletResponse resp) {
		Cookie[] ar = req.getCookies();
		int n = 0;
		if(ar.length>0){
			for(Cookie c : ar){
				if(c.getName().equals("acaCount"+num)){
					n++;
				}
			}
			if(n>0){
				return;
			} else {
				SqlSession ss = fac.openSession();
				ss.update("academy.countUp", num);
				ss.update("academy.searchTotalUp", num);
				ss.commit();
				ss.close();
				Cookie cookie = new Cookie("acaCount"+num, "acaCount"+num);
				cookie.setMaxAge(60*60);
				cookie.setPath("/");
				resp.addCookie(cookie);
			}
		} else {
			SqlSession ss = fac.openSession();
			ss.update("academy.countUp", num);
			ss.update("academy.searchTotalUp", num);
			ss.commit();
			ss.close();
			Cookie cookie = new Cookie("acaCount"+num, "acaCount"+num);
			cookie.setMaxAge(60*60);
			cookie.setPath("/");
			resp.addCookie(cookie);
		}
	}

	// 리뷰 상세보기
	public HashMap reviewDetail(int auto) {
		SqlSession ss = fac.openSession();
		HashMap review = ss.selectOne("academy.reviewDetail", auto);
		String id = (String)review.get("WRITER");
		review.put("ID", id);
		String id1 = id.substring(0, id.length()/2);
		String id2 = id.substring(id.length()/2);
		for(int j=0; j<id2.length(); j++){
			id1 += "*";
		}
		review.put("WRITER", id1);
		ss.commit();
		ss.close();
		return review;
	}

	// 학원소식 상세보기
	public HashMap view(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("academy.newsView", num);
		ss.close();
		return map;
	}
	
	// 학원소식 삭제
	public boolean delete(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("academy.delete", num);
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

	// 한줄평가 수정
	public boolean commentModify(int num, String comment) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("comment", comment);
		int n = ss.update("academy.commentModify", map);
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
	
	// 한줄평가 삭제
	public boolean commentRemove(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("academy.commentRemove", num);
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
	
	// 학원 전체 리스트
	public List<HashMap> allAcademy(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.allAcademy");
		ss.close();
		return list;
	}
}
