package admin.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Controller
public class AdminService {
	@Autowired
	SqlSessionFactory fac;
	
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
		int n = ss.update(sql+end, id);
		if(n>0){
			try{
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
		} else {
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
}
