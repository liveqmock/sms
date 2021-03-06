package jxau.sms.thomas.advanceinfo.service.imple;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.mchange.v1.identicator.IdList;

import jxau.sms.abstration.AbstractionService;
import jxau.sms.anping.exception.ParameterNotMatchException;
import jxau.sms.commom.vo.PageVo;
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.globaldao.Dao;
import jxau.sms.thomas.exception.ClassNotFoundException;
import jxau.sms.thomas.exception.CommonErrorException;
import jxau.sms.thomas.exception.NullPointerException;
import jxau.sms.thomas.exception.POIException;
import jxau.sms.thomas.po.AdvItem;
import jxau.sms.thomas.po.StuAdvInfo;
import jxau.sms.thomas.util.InputHandler;
import jxau.sms.thomas.util.OutputHandler;
import jxau.sms.thomas.vo.StuAdvVo;
import jxau.sms.util.chenjiang.exception.NullPonterException;
import jxau.sms.util.chenjiang.exception.ParamWrongException;
import jxau.sms.util.chenjiang.exception.TypeNotMatchException;

@Service("advanceServiceImple")
public class AdvanceServiceImple extends AbstractionService implements GlobalServiceInterface{

	private Dao dao;
	private final String nameSpace = "jxau.sms.advanceinfo.dao.";
	
	@Resource(name="dao")
	public void setDao(Dao dao){
		this.dao = dao;
	}

	private boolean checkParams(Map<String, Object> param,Class Vo){
		boolean flag = false;
		Set<String> query = param.keySet();
		//System.out.print(query);
		Field[] fields = Vo.getDeclaredFields();
		for (String condition:query) {
			flag = false;
			for (int i = 0; i < fields.length; i++) {
				if (condition.endsWith(fields[i].getName())) {
					flag = true;
					break;
				}
			}
		}	
		//}
		return flag;
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
		StuAdvInfo stuAdvInfo = new StuAdvInfo();
		//stuAdvInfo = dao.selectOne("jxau.sms.advanceinfo.dao.queryAdvInfo", param);
		return (T) stuAdvInfo;
	}
	
	@Override
	public <StuAdvVo> List<StuAdvVo> searchByAccurate(Map<String, Object> param,
			PageVo pageVo, int status) {
		// TODO Auto-generated method stub
		List<StuAdvVo> stuAdvVo = null;
		int currentpage = pageVo.getCurrentPage();
		if (currentpage<=0) {
			throw new CommonErrorException("page不能小于0");
		}
		if (!param.isEmpty()) {
			if (checkParams(param,StuAdvInfo.class)) {
				param.put("start", pageVo.getFirstIndex());
				param.put("number", pageVo.getSize());
				stuAdvVo = new ArrayList<StuAdvVo>();
				stuAdvVo = dao.select(nameSpace+"queryAdvInfoPage", param);
				long totalNumv = (long)dao.selectOne(nameSpace+"queryTotalNumber", param);
				pageVo.setCount(totalNumv);
			}else{
				throw new CommonErrorException("查询条件不存在！");
			}
		}else {
			throw new NullPointerException("查询条件不能为空！");
		}
		return stuAdvVo;
	}

	@Override
	public <T> int add(Class T, Object object) {
		// TODO Auto-generated method stub
		
		if(jxau.sms.thomas.po.StuAdvInfo.class != T )
			throw new ParamWrongException("传入的参数T 必须是 StuAdvInfo.class");
		
		int flag = 0;
		if(object == null) 
			throw new NullPonterException("传入对象不能为null");
		if(object.getClass() == T) {
			jxau.sms.thomas.po.StuAdvInfo s = (jxau.sms.thomas.po.StuAdvInfo) object;
			if(s.getStudentNo() == null ||s.getAdvanceActivity()==null||s.getAdvLevel() == null
					|| s.getAdvTime() == null|| s.getExamState()==null||s.getRemarks() == null)  {
				throw new ParameterNotMatchException("添加的评优评先信息部分不能为空，请认真重新填写！");
			}
			dao.add(nameSpace+"addAdvInfo", object);
			flag = 1;
		}
		else if(object instanceof List<?>)  {
			@SuppressWarnings("unchecked")
			List<StuAdvInfo> lists = (List<StuAdvInfo>)object;
			if(lists.get(0).getClass() != T)
				throw new TypeNotMatchException("类型不一致");
			
			for(int i=0;i<lists.size();i++) {
				jxau.sms.thomas.po.StuAdvInfo s = (jxau.sms.thomas.po.StuAdvInfo) lists.get(i);
				if(s.getStudentNo() == null ||s.getAdvanceActivity()==null||s.getAdvLevel() == null
						|| s.getAdvTime() == null|| s.getExamState()==null||s.getRemarks() == null) {
					throw new ParameterNotMatchException("添加的评优评先信息部分不能为空，请认真重新填写！");
				}
			}
			dao.add(nameSpace+"bathcAddAdvInfo", lists);
			flag = lists.size();
		}
		else throw new TypeNotMatchException("类型不一致");
		
		return flag;
	}

