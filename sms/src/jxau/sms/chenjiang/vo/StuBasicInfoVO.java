package jxau.sms.chenjiang.vo;

import jxau.sms.chenjiang.po.StuBasicInfo;



public class StuBasicInfoVO {
	private String studentNo;
	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	private StuBasicInfo stuBasicInfo;
	
	public String toString() {
		return "\nstuBasicInfo:"+stuBasicInfo;
	}
	
	public StuBasicInfo getStuBasicInfo() {
		return stuBasicInfo;
	}

	public void setStuBasicInfo(StuBasicInfo stuBasicInfo) {
		this.stuBasicInfo = stuBasicInfo;
	}
}
