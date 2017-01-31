package admin.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Controller
public class AdminService {
	@Autowired
	SqlSessionFactory fac;
	
	// �������Ʈ
	public List<HashMap> memberList(){
		SqlSession ss = fac.openSession();
		List<HashMap> listS = ss.selectList("admin.memberListS");
		List<HashMap> listN = ss.selectList("admin.memberListN");
		List<HashMap> listP = ss.selectList("admin.memberListP");
		List<HashMap> listT = ss.selectList("admin.memberListT");
		List<HashMap> list = new Vector<>();
		for(HashMap m : listS){
			if(m.get("ADMIN")!=null){
				if(m.get("ADMIN").equals("y")){
					m.put("WHAT", "������");
					list.add(m);
				} else {
					m.put("WHAT", "�л�");
					list.add(m);
				}
			} else {
				m.put("WHAT", "�л�");
				list.add(m);
			}
		}
		for(HashMap m : listN){
			if(m.get("ADMIN")!=null){
				if(m.get("ADMIN").equals("y")){
					m.put("WHAT", "������");
					list.add(m);
				} else {
					m.put("WHAT", "�Ϲ�");
					list.add(m);
				}
			} else {
				m.put("WHAT", "�Ϲ�");
				list.add(m);
			}
		}
		for(HashMap m : listP){
			if(m.get("ADMIN")!=null){
				if(m.get("ADMIN").equals("y")){
					m.put("WHAT", "������");
					list.add(m);
				} else {
					m.put("WHAT", "�кθ�");
					list.add(m);
				}
			} else {
				m.put("WHAT", "�кθ�");
				list.add(m);
			}
		}
		for(HashMap m : listT){
			if(m.get("ADMIN")!=null){
				if(m.get("ADMIN").equals("y")){
					m.put("WHAT", "������");
					list.add(m);
				} else {
					m.put("WHAT", "������");
					list.add(m);
				}
			} else {
				m.put("WHAT", "������");
				list.add(m);
			}
		}
		return list;
	}

	// ��� ������
	public List<HashMap> memberDetail(String id) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("admin.memberDetailS", id);
		if(list.size()!=0){
			for(int i=0; i<list.size(); i++){
				HashMap map = list.get(i);
				if(map.get("ADMIN")!=null){
					if(map.get("ADMIN").equals("y")){
						map.put("WHAT", "������");
						list.set(i, map);
					} else {
						map.put("WHAT", "�л�");
						list.set(i, map);
					}
				} else {
					map.put("WHAT", "�л�");
					list.set(i, map);
				}
			}
			ss.close();
			return list;
		} else {
			list = ss.selectList("admin.memberDetailN", id);
			if(list.size()!=0){
				for(int i=0; i<list.size(); i++){
					HashMap map = list.get(i);
					if(map.get("ADMIN")!=null){
						if(map.get("ADMIN").equals("y")){
							map.put("WHAT", "������");
							list.set(i, map);
						} else {
							map.put("WHAT", "�Ϲ�");
							list.set(i, map);
						}
					} else {
						map.put("WHAT", "�Ϲ�");
						list.set(i, map);
					}
				}
				ss.close();
				return list;
			} else {
				list = ss.selectList("admin.memberDetailP", id);
				if(list.size()!=0){
					for(int i=0; i<list.size(); i++){
						HashMap map = list.get(i);
						if(map.get("ADMIN")!=null){
							if(map.get("ADMIN").equals("y")){
								map.put("WHAT", "������");
								list.set(i, map);
							} else {
								map.put("WHAT", "�кθ�");
								list.set(i, map);
							}
						} else {
							map.put("WHAT", "�кθ�");
							list.set(i, map);
						}
					}
					ss.close();
					return list;
				} else {
					list = ss.selectList("admin.memberDetailT", id);
					if(list.size()!=0){
						for(int i=0; i<list.size(); i++){
							HashMap map = list.get(i);
							if(map.get("ADMIN")!=null){
								if(map.get("ADMIN").equals("y")){
									map.put("WHAT", "������");
									list.set(i, map);
								} else {
									map.put("WHAT", "������");
									list.set(i, map);
								}
							} else {
								map.put("WHAT", "������");
								list.set(i, map);
							}
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
}
