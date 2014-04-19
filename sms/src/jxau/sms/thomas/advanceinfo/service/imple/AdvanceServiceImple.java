package jxau.sms.thomas.advanceinfo.service.imple;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import jxau.sms.commom.vo.PageVo;
 
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import jxau.sms.thomas.po.StuAdvInfo;

@Service("advanceServiceImple")
public class AdvanceServiceImple implements GlobalServiceInterface {

	private Dao dao;
	
	@Resource(name="dao")
	public void setDao(Dao dao){
		this.dao = dao;
	}
	
	@Override
	public <T> List<T> searchListByAccurate(Map<String, Object> param,
			int status) {
		// TODO Auto-generated method stub
		
		List<StuAdvInfo> stuAdvInfo = new ArrayList<StuAdvInfo>();
		stuAdvInfo = dao.select("jxau.sms.advanceinfo.dao.findAdvInfo", param);
		return (List<T>) stuAdvInfo;
	}

	@Override
	public <T> T searchByAccurate(Map<String, Object> param, int status) {
		// TODO Auto-generated method stub
		dao.selectOne("jxau.sms.advanceinfo.dao.findAdvInfoById", param);
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
