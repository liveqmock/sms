package jxau.sms.lyx.purview.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import jxau.sms.commom.vo.PageVo;
 
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import jxau.sms.lyx.po.PurviewInfo;

/**
 * 
 * @author lyx
 * 2014-4-13
 * TODO:
 * 		关于系统权限的业务层实现
 */
@Service("SystemPurviewServiceImpl")
public class SystemPurviewServiceImpl implements GlobalServiceInterface {

	private Dao dao;
	
	@Resource(name="dao")
	public void setDao(Dao dao) {
		this.dao = dao;
	}

	@Override
	public <T> T searchByAccurate(Map<String, Object> param, int status) {
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

	//查询所有的系统权限
	@Override
	public <PurviewInfo> List<PurviewInfo> searchListByAccurate(Map<String, Object> param,
			int status) {
		// TODO Auto-generated method stub
		List<PurviewInfo> list = new ArrayList<PurviewInfo>();
		list = dao.select("jxau.sms.lyx.purview.dao.findAllSysPurview",param);
		
		return  list;
	}

	@Override
	public <T> List<T> searchByAccurate(Map<String, Object> param,
			PageVo pageVo, int status) {
		// TODO Auto-generated method stub
		return null;
	}

	 

}
