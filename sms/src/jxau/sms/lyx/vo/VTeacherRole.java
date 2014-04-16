package jxau.sms.lyx.vo;

import java.util.Date;
import java.util.List;

import jxau.sms.lyx.po.RoleInfo;

/**
 * 
 * @author lyx
 * 2014-4-16
 * TODO:
 * 		用户权限VO 
 */
public class VTeacherRole {

		private String teacherNo;  				//教师工号
		private String teacherName;  			//教师姓名 
		private int sex; 									//性别
		private String political;                     //政治面貌
		private String department;				//部门
		private String teacherTitle;				//教师职称
		private Date worktime;						//入职时间
		private List<RoleInfo> roleList;		//角色列表
		
		public String getTeacherNo() {
			return teacherNo;
		}
		public void setTeacherNo(String teacherNo) {
			this.teacherNo = teacherNo;
		}
		public String getTeacherName() {
			return teacherName;
		}
		public void setTeacherName(String teacherName) {
			this.teacherName = teacherName;
		}
		public int getSex() {
			return sex;
		}
		public void setSex(int sex) {
			this.sex = sex;
		}
		public String getPolitical() {
			return political;
		}
		public void setPolitical(String political) {
			this.political = political;
		}
		public String getDepartment() {
			return department;
		}
		public void setDepartment(String department) {
			this.department = department;
		}
		public String getTeacherTitle() {
			return teacherTitle;
		}
		public void setTeacherTitle(String teacherTitle) {
			this.teacherTitle = teacherTitle;
		}
		public Date getWorktime() {
			return worktime;
		}
		public void setWorktime(Date worktime) {
			this.worktime = worktime;
		}
		public List<RoleInfo> getRoleList() {
			return roleList;
		}
		public void setRoleList(List<RoleInfo> roleList) {
			this.roleList = roleList;
		}

}
