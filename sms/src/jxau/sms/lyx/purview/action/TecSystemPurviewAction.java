package jxau.sms.lyx.purview.action;

import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import jxau.sms.lyx.po.TecBasicInfo;
import jxau.sms.lyx.purview.service.impl.PurviewListPackage;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller  
@Scope("prototype")
public class TecSystemPurviewAction extends ActionSupport implements ModelDriven<TecBasicInfo>{

	private static final long serialVersionUID = 1L;

	private PurviewListPackage plp;
	private TecBasicInfo tecBasicInfo = new TecBasicInfo();
	
	@Resource(name="PurviewListPackage")
	public void setPlp(PurviewListPackage plp) {
		this.plp = plp;
	}

	String teacherNo = ServletActionContext.getRequest().getParameter("teacherNo");	
	String param = ServletActionContext.getRequest().getParameter("array");
		
	/**
	 * 
	 * lyx
	 * TODO:
	 * 			教师修改权限
	 * 下午7:14:10
	 * @return
	 * @throws Exception
	 */
	public String renewPurview() throws Exception{
			
		plp.containerTransform(teacherNo, param);				
		return SUCCESS;
				
	}

	@Override
	public TecBasicInfo getModel() {
		// TODO Auto-generated method stub
		return tecBasicInfo;
	}
	
}