	@Override
	public <T> int update(Class T, Map<String, Object> param) {
		// TODO Auto-generated method stub
			return 0;	
	}
	public <StuActParticipate> int update(Class T, Object object) {
		if(jxau.sms.thomas.po.StuAdvInfo.class != T )
			throw new ParamWrongException("传入的参数T 必须是 StuAdvInfo.class");
		int flag = 0;
		if(object == null) 
			throw new NullPonterException("传入对象不能为null");
		if(object.getClass() == T) {
			
			jxau.sms.thomas.po.StuAdvInfo s = (jxau.sms.thomas.po.StuAdvInfo)object;
			if(s.getAwardNo()== 0) {
				throw new ParameterNotMatchException("更新的学生评优评优记录信息的id不能为空或0,请重新传入参数!");
			}
			dao.update(nameSpace+"updateAdvInfo", s);
			flag = 1;
		}
		else if(object instanceof List<?>)  {
			List<jxau.sms.thomas.po.StuAdvInfo> lists = (List<jxau.sms.thomas.po.StuAdvInfo>)object;
			if(lists.get(0).getClass() != T)
				throw new TypeNotMatchException("类型不一致");
			
			for(int i=0;i<lists.size();i++) {
				jxau.sms.thomas.po.StuAdvInfo s = (jxau.sms.thomas.po.StuAdvInfo) lists.get(i);
				if(s.getAwardNo() == 0) {
					throw new ParameterNotMatchException("更新的学生评优评优记录信息的id不能为空或0,请重新传入参数!");
				}
			}
			dao.batchUpdate(nameSpace+"updateAdvInfo", lists);
			flag = lists.size();
		}
		else throw new TypeNotMatchException("类型不一致");
		return flag;		
	}
	@SuppressWarnings("hiding")
	@Override
	public <StuAdvInfo> int delete(Class T, Map<String, Object> param) {
		// TODO Auto-generated method stub
		if(jxau.sms.thomas.po.StuAdvInfo.class != T )
			throw new ParamWrongException("传入的参数T 必须是 StuAdvInfo.class");
		int flag = 0;
		if (param==null) {
			throw new CommonErrorException("参数不能为空");
		}
		if (param.containsKey("awardNo")) {
			@SuppressWarnings("unchecked")
			List<Integer> awards =  (List<Integer>)param.get("awardNo");
			dao.batchDelete(nameSpace+"deleteAdvInfo", awards);
			flag = awards.size();
		}else {
			throw new CommonErrorException("key必须是awardNo");
		}
		return  flag;
	}

	@Override
	public <T> List<T> getWaitingForLists(Map<String, Object> params,
			PageVo pageVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> int roleEntry(Class<?> c, Object entryObject, String moduleId,
			String roleId, String level) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public <T> List<T> getInputExcel(String abstractId,List<T> attributes,String filePath) throws InstantiationException, IllegalAccessException{
		try {
			super.inputExcel(abstractId, attributes, filePath);
		}catch (java.lang.ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return attributes;
	}
	
	public <T> int inputExcel(List<T> attributes) throws InstantiationException, IllegalAccessException{
		int flag = 1;
		if (attributes == null) {
			flag = 0;
			throw new POIException("属性不能为空!");
		}
		dao.batchAdd(nameSpace+"batchAddAdvInfo",attributes);
		return flag;
	}
	
	public <T> int exportExcel(String filePath,String abstractId,List<T> rows) throws IOException {
		if (rows == null||rows.size()==0) {
			throw new POIException("属性不能为空！");
		}
		return super.exportExcel(filePath,abstractId,rows);
	}
	
}
