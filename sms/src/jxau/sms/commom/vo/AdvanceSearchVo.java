/**
* @package_name   com.sms.common.vo
* @file_name AdvanceSearchVo.java
* @author Administrator
* @date 2014-4-12
*/

package jxau.sms.commom.vo;

import java.util.Map;

/** 
 * @ClassName: AdvanceSearchVo
 * @Description: Used For  
 */
/**
 * @author Administrator
 *
 */
public class AdvanceSearchVo {
	private String viewType; //配置文件视图类型type
	private String colName;		//配置文件中column中的name属性
	private String colValue;	//配置文件中column中的value属性
	private String colMutiply;	//配置文件中column中的multiply属性
	private Map<String,Object> properties;	//配置文件中property中的value和type属性
	
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	public String getColValue() {
		return colValue;
	}
	public void setColValue(String colValue) {
		this.colValue = colValue;
	}
	public String getColMutiply() {
		return colMutiply;
	}
	public void setColMutiply(String colMutiply) {
		this.colMutiply = colMutiply;
	}
	public Map<String, Object> getProperties() {
		return properties;
	}
	public void setProperties(Map<String, Object> properties) {
		this.properties = properties;
	}
	
}
