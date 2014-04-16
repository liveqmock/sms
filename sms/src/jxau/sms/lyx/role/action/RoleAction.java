package jxau.sms.lyx.role.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import jxau.sms.commom.vo.PageVo;
import jxau.sms.lyx.po.RoleInfo;
import jxau.sms.lyx.role.service.impl.RoleServiceImpl;

import com.opensymphony.xwork2.ActionSupport;

@Controller  
@Scope("prototype")
public class RoleAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private RoleServiceImpl roleServiceImpl;
	
	@Resource(name="RoleServiceImpl")
	public void setRoleServiceImpl(RoleServiceImpl roleServiceImpl) {
		this.roleServiceImpl = roleServiceImpl;
	}

	private List<RoleInfo> roleInfoList = new ArrayList<RoleInfo>();
		
	public List<RoleInfo> getRoleInfoList() {
		return roleInfoList;
	}

	public void setRoleInfoList(List<RoleInfo> roleInfoList) {
		this.roleInfoList = roleInfoList;
	}



	public String roleExecute() throws Exception{
		
		PageVo pageVo = new PageVo();
		pageVo.setSize(4);
		List<RoleInfo> roleInfos = roleServiceImpl.searchByAccurate(null, pageVo, 0);
		this.setRoleInfoList(roleInfos);
		return SUCCESS;
	}
	
}