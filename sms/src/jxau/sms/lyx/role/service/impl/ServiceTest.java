package jxau.sms.lyx.role.service.impl;

import static org.junit.Assert.*;

import java.util.Date;
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
	
	@Test
	public void test3() {
		
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleServiceImpl rs = (RoleServiceImpl)context.getBean("RoleServiceImpl");		
		RoleInfo roleInfo = new RoleInfo();
		roleInfo.setRoleName("测试2");
		roleInfo.setCreateTime(new Date());
		roleInfo.setRoleDescription("测试角色哦亲");
		rs.add(RoleInfo.class, roleInfo);
	}
	
	@Test
	public void test4() {
		
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleServiceImpl rs = (RoleServiceImpl)context.getBean("RoleServiceImpl");		
		RoleInfo roleInfo = new RoleInfo();
		roleInfo.setRoleName("测试4");
		roleInfo.setCreateTime(new Date());
		roleInfo.setRoleDescription("测试角色哦亲");
		//rs.insertRoleInfoPurview(rs.getDataNum()+1+"", roleInfo, "2,3,4,5");
	}

}
