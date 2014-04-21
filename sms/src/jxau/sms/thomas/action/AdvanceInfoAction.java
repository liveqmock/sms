package jxau.sms.thomas.action;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import jxau.sms.commom.vo.PageVo;
import jxau.sms.globalService.GlobalServiceInterface;
import jxau.sms.thomas.advanceinfo.service.imple.AdvanceServiceImple;
import jxau.sms.thomas.po.StuAdvInfo;
import jxau.sms.thomas.vo.StuAdvVo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller  
@Scope("prototype") 
public class AdvanceInfoAction extends ActionSupport {

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
		private AdvanceServiceImple advanceServiceImple;
		
		@Resource(name="advanceServiceImple")
		public void setAdvanceServiceImple(AdvanceServiceImple advanceServiceImple) {
			this.advanceServiceImple = advanceServiceImple;
		}
		
		public String showStuAdvInfo(){
			 
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("studentNo", "20111826");
			stuAdvVo = advanceServiceImple.searchByAccurate(param, pageVo,0);
			return SUCCESS;
		}
		
		private List<StuAdvVo> stuAdvVo = null;
		private PageVo pageVo = new PageVo();
		
		public List<StuAdvVo> getStuAdvVo() {
			return stuAdvVo;
		}

		public void setStuAdvVo(List<StuAdvVo> stuAdvVo) {
			this.stuAdvVo = stuAdvVo;
		}

		public PageVo getPageVo() {
			return pageVo;
		}

		public void setPageVo(PageVo pageVo) {
			this.pageVo = pageVo;
		}

		//private StuAdvInfo stuAdvInfo = new StuAdvInfo();
		private int currentPage = 1;
		private Map<String, Object> session = ActionContext.getContext()
						.getSession();
				// 获取strtus2的request
		@SuppressWarnings("unchecked")
		private Map<String, Object> request = (Map<String, Object>) ActionContext
						.getContext().get("request");
				// 获取strtus2 的参数
		private Map<String, Object> parameters = ActionContext.getContext()
						.getParameters();
}
