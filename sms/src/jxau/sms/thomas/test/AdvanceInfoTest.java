package jxau.sms.thomas.test;

import java.util.HashMap;
import java.util.Map;

import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdvanceInfoTest {

	public void testDao(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao) applicationContext.getBean("dao");
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("studentNo", "20111826");
		dao.selectOne("jxau.sms.advanceinfo.dao.findAdvInfoById",param);
	}
	@Test
	public void testService(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		GlobalServiceInterface globalServiceInterface = (GlobalServiceInterface) applicationContext.getBean("advanceServiceImple");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("studentNo", "20111826");
		System.out.print("学号参数是：" + "20111826");
		globalServiceInterface.searchListByAccurate(params, 0);
	}
}
