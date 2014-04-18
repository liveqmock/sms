package jxau.sms.lyx.role.service.impl;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxau.sms.commom.vo.PageVo;
import jxau.sms.lyx.po.RoleInfo;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServiceTest {

	@Test
	public void test() {
		
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleServiceImpl rs = (RoleServiceImpl)context.getBean("RoleServiceImpl");
		PageVo pageVo = new PageVo();
		pageVo.setSize(4);
	   	pageVo.setCurrentPage(1);	
		List<RoleInfo> list = rs.searchByAccurate(null, pageVo, 0);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getRoleName());
		}
	}
	
	@Test
	public void test2() {
		
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleServiceImpl rs = (RoleServiceImpl)context.getBean("RoleServiceImpl");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("roleName", "gala");
		List<RoleInfo> list = rs.searchListByAccurate(map, 0);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getRoleName());
		}
	}

}
