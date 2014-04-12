package jxau.sms.globalService;

import java.util.Map;
 

public interface GlobalServiceInterface {
 
    /**
     * 精确查询
     * @param param  传入的是你的查询条件 如 (studentNo , 20111429)
     * @param status  是状态，如禁用启用
     * @return 返回的是一条数据
     */
	public <T> T  searchByAccurate(Map<String,Object> param,int status);
	
	/**
	 * 
	 * @param param  你需要查询的条件
	 * @param currentPage  当前的页面
	 * @param pageSize    一个页面显示多少数据  currentPage和pageSize是用来计算拿取数据的位置和个数的
	 * @param status  是状态，如禁用启用
	 * @return    返回的是一个queryResult 
	 */
	public <T> T  searchByAccurate(Map<String,Object> param,int currentPage,int pageSize,int status);
	
	/**
	 * 添加  可以通过插入的对象是单个还是批量在实现的时候
	 * @param object 可以是vo po list
	 * @param T  是为了在做添加的时候做判断用户是不是传入了正确的对象
	 * @return 1表示成功，0表示失败
	 */
	public <T> int  add(Class T,Object object);
 
	
	/**
	 * 更新对象可以是批量更新和单个对象更新，内部的逻辑自己处理
	 * @param param   传入需要更新的字段和值
	 * @param T 是为了在更新的时候判断用户是不是传入了正确的对象
	 * @return
	 */
	public <T> int update(Class T,Map<String,Object> param);
	
	/**
	 * 更新对象可以是批量更新和单个对象更新，内部的逻辑自己处理
	 * @param param  删除需要传入的数据
	 * @param T 是为了在更新的时候判断用户是不是传入了正确的对象
	 * @return 
	 */
	public <T> int delete(Class T,Map<String,Object> param);
}