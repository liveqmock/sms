package jxau.sms.lyx.purviewManage.po;

/**
 * 
 * @author lyx
 * 2014-4-12
 * TODO:
 * 		权限信息实体表
 */
public class PurviewInfo {

		private int id;											//编号
		private int pid;											//上级权限编号
		private String purviewName;				//权限名称
		private String purviewUrl;						//权限请求
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getPid() {
			return pid;
		}
		public void setPid(int pid) {
			this.pid = pid;
		}
		public String getPurviewName() {
			return purviewName;
		}
		public void setPurviewName(String purviewName) {
			this.purviewName = purviewName;
		}
		public String getPurviewUrl() {
			return purviewUrl;
		}
		public void setPurviewUrl(String purviewUrl) {
			this.purviewUrl = purviewUrl;
		}

}
