package jxau.sms.lyx.allocationRole.service.impl;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxau.sms.globaldao.Dao;
import jxau.sms.lyx.vo.VTeacherRole;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServiceImplTest {

	@Test
	public void test() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		AllocationRoleServiceImpl ars = (AllocationRoleServiceImpl)context.getBean("AllocationRoleServiceImpl");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("teacherNo", "0000");
		List<VTeacherRole> vTeacherRole = ars.searchByAccurate(map, null, 0);
		for(int i=0;i<vTeacherRole.size();i++){
			System.out.print(vTeacherRole.get(i).getTeacherNo());
			System.out.print(vTeacherRole.get(i).getTeacherName());
			for(int j=0;j<vTeacherRole.get(i).getRoleList().size();j++){
				System.out.print(vTeacherRole.get(i).getRoleList().get(j));
			}
			for(int j=0;j<vTeacherRole.get(i).getDepartmentList().size();j++){
				System.out.print(vTeacherRole.get(i).getDepartmentList().get(j));
			}		
		}	
	}
}
