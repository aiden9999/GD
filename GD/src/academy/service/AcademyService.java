package academy.service;

import java.util.*;

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
		map.put("start", (page*10)-9);
		map.put("end", page*10);
		List<HashMap> list = ss.selectList("academy.acanews", num);
		ss.close();
		return list;
	}
}
