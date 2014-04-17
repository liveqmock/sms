package jxau.sms.lyx.role.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import jxau.sms.commom.vo.PageVo;
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import jxau.sms.lyx.exception.NotFoundDataException;
import jxau.sms.lyx.po.RoleInfo;

/**
 * 
 * @author lyx
 * 2014-4-15
 * TODO:
 * 		处理角色的service
 */
@Service("RoleServiceImpl")
public class RoleServiceImpl implements GlobalServiceInterface{

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
	public <RoleInfo> List<RoleInfo> searchByAccurate(Map<String, Object> param,
			PageVo pageVo, int status) {
		// TODO Auto-generated method stub
		param = new HashMap<String, Object>();
		param.put("start",pageVo.getFirstIndex());
		param.put("nums",pageVo.getSize());
		
		List<RoleInfo> list = dao.select("findAllRoleInfo", param);
		long totalCount = dao.selectOne("findAllRoleInfoNums", param);
		pageVo.setCount(totalCount);
		
		return list;
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

	@Override
	public <RoleInfo> List<RoleInfo> searchListByAccurate(Map<String, Object> param,
			int status) {
		// TODO Auto-generated method stub
		List<RoleInfo> list =  dao.select("findRoleByCondition", param);
		System.out.println(list.size());
		if(list.size()==0){
			throw new NotFoundDataException("没有符合条件的结果");
		}
		return list;
	}

}
