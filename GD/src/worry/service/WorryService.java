package worry.service;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class WorryService {
	@Autowired
	SqlSessionFactory fac;
	
	public List<HashMap> worry(int page){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("worry.worry", page);
		ss.close();
		return list;
	}
}
