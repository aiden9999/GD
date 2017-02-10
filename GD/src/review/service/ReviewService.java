package review.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ReviewService {
	@Autowired
	SqlSessionFactory fac;
	
	// ¸®ºä ´ñ±Û ¸®½ºÆ®
	public List<HashMap> replyList(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("review.replyList", num);
		ss.close();
		for(int i=0; i<list.size(); i++){
			HashMap m = list.get(i);
			String id = (String)m.get("ID");
			m.put("id", id);
			String id1 = id.substring(0, id.length()/2);
			String id2 = id.substring(id.length()/2);
			for(int j=0; j<id2.length(); j++){
				id1 += "*";
			}
			m.put("ID", id1);
			list.set(i, m);
		}
		return list;
	}
	
	// ¸®ºä ÃßÃµ
	public boolean recomend(int num, HttpServletRequest req, HttpServletResponse resp){
		SqlSession ss = fac.openSession();
		Cookie[] ar = req.getCookies();
		int n = 0;
		if(ar.length>0){
			for(Cookie c : ar){
				if(c.getName().equals("reviewRec"+num)){
					n++;
				}
			}
			if(n>0){
				return false;
			} else {
				Cookie cookie = new Cookie("reviewRec"+num, "reviewRec"+num);
				cookie.setMaxAge(60*60*24*7);
				cookie.setPath("/");
				resp.addCookie(cookie);
				ss.update("review.recomend", num);
				ss.commit();
				ss.close();
				return true;
			}
		} else {
			Cookie cookie = new Cookie("reviewRec"+num, "reviewRec"+num);
			cookie.setMaxAge(60*60*24*7);
			cookie.setPath("/");
			resp.addCookie(cookie);
			ss.update("review.recomend", num);
			ss.commit();
			ss.close();
			return true;
		}
	}
	
	// ¸®ºä Á¶È¸¼ö Áõ°¡
	public void countUp(int num, HttpServletRequest req, HttpServletResponse resp){
		Cookie[] ar = req.getCookies();
		int n = 0;
		if(ar.length>0){
			for(Cookie c : ar){
				if(c.getName().equals("reviewCount"+num)){
					n++;
				}
			}
			if(n>0){
				return;
			} else {
				SqlSession ss = fac.openSession();
				ss.update("review.countUp", num);
				ss.commit();
				ss.close();
				Cookie cookie = new Cookie("reviewCount"+num, "reviewCount"+num);
				cookie.setMaxAge(60*60);
				cookie.setPath("/");
				resp.addCookie(cookie);
			}
		} else {
			SqlSession ss = fac.openSession();
			ss.update("review.countUp", num);
			ss.commit();
			ss.close();
			Cookie cookie = new Cookie("reviewCount"+num, "reviewCount"+num);
			cookie.setMaxAge(60*60);
			cookie.setPath("/");
			resp.addCookie(cookie);
		}
	}

	// ¸®ºä ´ñ±Û µî·Ï
	public boolean writeRep(String id, String name, int num, String reply) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("num", num);
		map.put("reply", reply);
		try{
			ss.insert("review.writeRep", map);
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
	
	// ¸®ºä ´ñ±Û ¼ö Áõ°¡
	public void reviewRepUp(int num){
		SqlSession ss = fac.openSession();
		ss.update("review.reviewRepUp", num);
		ss.commit();
		ss.close();
	}

	// ¸®ºä ´ñ±Û ¼öÁ¤
	public boolean replyModify(int num, String reply) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("reply", reply);
		int n = ss.update("review.replyModify", map);
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
	
	// ¸®ºä ¼öÁ¤
	public boolean reviewModify(int num, String day, String subject, String subject1, String className, String grade, String teacher,
													String type, String rate1, String rate2, String rate3, String rate4, String again){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("day", day);
		map.put("subject", subject);
		if(subject1.equals("null")){
			map.put("subject1", null);
		} else {
			map.put("subject1", subject1);
		}
		map.put("className", className);
		map.put("grade", grade);
		map.put("teacher", teacher);
		if(type.equals("null")){
			map.put("type", null);
		} else {
			map.put("type", type);
		}
		map.put("rate1", rate1);
		map.put("rate2", rate2);
		map.put("rate3", rate3);
		map.put("rate4", rate4);
		map.put("again", again);
		int n = ss.update("review.reviewModify", map);
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
