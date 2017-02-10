package admin.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Controller
public class AdminService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// �������Ʈ
	public List<HashMap> memberList(){
		SqlSession ss = fac.openSession();
		List<HashMap> listS = ss.selectList("admin.memberListS");
		List<HashMap> listN = ss.selectList("admin.memberListN");
		List<HashMap> listP = ss.selectList("admin.memberListP");
		List<HashMap> listT = ss.selectList("admin.memberListT");
		List<HashMap> list = new Vector<>();
		for(HashMap m : listS){
			m.put("WHAT", "�л�");
			list.add(m);
		}
		for(HashMap m : listN){
			m.put("WHAT", "�Ϲ�");
			list.add(m);
		}
		for(HashMap m : listP){
			m.put("WHAT", "�кθ�");
			list.add(m);
		}
		for(HashMap m : listT){
			m.put("WHAT", "������");
			list.add(m);
		}
		ss.close();
		return list;
	}

	// ��� ������
	public List<HashMap> memberDetail(String id) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.memberDetailS", id);
		if(list.size()!=0){
			for(int i=0; i<list.size(); i++){
				HashMap map = list.get(i);
				map.put("WHAT", "�л�");
				list.set(i, map);
			}
			ss.close();
			return list;
		} else {
			list = ss.selectList("admin.memberDetailN", id);
			if(list.size()!=0){
				for(int i=0; i<list.size(); i++){
					HashMap map = list.get(i);
					map.put("WHAT", "�Ϲ�");
					list.set(i, map);
				}
				ss.close();
				return list;
			} else {
				list = ss.selectList("admin.memberDetailP", id);
				if(list.size()!=0){
					for(int i=0; i<list.size(); i++){
						HashMap map = list.get(i);
						map.put("WHAT", "�кθ�");
						list.set(i, map);
					}
					ss.close();
					return list;
				} else {
					list = ss.selectList("admin.memberDetailT", id);
					if(list.size()!=0){
						for(int i=0; i<list.size(); i++){
							HashMap map = list.get(i);
							map.put("WHAT", "������");
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
	
	// ������ �����ֱ� �� ����
	public boolean giveAdmin(String id, String what, String grade) {
		SqlSession ss = fac.openSession();
		String sql = "admin.giveAdmin";
		String end = "";
		switch(what){
		case "�л�":
			end = "S";
			break;
		case "�Ϲ�":
			end = "N";
			break;
		case "�кθ�":
			end = "P";
			break;
		case "������":
			end = "T";
			break;
		} 
		int n = ss.update(sql+end, id);
		if(n>0){
			try{
				HashMap<String, String> map = new HashMap<>();
				map.put("id", id);
				map.put("grade", grade);
				map.put("what", what);
				ss.insert("admin.saveGrade", map);
				map.put("grade", "������");
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
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	// ������ ���ѻ��� �� ����
	public boolean loseAdmin(String id){
		SqlSession ss = fac.openSession();
		String sql = "admin.loseAdmin";
		String end = "";
		HashMap<String, String> map = ss.selectOne("admin.selectGrade", id);
		String what = map.get("WHAT");
		switch(what){
		case "�л�":
			end = "S";
			break;
		case "�Ϲ�":
			end = "N";
			break;
		case "�кθ�":
			end = "P";
			break;
		case "������":
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

	// tab2 �۸��
	public List<HashMap> board(String type) {
		SqlSession ss = fac.openSession();
		String sql = "admin.board";
		List<HashMap> list = ss.selectList("admin.board"+type);
		ss.close();
		return list;
	}

	// tab2 �� �󼼺���
	public List<HashMap> boardDetail(String board, String title) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin."+board+"List", title);
		ss.close();
		return list;
	}

	// tab2 �� �̵�
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
	
	// �п� �ΰ� uuid ����
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
	
	// �п� �ΰ� ���
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
	
	// �п� �̹��� uuid ����
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
	
	// �п� �̹��� ���
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
	
	// �п� ���
	public boolean academyRegist(String name, String addr1, String addr2, String tell, String type1, String type2, String site,
												String logo, String intro, String pic1, String pic2, String pic3, String pic4, String pic5, String target, String subject){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("tell", tell);
		map.put("type1", type1);
		map.put("type2", type2);
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
}
