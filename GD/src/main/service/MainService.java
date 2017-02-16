package main.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import member.service.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	SqlSession sss;
	@Autowired
	MemberService ms;

	// ���̵����� / �ڵ��α��� üũ
	public void check(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		Cookie[] cookies = req.getCookies();
		String id = "";
		String pw = "";
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("auto")) {
					for (Cookie cc : cookies) {
						if (cc.getName().equals("id")) {
							id = cc.getValue();
						} else if (cc.getName().equals("pw")) {
							pw = cc.getValue();
						}
					}
				} else if (c.getName().equals("save")) {
					for (Cookie cc : cookies) {
						if (cc.getName().equals("id")) {
							id = cc.getValue();
							break;
						}
					}
				}
			}
		}
		if (!id.equals("") && !pw.equals("")) {
			SqlSession ss = fac.openSession();
			HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pw", pw);
			List<HashMap> list = ss.selectList("member.loginS", map);
			if (list.size() == 0) {
				list = ss.selectList("member.loginN", map);
				if (list.size() == 0) {
					list = ss.selectList("member.loginP", map);
					if (list.size() == 0) {
						list = ss.selectList("member.loginT", map);
					}
				}
			}
			ss.close();
			session.setAttribute("login", list.get(0));
		} else if (!id.equals("") && pw.equals("")) {
			session.setAttribute("save", id);
		}
	}

	// �α���
	public boolean login(String id, String pw, boolean auto, boolean save, HttpSession session, HttpServletRequest req,
			HttpServletResponse resp) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.loginS", map);
		String type = "S";
		session.setAttribute("type", "�л�");
		if (list.size() == 0) {
			list = ss.selectList("member.loginN", map);
			session.setAttribute("type", "�Ϲ�");
			type = "N";
			if (list.size() == 0) {
				list = ss.selectList("member.loginP", map);
				session.setAttribute("type", "�θ��");
				type = "P";
				if (list.size() == 0) {
					list = ss.selectList("member.loginT", map);
					session.setAttribute("type", "������");
					type = "T";
				}
			}
		}
		if (list.size() != 0) {
			list.get(0).put("email1",
					list.get(0).get("EMAIL").toString().substring(0, list.get(0).get("EMAIL").toString().indexOf('@')));
			list.get(0).put("email2", list.get(0).get("EMAIL").toString()
					.substring(list.get(0).get("EMAIL").toString().indexOf('@') + 1));
			Cookie autoCo = new Cookie("auto", "auto");
			Cookie saveCo = new Cookie("save", "save");
			Cookie idCo = new Cookie("id", id);
			Cookie pwCo = new Cookie("pw", pw);
			if (auto) {
				autoCo.setPath("/");
				autoCo.setMaxAge(60 * 60 * 24 * 30 * 12);
				idCo.setPath("/");
				idCo.setMaxAge(60 * 60 * 24 * 30 * 12);
				pwCo.setPath("/");
				pwCo.setMaxAge(60 * 60 * 24 * 30 * 12);
				resp.addCookie(autoCo);
				resp.addCookie(idCo);
				resp.addCookie(pwCo);
				Cookie[] cookies = req.getCookies();
				if (cookies != null) {
					for (Cookie c : cookies) {
						if (c.getName().equals("save")) {
							saveCo.setPath("/");
							saveCo.setMaxAge(0);
							resp.addCookie(saveCo);
							break;
						}
					}
				}
			} else if (save) {
				saveCo.setPath("/");
				saveCo.setMaxAge(60 * 60 * 24 * 30 * 12);
				idCo.setPath("/");
				idCo.setMaxAge(60 * 60 * 24 * 30 * 12);
				resp.addCookie(saveCo);
				resp.addCookie(idCo);
				Cookie[] cookies = req.getCookies();
				if (cookies != null) {
					for (Cookie c : cookies) {
						if (c.getName().equals("auto")) {
							autoCo.setPath("/");
							autoCo.setMaxAge(0);
							resp.addCookie(autoCo);
						} else if (c.getName().equals("pw")) {
							pwCo.setPath("/");
							pwCo.setMaxAge(0);
							resp.addCookie(pwCo);
						}
					}
				}
			} else if (!save) {
				saveCo.setPath("/");
				saveCo.setMaxAge(0);
				idCo.setPath("/");
				idCo.setMaxAge(0);
				resp.addCookie(saveCo);
				resp.addCookie(idCo);
				Cookie[] cookies = req.getCookies();
				if (cookies != null) {
					for (Cookie c : cookies) {
						if (c.getName().equals("auto")) {
							autoCo.setPath("/");
							autoCo.setMaxAge(0);
							resp.addCookie(autoCo);
						} else if (c.getName().equals("pw")) {
							pwCo.setPath("/");
							pwCo.setMaxAge(0);
							resp.addCookie(pwCo);
						}
					}
				}
			}
			List<HashMap> visitList = ss.selectList("member.visitList", id);
			if (visitList.size() == 0) {
				try {
					ss.insert("member.visit", id);
					ss.update("member.visitUp" + type, id);
					list.get(0).put("VISIT", (int) list.get(0).get("VISIT") + 1);
					session.setAttribute("login", list.get(0));
					ss.commit();
					ss.close();
					return true;
				} catch (Exception e) {
					ss.rollback();
					ss.close();
					e.printStackTrace();
					return false;
				}
			} else {
				Date date = (Date) visitList.get(visitList.size() - 1).get("VISIT");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String today = sdf.format(System.currentTimeMillis());
				if (today.equals(date.toString())) {
					ss.commit();
					ss.close();
					session.setAttribute("login", list.get(0));
				} else {
					ss.insert("member.visit", id);
					ss.update("member.visitUp" + type, id);
					list.get(0).put("VISIT", (int) list.get(0).get("VISIT") + 1);
					session.setAttribute("login", list.get(0));
					ss.commit();
					ss.close();
				}
				return true;
			}
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// �α׾ƿ�
	public void logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("save") || c.getName().equals("id")) {
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

	// �˻��� �п�����Ʈ
	public List<HashMap> academy(String search, int num) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("search", "%" + search + "%");
		map.put("page", (num - 1) * 5);
		List<HashMap> list = ss.selectList("search.academy", map);
		ss.close();
		return list;
	}

	// �˻��� �п�����Ʈ ������
	public int academyPage(String search) {
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("search.academyPage", "%" + search + "%");
		page = page % 5 == 0 ? page / 5 : page / 5 + 1;
		ss.close();
		return page;
	}

	// �˻��� �������� ����Ʈ
	public List<HashMap> notice(String search, int num) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("search", "%" + search + "%");
		map.put("page", (num - 1) * 5);
		List<HashMap> list = ss.selectList("search.notice", map);
		ss.close();
		return list;
	}

	// �˻��� �������� ������
	public int noticePage(String search) {
		SqlSession ss = fac.openSession();
		int page = ss.selectOne("search.noticePage", "%" + search + "%");
		ss.close();
		return page;
	}

	// �˻� �Խ��� ����
	public List<HashMap> boardChange(String board, String search, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("search", "%" + search + "%");
		map.put("page", (page - 1) * 5);
		List<HashMap> list = ss.selectList("search.search" + board, map);
		ss.close();
		return list;
	}

	// �˻� �Խ��� ���� ������
	public int boardPage(String board, String search) {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("search." + board + "Page", "%" + search + "%");
		ss.close();
		return n;
	}

	// ���������� �п�����Ʈ
	public List<List<HashMap>> mainAca() {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("main.acaT");
		ss.close();
		List<List<HashMap>> total = new Vector<>();
		List<HashMap> ele = new Vector<>();
		List<HashMap> mid = new Vector<>();
		List<HashMap> hig = new Vector<>();
		List<HashMap> mis = new Vector<>();
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("�ʵ�")) {
				if (ele.size() < 11) {
					ele.add(m);
				} else {
					break;
				}
			}
		}
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("�ߵ�")) {
				if (mid.size() < 11) {
					mid.add(m);
				} else {
					break;
				}
			}
		}
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("���")) {
				if (hig.size() < 11) {
					hig.add(m);
				} else {
					break;
				}
			}
		}
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("���")) {
				if (mis.size() < 11) {
					mis.add(m);
				} else {
					break;
				}
			}
		}
		total.add(ele);
		total.add(mid);
		total.add(hig);
		total.add(mis);
		return total;
	}

	// ���������� �п�����Ʈ ����
	public List<List<HashMap>> align(String align) {
		SqlSession ss = fac.openSession();
		String sql = "main.aca";
		switch (align) {
		case "total":
			sql += "T";
			break;
		case "point":
			sql += "P";
			break;
		case "search":
			sql += "C";
			break;
		case "reply":
			sql += "R";
			break;
		}
		List<HashMap> list = ss.selectList(sql);
		ss.close();
		List<List<HashMap>> total = new Vector<>();
		List<HashMap> ele = new Vector<>();
		List<HashMap> mid = new Vector<>();
		List<HashMap> hig = new Vector<>();
		List<HashMap> mis = new Vector<>();
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("�ʵ�")) {
				if (ele.size() < 11) {
					ele.add(m);
				} else {
					break;
				}
			}
		}
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("�ߵ�")) {
				if (mid.size() < 11) {
					mid.add(m);
				} else {
					break;
				}
			}
		}
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("���")) {
				if (hig.size() < 11) {
					hig.add(m);
				} else {
					break;
				}
			}
		}
		for (HashMap m : list) {
			String target = (String) m.get("TARGET");
			if (target.contains("���")) {
				if (mis.size() < 11) {
					mis.add(m);
				} else {
					break;
				}
			}
		}
		total.add(ele);
		total.add(mid);
		total.add(hig);
		total.add(mis);
		return total;
	}

	// ���������� �� �� ����
	public int myBoard(String id) {
		int n = 0;
		List<HashMap> board1 = ms.board1(id);
		List<HashMap> board2 = ms.board2(id);
		List<HashMap> review = ms.review(id);
		List<HashMap> comment = ms.comment(id);
		n = board1.size() + board2.size() + review.size() + comment.size();
		return n;
	}

	// ���������� �� ��� ����
	public int myReply(String id) {
		int n = 0;
		List<HashMap> reply1 = ms.reply1(id);
		List<HashMap> reply2 = ms.reply2(id);
		n = reply1.size() + reply2.size();
		return n;
	}

	// ���� ���� ����Ʈ
	public List<HashMap> mainNotice() {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("notice.noticeList", 0);
		ss.close();
		return list;
	}

	// ���� ���ٹ� ����Ʈ
	public List<HashMap> mainWaggle() {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("waggle.waggleList");
		ss.close();
		return list;
	}

	// ���� �Խ����� ����Ʈ
	public List<List<HashMap>> mainExam() {
		SqlSession ss = fac.openSession();
		List<HashMap> high = ss.selectList("highExam.mainHigh", 0);
		List<HashMap> univ = ss.selectList("univExam.mainUniv", 0);
		List<List<HashMap>> list = new Vector<>();
		list.add(high);
		list.add(univ);
		ss.close();
		return list;
	}

	// ���� ��õ�п�
	public List<HashMap> recomendAcademy() {
		List<List<HashMap>> total = align("total");
		List<HashMap> ele = total.get(0);
		List<HashMap> mid = total.get(1);
		List<HashMap> hig = total.get(2);
		for (int i = 0; i < ele.size(); i++) {
			if (i > 2) {
				ele.remove(i);
			} else {
				continue;
			}
		}
		for (int i = 0; i < mid.size(); i++) {
			if (i > 2) {
				mid.remove(i);
			} else {
				continue;
			}
		}
		for (int i = 0; i < hig.size(); i++) {
			if (i > 2) {
				hig.remove(i);
			} else {
				continue;
			}
		}
		List<HashMap> list = new Vector<>();
		for (int i = 0; i < ele.size(); i++) {
			list.add(ele.get(i));
		}
		for (int i = 0; i < mid.size(); i++) {
			list.add(mid.get(i));
		}
		for (int i = 0; i < hig.size(); i++) {
			list.add(hig.get(i));
		}
		return list;
	}

	// �˻� Ƚ�� �� ����Ʈ ����
	public void searchUpdate(String search, HttpServletRequest req, HttpServletResponse resp) {
		SqlSession ss = fac.openSession();
		List<HashMap> academy = ss.selectList("academy.allAcademy");
		Cookie[] ar = req.getCookies();
		if (ar.length > 0) {
			if (search.indexOf("�п�") > 0) {
				search = search.substring(0, search.indexOf("�п�"));
			}
			for (HashMap m : academy) {
				String name = m.get("NAME").toString();
				String upName = name;
				if (upName.indexOf("�п�") > 0) {
					upName = upName.substring(0, upName.indexOf("�п�"));
				}
				if (upName.equals(search)) {
					int n = 0;
					for (Cookie c : ar) {
						if (c.getName().equals("searchAca" + m.get("NUM"))) {
							n++;
						}
					}
					if(n>0){
						continue;
					} else {
						ss.update("academy.searchUp", name);
						ss.update("academy.searchTotalUp", m.get("NUM"));
						Cookie cookie = new Cookie("searchAca" + m.get("NUM"), "searchAca" + m.get("NUM"));
						cookie.setMaxAge(60 * 60);
						cookie.setPath("/");
						resp.addCookie(cookie);
					}
				}
			}
		} else {
			if (search.indexOf("�п�") > 0) {
				search = search.substring(0, search.indexOf("�п�"));
			}
			for (HashMap m : academy) {
				String name = m.get("NAME").toString();
				String upName = name;
				if (upName.indexOf("�п�") > 0) {
					upName = upName.substring(0, upName.indexOf("�п�"));
				}
				if (upName.equals(search)) {
					int n = 0;
					for (Cookie c : ar) {
						if (c.getName().equals("searchAca" + m.get("NUM"))) {
							n++;
						}
					}
					if(n>0){
						continue;
					} else {
						ss.update("academy.searchUp", name);
						ss.update("academy.searchTotalUp", m.get("NUM"));
						Cookie cookie = new Cookie("searchAca" + m.get("NUM"), "searchAca" + m.get("NUM"));
						cookie.setMaxAge(60 * 60);
						cookie.setPath("/");
						resp.addCookie(cookie);
					}
				}
			}
		}
		ss.commit();
		ss.close();
	}

	// ������ ���� �� �湮�ڼ� ����
	public String visitIp(HttpServletRequest req) {
		SqlSession ss = fac.openSession();
		String ip = req.getHeader("X-FORWARDED-FOR"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getRemoteAddr();
	    }
		List<HashMap> ipToday = new Vector<>();
		List<HashMap> ipAll = ss.selectList("main.getIpAll");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(System.currentTimeMillis());
		for(HashMap m : ipAll){
			if(m.get("DAY").toString().equals(today)){
				ipToday.add(m);
			}
		}
		int n = 0;
		for(HashMap m : ipToday){
			if(m.get("IP").toString().equals(ip)){
				n++;
				break;
			}
		}
		int todayVisit = ipToday.size();
		int totalVisit = ipAll.size();
		if(n==0){
			try{
				ss.insert("main.visitIp", ip);
				ss.commit();
				ss.close();
				todayVisit++;
				totalVisit++;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
			}
		} else {
			ss.rollback();
			ss.close();
		}
		return todayVisit+"/"+totalVisit;
	}
}
