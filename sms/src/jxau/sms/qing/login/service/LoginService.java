package jxau.sms.qing.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import jxau.sms.commom.vo.PageVo;
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import jxau.sms.qing.exception.LoginException;
import jxau.sms.qing.po.Student;

@Service("loginService")
public class LoginService implements GlobalServiceInterface{
	private Dao dao;
	
	@Resource(name="dao")
	public void setDao(Dao dao) {
		this.dao = dao;
	}

 	public Object whichUser(String userId,String password){

		if(userId.length()==8){
			return this.selectStudent(userId,password);
		} else if(userId.length()==4){
			return this.selectTeacher(userId, password);
		} else throw new LoginException(LoginException.nameOrPsdError);
	}
	
	public Object selectStudent(String studentNo,String password){
		Student stu;
		HashMap<String, Object> student = new HashMap<String,Object>();
		student.put("studentNo", studentNo);
		student.put("stuPassword", password);
        stu = dao.selectOne("jxau.sms.qing.login.dao.selectStudent",student);
        if(stu != null){
        	if(stu.getStuState() != 1){
        		throw new LoginException(LoginException.stateDatedError);
        	}
        	return stu;          //返回学生部分基本信息，放到session里面去
        } else {
        	throw new LoginException(LoginException.nameOrPsdError);
        }
	}
	
	public String selectTeacher(String teacherNo,String password){
		int count;
		System.out.println(teacherNo);
		System.out.println(password);
		HashMap<String, Object> student = new HashMap<String,Object>();
		student.put("teacherNo", teacherNo);
		student.put("tecPassword", password);
        count = dao.selectOne("jxau.sms.qing.login.dao.selectTeacher",student);
        if(count == 1){
        	return teacherNo;
        } else {
        	throw new LoginException(LoginException.nameOrPsdError);      	
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
