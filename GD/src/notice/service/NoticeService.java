package notice.service;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class NoticeService {
	@Autowired
	SqlSessionFactory fac;
	
}
