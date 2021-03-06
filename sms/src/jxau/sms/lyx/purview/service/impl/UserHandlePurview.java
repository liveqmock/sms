package jxau.sms.lyx.purview.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import jxau.sms.lyx.po.TeacherPurview;
import org.springframework.stereotype.Service;

/**
 * 
 * @author lyx
 * 2014-4-14
 * TODO:
 * 		对用户分配权限的处理
 */
@Service("UserHandlePurview")
public class UserHandlePurview implements AllocationPurviewStandard {

	private UserPurviewManagerServiceImpl upms;
	
	@Resource(name="UserPurviewManagerServiceImpl")
	public void setUpms(UserPurviewManagerServiceImpl upms) {
		this.upms = upms;
	}
	
	//用户权限增删操作
	@Override
	public void handleAllocationPurview(String number, List<Integer> newList,
			List<Integer> oldList) {
		// TODO Auto-generated method stub

		List<TeacherPurview> insertTeacherPurview = new ArrayList<TeacherPurview>();
		List<TeacherPurview> deleteTeacherPurview = new ArrayList<TeacherPurview>();
		
		logicJudgment(TeacherPurview.class,insertTeacherPurview,deleteTeacherPurview,newList,oldList,number);
		
	}

	//用户权限增删操作业务封装
	@Override
	public <TeacherPurview> void logicJudgment(Class TeacherPurview, List<TeacherPurview> insertList,
			List<TeacherPurview> deleteList, List<Integer> newList, List<Integer> oldList,
			String number) {
		// TODO Auto-generated method stub
		if(newList.size()!=0){			
			for(int i=0;i<newList.size();i++){
				jxau.sms.lyx.po.TeacherPurview tp;
				try {
					tp = (jxau.sms.lyx.po.TeacherPurview) TeacherPurview.newInstance();
					tp.setTeacherNo(number);
					tp.setPurviewNo(newList.get(i));
					insertList.add((TeacherPurview) tp);
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
			}	
	}
		
	
	if(oldList.size()!=0){	
			for(int i=0;i<oldList.size();i++){
				jxau.sms.lyx.po.TeacherPurview tp;
				try {
					tp = (jxau.sms.lyx.po.TeacherPurview) TeacherPurview.newInstance();
					tp.setTeacherNo(number);
					tp.setPurviewNo(oldList.get(i));
					deleteList.add((TeacherPurview) tp);
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
		}	

					MapPutList(insertList,deleteList);
	}
	
	//map转换为list
	public <TeacherPurview> void MapPutList(List<TeacherPurview> insertList,List<TeacherPurview> deleteList){
		
		HashMap<String,Object> insertMap = new HashMap<String,Object>();
		HashMap<String,Object> deleteMap = new HashMap<String,Object>();

		
		if(!(insertList.isEmpty())){
			insertMap.put("addTeacherPurviewList",insertList);
		}
		
		if(!(deleteList.isEmpty())){
			deleteMap.put("delTeacherPurviewList",deleteList);
		}
				
		upms.renewAllocationPurview(insertMap, deleteMap);
		
	}

}
