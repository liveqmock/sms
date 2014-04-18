package jxau.sms.qing.login.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import jxau.sms.qing.exception.LoginException;
import jxau.sms.qing.login.service.LoginService;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller  
@Scope("prototype")
public class LoginAction extends ActionSupport implements ServletResponseAware {	 
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletResponse response;  
	private LoginService loginService;
	private String username;
	private String password;
	 public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public LoginService getLoginService() {
		return loginService;
	}
	@Resource(name="loginService")
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	@Override  
	 public void setServletResponse(HttpServletResponse response) {  
	        this.response = response;  
	  }  
	 
	 @Override  
	 public String execute() throws Exception {  		 	
	        System.out.println("HelloAction.execute is executing..."); 
	        Boolean bool;
	        try{
	        	this.getLoginService().whichUser(username, password);
	        } catch (LoginException e) {
	        	e.printStackTrace();
	        	return ERROR;
	        }
	        return SUCCESS; 
	      
	 }  
	 
	 public void say() throws IOException{  
	        System.out.println("HelloAction.say is executing....");  
	        response.setContentType("text/html;charset=utf-8");  
	        PrintWriter out = response.getWriter();  
	        out.println("<span style='color:red;'>啊哈，We are here!</span>");  
	        out.close();  
	      
	 }  

}
