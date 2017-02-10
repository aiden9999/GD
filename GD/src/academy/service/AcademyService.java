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
	
	// �п� ����
	public List<HashMap> academy(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.academy", num);
		ss.close();
		return list;
	}
	
	// �п� �ҽ� ����Ʈ
	public List<HashMap> acanews(int num, int page){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", (page-1)*10);
		List<HashMap> list = ss.selectList("academy.acanews", map);
		ss.close();
		return list;
	}
	
	// �п� �ҽ� ����
	public int newsCount(int num){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("academy.newsCount", num);
		ss.close();
		return n;
	}

	// ���� �ۼ�
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

	// ������ ���� ����Ʈ
	public List<HashMap> reviewPage(int num, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("page", (page-1)*7);
		List<HashMap> list = ss.selectList("academy.reviewPage", map);
		ss.close();
		return list;
	}
	
	// Top ���� ����Ʈ
	public List<HashMap> reviewTop(int num){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> list = ss.selectList("academy.reviewTop", num);
		ss.close();
		return list;
	}
	
	// ���� ����
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
	
	// ���� �ǻ�
	public int again(int num){
		SqlSession ss = fac.openSession();
		int again = ss.selectOne("academy.again", num);
		ss.close();
		int all = reviewAll(num);
		return (int)(((again/1.0)/all)*100);
	}
	
	// ��ü���� ����
	public int reviewAll(int num){
		SqlSession ss = fac.openSession();
		int reviewCount= ss.selectOne("academy.reviewCount", num);
		ss.close();
		return reviewCount;
	}

	// ������ ���
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

	// ������ ����Ʈ
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
			list.set(i, m);
		}
		ss.close();
		return list;
	}
	
	// ������ ��ü ����Ʈ
	public List<HashMap> commentAll(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("academy.commentAll", num);
		ss.close();
		return list;
	}
	
	// ������ ������
	public int commentPage(int num){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("academy.commentPage", num);
		ss.close();
		return n;
	}
	
	// �п��ҽ� ����
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
	
	// ���� ����Ʈ ������Ʈ
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
	
	// �п� �� ����Ʈ ������Ʈ
	public void updateAcademy(int num, String point) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		HashMap academy = ss.selectOne("academy.academy", num);
		float total = (float)academy.get("TOTAL")*(int)academy.get("PEOPLE");
		total += Integer.parseInt(point);
		peopleUp(num);
		double d = Double.parseDouble(String.format("%.1f", total/((int)academy.get("PEOPLE")+1/1.0)));
		map.put("total", d);
		ss.update("academy.updatePoint", map);
		ss.commit();
		ss.close();
	}

	// ������ ��� �� ��۰��� ����
	public void replyUp(int num) {
		SqlSession ss = fac.openSession();
		ss.update("academy.replyUp", num);
		ss.commit();
		ss.close();
	}
	
	// �п� ���� �� �ۼ��ο� ����
	public void peopleUp(int num){
		SqlSession ss = fac.openSession();
		ss.update("academy.peopleUp", num);
		ss.commit();
		ss.close();
	}

	// �п� ��ȸ�� ����
	public void countUp(int num, HttpServletRequest req, HttpServletResponse resp) {
		Cookie[] ar = req.getCookies();
		int n = 0;
		if(ar.length>0){
			for(Cookie c : ar){
				if(c.getName().equals(""+num)){
					n++;
				}
			}
			if(n>0){
				return;
			} else {
				SqlSession ss = fac.openSession();
				ss.update("academy.countUp", num);
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
			ss.commit();
			ss.close();
			Cookie cookie = new Cookie("acaCount"+num, "acaCount"+num);
			cookie.setMaxAge(60*60);
			cookie.setPath("/");
			resp.addCookie(cookie);
		}
	}

	// ���� �󼼺���
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

	// �п��ҽ� �󼼺���
	public HashMap view(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("academy.newsView", num);
		ss.close();
		return map;
	}
	
	// �п��ҽ� ����
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
}
