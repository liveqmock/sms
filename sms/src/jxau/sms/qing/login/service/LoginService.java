package jxau.sms.qing.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
<<<<<<< HEAD
=======

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
>>>>>>> 1f43a0fbe217bd933fa0cc6d662d26ccad89b6e7

import org.springframework.stereotype.Service;

import jxau.sms.commom.vo.PageVo;
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
<<<<<<< HEAD
import jxau.sms.qing.po.Student;

@Service("loginService")
public class LoginService implements GlobalServiceInterface{
	private Dao dao;
=======
 @Service("loginService")
public class LoginService {
	
	private  Dao dao ;
	
>>>>>>> 1f43a0fbe217bd933fa0cc6d662d26ccad89b6e7
	@Resource(name="dao")
	public void setDao(Dao dao) {
		this.dao = dao;
	}
<<<<<<< HEAD
=======

>>>>>>> 1f43a0fbe217bd933fa0cc6d662d26ccad89b6e7
	public boolean whichUser(String userId,String password){
		if(userId.length()==8){
			return this.selectStudent(userId,password);
		} else if(userId.length()==4){
			return this.selectTeacher(userId, password);
		} else return false;
	}
	
	public boolean selectStudent(String studentNo,String password){
		Student stu;
		HashMap<String, Object> student = new HashMap<String,Object>();
		student.put("studentNo", studentNo);
		student.put("stuPassword", password);
        stu = dao.selectOne("jxau.sms.qing.login.dao.selectStudent",student);
        if(stu != null){
        	return true;
        } else {
        	return false;
        }
	}
	
	public boolean selectTeacher(String teacherNo,String password){
		int count;
		HashMap<String, Object> student = new HashMap<String,Object>();
		student.put("teacherNo", teacherNo);
		student.put("tecPassword", password);
        count = dao.selectOne("jxau.sms.qing.login.dao.selectTeacher",student);
        if(count == 1){
        	return true;
        } else {
        	return false;
        }
	}
	@Override
	public <T> List<T> searchListByAccurate(Map<String, Object> param,
			int status) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public <T> T searchByAccurate(Map<String, Object> param, int status) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public <T> List<T> searchByAccurate(Map<String, Object> param,
			PageVo pageVo, int status) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public <T> int add(Class T, Object object) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public <T> int update(Class T, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public <T> int delete(Class T, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return 0;
	}
}
