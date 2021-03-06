package jxau.sms.lyx.purview.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jxau.sms.globaldao.Dao;
import jxau.sms.lyx.po.PurviewInfo;
import jxau.sms.lyx.po.RolePurview;
import jxau.sms.lyx.po.TeacherPurview;
import jxau.sms.lyx.purview.service.impl.UserPurviewManagerServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DaoTest {

	@Test
	public void test() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao)context.getBean("dao");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("roleNo",3);
				
		List<PurviewInfo> list = new ArrayList<PurviewInfo>();
		list = dao.select("jxau.sms.lyx.purview.dao.findPurviewByCondition", map);
	
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getPurviewName());
		}
	}
	
	@Test
	public void test2() {
		
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserPurviewManagerServiceImpl up = (UserPurviewManagerServiceImpl)context.getBean("UserPurviewManagerServiceImpl");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("teacherNo", "1234");
		List<PurviewInfo> list = new ArrayList<PurviewInfo>();
		list = up.searchListByAccurate(map, 0);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getPurviewName());
		}
	}
	
	@Test
	public void test3() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao)context.getBean("dao");
		Map<String,Object> insertMap = new HashMap<String,Object>();
		List<TeacherPurview> teacherPurview = new ArrayList<TeacherPurview>();
		TeacherPurview tp1 = new TeacherPurview();
		tp1.setTeacherNo("1234");
		tp1.setPurviewNo(3);
		TeacherPurview tp2 = new TeacherPurview();
		tp2.setTeacherNo("1234");
		tp2.setPurviewNo(2);
		teacherPurview.add(tp1);
		teacherPurview.add(tp2);
		insertMap.put("addTeacherPurviewList", teacherPurview);
		dao.batchAdd("addPurview",insertMap);
	}
	
	@Test
	public void test4() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao)context.getBean("dao");
		Map<String,Object> insertMap = new HashMap<String,Object>();
		List<TeacherPurview> teacherPurview = new ArrayList<TeacherPurview>();
		TeacherPurview tp1 = new TeacherPurview();
		tp1.setTeacherNo("1234");
		tp1.setPurviewNo(3);
		TeacherPurview tp2 = new TeacherPurview();
		tp2.setTeacherNo("1234");
		tp2.setPurviewNo(2);
		teacherPurview.add(tp1);
		teacherPurview.add(tp2);
		insertMap.put("delTeacherPurviewList", teacherPurview);
		dao.batchDelete("deletePurview",insertMap);
	}
	
	@Test
	public void test5() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao)context.getBean("dao");
		Map<String,Object> insertMap = new HashMap<String,Object>();
		List<RolePurview> rolePurview = new ArrayList<RolePurview>();
		RolePurview rp1 = new RolePurview();
		rp1.setRoleNo(3);
		rp1.setPurviewNo(2);
		RolePurview rp2 = new RolePurview();
		rp2.setRoleNo(4);
		rp2.setPurviewNo(2);
		rolePurview.add(rp1);
		rolePurview.add(rp2);
		insertMap.put("delRolePurviewList", rolePurview);
		dao.batchDelete("deletePurview",insertMap);
	}
	
	@Test
	public void test6() {
		ApplicationContext context  = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao)context.getBean("dao");
		Map<String,Object> insertMap = new HashMap<String,Object>();
		List<RolePurview> rolePurview = new ArrayList<RolePurview>();
		RolePurview rp1 = new RolePurview();
		rp1.setRoleNo(3);
		rp1.setPurviewNo(2);
		RolePurview rp2 = new RolePurview();
		rp2.setRoleNo(4);
		rp2.setPurviewNo(2);
		rolePurview.add(rp1);
		rolePurview.add(rp2);
		insertMap.put("addRolePurviewList", rolePurview);
		dao.batchAdd("addPurview",insertMap);
	}

}
