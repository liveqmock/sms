package jxau.sms.lyx.allocationRole.service.impl;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxau.sms.commom.vo.PageVo;
import jxau.sms.globaldao.Dao;
import jxau.sms.lyx.po.RoleInfo;
import jxau.sms.lyx.po.TeacherRole;
import jxau.sms.lyx.role.service.impl.RoleServiceImpl;
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
		PageVo pageVo = new PageVo();
		pageVo.setSize(4);
		List<VTeacherRole> vTeacherRole = ars.searchByAccurate(null, pageVo, 0);
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
	
	
	@Test
	public void test2() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleServiceImpl rs = (RoleServiceImpl)context.getBean("RoleServiceImpl");
		PageVo pageVo = new PageVo();
		List<RoleInfo> list = rs.searchByAccurate(null,pageVo,0);
		for(int j=0;j<list.size();j++){
			System.out.print(list.get(j).getRoleName());
		}	
	}
	
	@Test
	public void test3() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		AllocationRoleServiceImpl ars = (AllocationRoleServiceImpl)context.getBean("AllocationRoleServiceImpl");
		
		TeacherRole teacherRole = new TeacherRole();
		teacherRole.setRoleNo(6);
		teacherRole.setTeacherNo("1234");
		ars.add(TeacherRole.class, teacherRole);
		
	}
}
