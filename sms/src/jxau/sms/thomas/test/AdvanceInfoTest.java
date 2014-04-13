package jxau.sms.thomas.test;

import java.util.HashMap;
import java.util.Map;
import jxau.sms.globaldao.Dao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdvanceInfoTest {

	@Test
	public void testDao(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao) applicationContext.getBean("dao");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("studentNo", "20111826");
		dao.selectOne("jxau.sms.advanceinfo.dao.findAdvInfoById",param);
		//AdvanceServiceImple test = (AdvanceServiceImple) applicationContext.getBean("globalServiceInterface");
	}
}
