package main.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	SqlSession sss;
	
	// 아이디저장 / 자동로그인 체크
	public void check(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		Cookie[] cookies = req.getCookies();
		String id = "";
		String pw = "";
		if(cookies!=null){
			for(Cookie c : cookies){
				if(c.getName().equals("auto")){
					for(Cookie cc : cookies){
						if(cc.getName().equals("id")){
							id = cc.getValue();
						} else if(cc.getName().equals("pw")){
							pw = cc.getValue();
						}
					}
				} else if(c.getName().equals("save")){
					for(Cookie cc : cookies){
						if(cc.getName().equals("id")){
							id = cc.getValue();
							break;
						}
					}
				}
			}
		}
		if(!id.equals("") && !pw.equals("")){
			SqlSession ss = fac.openSession();
			HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pw", pw);
			List<HashMap> list = ss.selectList("member.login", map);
			ss.close();
			session.setAttribute("login", list.get(0));
		} else if(!id.equals("") && pw.equals("")){
			session.setAttribute("save", id);
		}
	}
	
	// 로그인
	public boolean login(String id, String pw, boolean auto, boolean save, HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.login", map);
		ss.close();
		if(list.size()!=0){
			Cookie autoCo = new Cookie("auto", "auto");
			Cookie saveCo = new Cookie("save", "save");
			Cookie idCo = new Cookie("id", id);
			Cookie pwCo = new Cookie("pw", pw);
			if(auto){
				autoCo.setPath("/");
				autoCo.setMaxAge(60*60*24*30*12);
				idCo.setPath("/");
				idCo.setMaxAge(60*60*24*30*12);
				pwCo.setPath("/");
				pwCo.setMaxAge(60*60*24*30*12);
				resp.addCookie(autoCo);
				resp.addCookie(idCo);
				resp.addCookie(pwCo);
				Cookie[] cookies = req.getCookies();
				if(cookies!=null){
					for(Cookie c : cookies){
						if(c.getName().equals("save")){
							saveCo.setPath("/");
							saveCo.setMaxAge(0);
							resp.addCookie(saveCo);
							break;
						}
					}
				}
			} else if(save){
				saveCo.setPath("/");
				saveCo.setMaxAge(60*60*24*30*12);
				idCo.setPath("/");
				idCo.setMaxAge(60*60*24*30*12);
				resp.addCookie(saveCo);
				resp.addCookie(idCo);
				Cookie[] cookies = req.getCookies();
				if(cookies!=null){
					for(Cookie c : cookies){
						if(c.getName().equals("auto")){
							autoCo.setPath("/");
							autoCo.setMaxAge(0);
							resp.addCookie(autoCo);
						} else if(c.getName().equals("pw")){
							pwCo.setPath("/");
							pwCo.setMaxAge(0);
							resp.addCookie(pwCo);
						}
					}
				}
			}
			session.setAttribute("login", list.get(0));
			return true;
		} else {
			return false;
		}
	}
	
	// 로그아웃
	public void logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		Cookie[] cookies = req.getCookies();
		if(cookies!=null){
			for(Cookie c : cookies){
				if(c.getName().equals("save") || c.getName().equals("id")){
					continue;
				} else {
					c.setPath("/");
					c.setMaxAge(0);
					resp.addCookie(c);
					session.removeAttribute("save");
				}
			}
		}
		session.removeAttribute("login");
	}
}
