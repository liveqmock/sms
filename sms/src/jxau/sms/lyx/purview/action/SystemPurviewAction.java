package jxau.sms.lyx.purview.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import jxau.sms.lyx.po.PurviewInfo;
import jxau.sms.lyx.po.RoleInfo;
import jxau.sms.lyx.purview.service.impl.PurviewListPackage;
import jxau.sms.lyx.purview.service.impl.SystemPurviewServiceImpl;
import jxau.sms.lyx.purview.service.impl.UserPurviewManagerServiceImpl;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller  
@Scope("prototype")
public class SystemPurviewAction extends ActionSupport implements ModelDriven<RoleInfo>{

	private static final long serialVersionUID = 1L;

	private UserPurviewManagerServiceImpl upms;
	private SystemPurviewServiceImpl spsi;
	private PurviewListPackage plp;
	private RoleInfo roleInfo = new RoleInfo();
	
	@Resource(name="PurviewListPackage")
	public void setPlp(PurviewListPackage plp) {
		this.plp = plp;
	}

	@Resource(name="SystemPurviewServiceImpl")
	public void setSpsi(SystemPurviewServiceImpl spsi) {
		this.spsi = spsi;
	}
	
	@Resource(name="UserPurviewManagerServiceImpl")
	public void setUpms(UserPurviewManagerServiceImpl upms) {
		this.upms = upms;
	}

	private List<PurviewInfo> purviewList = new ArrayList<PurviewInfo>();
	private List<PurviewInfo> checkList = new ArrayList<PurviewInfo>();
	String roleNo = ServletActionContext.getRequest().getParameter("roleNo");
	String teacherNo = ServletActionContext.getRequest().getParameter("teacherNo");
	String param = ServletActionContext.getRequest().getParameter("array");
	
	public List<PurviewInfo> getPurviewList() {
		return purviewList;
	}
	public void setPurviewList(List<PurviewInfo> purviewList) {
		this.purviewList = purviewList;
	}
	public List<PurviewInfo> getCheckList() {
		return checkList;
	}
	public void setCheckList(List<PurviewInfo> checkList) {
		this.checkList = checkList;
	}
	
	public String showPurviewByCondition() throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(roleNo==null){
			
			map.put("teacherNo", teacherNo);
			
		}else if(teacherNo==null){
			
			map.put("roleNo", roleNo);
			
		}
		
		List<PurviewInfo> purviewLists = spsi.searchListByAccurate(null, 0);
		this.setPurviewList(purviewLists);
		
		List<PurviewInfo> checkLists = upms.searchListByAccurate(map, 0);
		this.setCheckList(checkLists);
		
		return SUCCESS;
	}
	
	public String renewPurview() throws Exception{
		
		System.out.println(roleNo+"roleNo");
		System.out.println("String"+param);
		
		if(roleNo==null){
			
			plp.containerTransform(teacherNo, param);
			
		}else if(teacherNo==null){
			
			plp.containerTransform(roleNo, param);
			
		}
				
		return SUCCESS;
		
		
	}

	@Override
	public RoleInfo getModel() {
		// TODO Auto-generated method stub
		return roleInfo;
	}
	
}