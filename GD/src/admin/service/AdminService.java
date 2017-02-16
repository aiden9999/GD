package admin.service;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Controller
public class AdminService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	@Autowired
	JavaMailSender jms;
	
	// 멤버리스트
	public List<HashMap> memberList(){
		SqlSession ss = fac.openSession();
		List<HashMap> listS = ss.selectList("admin.memberListS");
		List<HashMap> listN = ss.selectList("admin.memberListN");
		List<HashMap> listP = ss.selectList("admin.memberListP");
		List<HashMap> listT = ss.selectList("admin.memberListT");
		List<HashMap> list = new Vector<>();
		for(HashMap m : listS){
			m.put("WHAT", "학생");
			list.add(m);
		}
		for(HashMap m : listN){
			m.put("WHAT", "일반");
			list.add(m);
		}
		for(HashMap m : listP){
			m.put("WHAT", "학부모");
			list.add(m);
		}
		for(HashMap m : listT){
			m.put("WHAT", "선생님");
			list.add(m);
		}
		ss.close();
		return list;
	}

	// 멤버 상세정보
	public List<HashMap> memberDetail(String id) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.memberDetailS", id);
		if(list.size()!=0){
			for(int i=0; i<list.size(); i++){
				HashMap map = list.get(i);
				map.put("WHAT", "학생");
				list.set(i, map);
			}
			ss.close();
			return list;
		} else {
			list = ss.selectList("admin.memberDetailN", id);
			if(list.size()!=0){
				for(int i=0; i<list.size(); i++){
					HashMap map = list.get(i);
					map.put("WHAT", "일반");
					list.set(i, map);
				}
				ss.close();
				return list;
			} else {
				list = ss.selectList("admin.memberDetailP", id);
				if(list.size()!=0){
					for(int i=0; i<list.size(); i++){
						HashMap map = list.get(i);
						map.put("WHAT", "학부모");
						list.set(i, map);
					}
					ss.close();
					return list;
				} else {
					list = ss.selectList("admin.memberDetailT", id);
					if(list.size()!=0){
						for(int i=0; i<list.size(); i++){
							HashMap map = list.get(i);
							map.put("WHAT", "선생님");
							list.set(i, map);
						}
						ss.close();
						return list;
					} else {
						return null;
					}
				}
			}
		}
	}
	
	// 관리자 권한주기 및 저장
	public boolean giveAdmin(String id, String what, String grade) {
		SqlSession ss = fac.openSession();
		String sql = "admin.giveAdmin";
		String end = "";
		switch(what){
		case "학생":
			end = "S";
			break;
		case "일반":
			end = "N";
			break;
		case "학부모":
			end = "P";
			break;
		case "선생님":
			end = "T";
			break;
		} 
		try{
			int n = ss.update(sql+end, id);
			HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("grade", grade);
			map.put("what", what);
			ss.insert("admin.saveGrade", map);
			map.put("grade", "관리자");
			ss.update("admin.updateGrade"+end, map);
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
	
	// 관리자 권한뺏기 및 저장
	public boolean loseAdmin(String id){
		SqlSession ss = fac.openSession();
		String sql = "admin.loseAdmin";
		String end = "";
		HashMap<String, String> map = ss.selectOne("admin.selectGrade", id);
		String what = map.get("WHAT");
		switch(what){
		case "학생":
			end = "S";
			break;
		case "일반":
			end = "N";
			break;
		case "학부모":
			end = "P";
			break;
		case "선생님":
			end = "T";
			break;
		} 
		int n = ss.update(sql+end, id);
		if(n>0){
			map.put("id", map.get("ID"));
			map.put("grade", map.get("GRADE"));
			ss.update("admin.updateGrade"+end, map);
			ss.delete("admin.deleteGrade", id);
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// tab2 글목록
	public List<HashMap> board(String type) {
		SqlSession ss = fac.openSession();
		String sql = "admin.board";
		List<HashMap> list = ss.selectList("admin.board"+type);
		ss.close();
		return list;
	}

	// tab2 글 상세보기
	public List<HashMap> boardDetail(String board, String title) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin."+board+"List", title);
		ss.close();
		return list;
	}

	// tab2 글 이동
	public boolean boardMove(String nowBoard, String title, String writer, String content) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("writer", writer);
		map.put("content", content);
		int n = ss.delete("admin.delete"+nowBoard, map);
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
	
	// 학원 로고 uuid 생성
	public String logoUUID(MultipartFile logo){
		if(logo.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString();
			String filename = uuid.substring(0,10);
			String fileDir = application.getRealPath("/logo");
			File file = new File(fileDir, filename);
			logo.transferTo(file);
			return filename;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	// 학원 로고 등록
	public void logoUpload(String name, String site, String uuid){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("site", site);
		map.put("name", name);
		map.put("uuid", uuid);
		try {
			ss.insert("admin.logoUpload",map);
			ss.commit();
			ss.close();
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
		}
	}
	
	// 학원 이미지 uuid 생성
	public String picUUID(MultipartFile pic) {
		if(pic.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString();
			String filename = uuid.substring(0,10);
			String fileDir = application.getRealPath("/pic");
			File file = new File(fileDir, filename);
			pic.transferTo(file);
			return filename;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	// 학원 이미지 등록
	public void picUpload(String site, String name, String uuid1, String uuid2, String uuid3, String uuid4, String uuid5){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("site", site);
		map.put("name", name);
		map.put("uuid1", uuid1);
		map.put("uuid2", uuid2);
		map.put("uuid3", uuid3);
		map.put("uuid4", uuid4);
		map.put("uuid5", uuid5);
		try {
			ss.insert("admin.picUpload",map);
			ss.commit();
			ss.close();
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
		}
	}
	
	// 학원 등록
	public boolean academyRegist(String name, String addr1, String addr2, String tell, String site,
												String logo, String intro, String pic1, String pic2, String pic3, String pic4, String pic5, String target, String subject){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("tell", tell);
//		map.put("type1", type1);
//		map.put("type2", type2);
		map.put("site", site);
		map.put("logo", logo);
		map.put("intro", intro);
		map.put("pic1", pic1);
		map.put("pic2", pic2);
		map.put("pic3", pic3);
		map.put("pic4", pic4);
		map.put("pic5", pic5);
		map.put("target", target);
		map.put("subject", subject);
		try{
			ss.insert("academy.newAcademy", map);
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

	// 메일 리스트
	public List<String> emailList(String[] to){
		SqlSession ss = fac.openSession();
		List<String> member = new Vector<>();
		for(String s : to){
			HashMap map = ss.selectOne("member.searchMemberS", s.subSequence(s.indexOf('(')+1, s.indexOf(')')));
			if(map == null){
				map = ss.selectOne("member.searchMemberN", s.subSequence(s.indexOf('(')+1, s.indexOf(')')));
				if(map == null){
					map = ss.selectOne("member.searchMemberT", s.subSequence(s.indexOf('(')+1, s.indexOf(')')));
					if(map == null){
						map = ss.selectOne("member.searchMemberP", s.subSequence(s.indexOf('(')+1, s.indexOf(')')));
						if(map == null){
							continue;
						} else {
							member.add(map.get("EMAIL").toString());
						}
					} else {
						member.add(map.get("EMAIL").toString());
					}
				} else {
					member.add(map.get("EMAIL").toString());
				}
			} else {
				member.add(map.get("EMAIL").toString());
			}
		}
		ss.close();
		return member;
	}

	// 관리자 권한 셋팅
	public boolean setAdmin(String id, String what, String grade, String admin, String num) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("what", what);
		map.put("grade", grade);
		map.put("admin", admin);
		map.put("num", num);
		String sql = "admin.setAdmin";
		String end = "";
		switch(what){
		case "학생":
			end = "S";
			break;
		case "일반":
			end = "N";
			break;
		case "학부모":
			end = "P";
			break;
		case "선생님":
			end = "T";
			break;
		}
		int n = ss.update(sql+end, map);
		if(n>0){
			if(!admin.equals("학원관리자")){
				List<HashMap> list = ss.selectList("academy.allAcademy");
				for(HashMap m : list){
					if(m.get("ADMIN")!=null){
						String acaAdmin = m.get("ADMIN").toString();
						if(acaAdmin.equals(id)){
							map.put("num", m.get("NUM"));
						}
					}
				}
				map.put("id", "aa");
			}
			ss.update("admin.acaAdmin", map);
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
