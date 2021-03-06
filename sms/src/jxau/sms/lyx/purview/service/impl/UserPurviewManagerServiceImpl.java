package jxau.sms.lyx.purview.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import jxau.sms.commom.vo.PageVo;
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import jxau.sms.lyx.po.PurviewInfo;

@Transactional(propagation=Propagation.REQUIRED)
@Service("UserPurviewManagerServiceImpl")
public class UserPurviewManagerServiceImpl implements GlobalServiceInterface {

	private Dao dao;
	
	@Resource(name="dao")
	public void setDao(Dao dao) {
		this.dao = dao;
	}

	//根据条件（角色编号或者用户编号）查询权限
	@Override
	public <PurviewInfo> List<PurviewInfo> searchListByAccurate(Map<String, Object> param,
			int status) {
		// TODO Auto-generated method stub
		List<PurviewInfo> list = dao.select("jxau.sms.lyx.purview.dao.findPurviewByCondition", param);	
		return list;
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
	
	/**
	 * 
	 * 该方法传入两个集合，newList和oldList
	 * @author lyx
	 * @param insertMap 某用户或某角色新添加的权限
	 * 	@param insertMap 某用户或某角色新删除的权限
	 */

	public void renewAllocationPurview(Map<String,Object> insertMap,Map<String,Object> deleteMap){
		
		//判断是否无需添加权限
		if(insertMap.isEmpty()){	
			
			//判断是否无需删除权限
			if(deleteMap.isEmpty()){				
			
			}else{
		
				//只做删除
				dao.batchDelete("jxau.sms.lyx.purview.dao.deletePurview", deleteMap);
			}		
			
		//说明需要添加，那么判断是否无需删除权限
		}else if(deleteMap.isEmpty()){			
			
			//只做添加
			dao.batchAdd("jxau.sms.lyx.purview.dao.addPurview",insertMap);
			
		}else{			
			
			//全部都做，而且包含事务回滚
			dao.batchDelete("jxau.sms.lyx.purview.dao.deletePurview", deleteMap);			
			dao.batchAdd("jxau.sms.lyx.purview.dao.addPurview",insertMap);
			
		}		
	}

	@Override
	public <T> List<T> searchByAccurate(Map<String, Object> param,
			PageVo pageVo, int status) {
		// TODO Auto-generated method stub
		return null;
	}

}
