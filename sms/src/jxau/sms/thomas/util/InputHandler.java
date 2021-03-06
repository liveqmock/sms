/**
* @package_name   com.stuManSys.utility
* @file_name InputHandler.java
* @author Administrator
* @date 2014-4-13
*/

package jxau.sms.thomas.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import jxau.sms.commom.vo.AdvanceSearchVo;
import jxau.sms.globaldao.Dao;
import jxau.sms.thomas.exception.POIException;
import jxau.sms.thomas.vo.StuAdvVo;

import org.apache.poi.hssf.record.PageBreakRecord.Break;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

/** 
 * @ClassName: InputHandler
 * @Description: 用于导入文件处理，调用inputExcel方法实现导入
 */
/**
 * @author Administrator
 *
 */
public class InputHandler{

	//private String filePath;
	private HSSFSheet sheet;
	private List<AdvanceSearchVo> inputAttr; //符合条件的属性;
	private String abstractId;	//视图的抽象编号
	private String viewType;	//视图的类型
	//private Dao dao;
	private final String mapperId = "inputid";
	
	public InputHandler(String abstractId){
		//this.filePath = filePath;
		this.abstractId = abstractId;
	}
	
	/*@Resource(name="dao")
	public void setDao(Dao dao){
		this.dao = dao;
	}*/

	private int getTotalCount(String filePath){
		//POIFSFileSystem fs;
		File file = new File(filePath);
		FileInputStream fin = null;
		int totalRow = 0;
		try {
			fin = new FileInputStream(filePath);
			//fs = new POIFSFileSystem(fin);
			byte[] buf = org.apache.commons.io.IOUtils.toByteArray(fin);
			ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(buf);
			HSSFWorkbook workbook=new HSSFWorkbook(byteArrayInputStream);//创建工作薄
			sheet=workbook.getSheetAt(0);//得到工作表
			totalRow =sheet.getLastRowNum();//得到excel的总记录条数
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalRow;
	}
	public  List<AdvanceSearchVo> getInAttribute(){
		HashMap<String,List<AdvanceSearchVo>> attributes = XmlHandler.iterateTree();
		inputAttr = new ArrayList<AdvanceSearchVo>();
		for (Entry<String, List<AdvanceSearchVo>> itemAttr:attributes.entrySet())
		{
			if(itemAttr.getKey().equals(abstractId)){
				for (int i = 0; i < itemAttr.getValue().size(); i++) {
					viewType = itemAttr.getValue().get(i).getViewType();
					inputAttr.add(itemAttr.getValue().get(i));
				}
			}
		}
		return inputAttr;
	}
	public <T> List<T> initiateObject(List<T> attributes,int count) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		//List<viewType> attributes = new ArrayList<StuAdvVo>();
		for (int i = 0; i < count; i++) {
			T object = (T)Class.forName(viewType).newInstance();
			attributes.add(object);
		}
		return attributes;
	}
	public <T> void transferFormation(Field field, HSSFCell cell,T attribute) throws IllegalArgumentException, IllegalAccessException{
		//String fieldType = field.getType().getName();
		HSSFRow firstRow=sheet.getRow(0);
		String columnName = firstRow.getCell(cell.getCellNum()).getStringCellValue();
		if (cell.getCellType() == 0) {
			double cellValue = cell.getNumericCellValue();
			if (columnName.equals("学号")) {
				field.set(attribute, String.valueOf(Math.round(cellValue)));
			}else if (HSSFDateUtil.isCellDateFormatted(cell)) {
				if (cell.getCellStyle().getDataFormat() == 14) {
					DateFormat dateFormat = new SimpleDateFormat("yyyyMM");
					Date date = cell.getDateCellValue();
					System.out.print(dateFormat.format(cell.getDateCellValue()));
					field.set(attribute,dateFormat.format(cell.getDateCellValue()));
				}else {
					throw new POIException("时间格式错误!");
					//System.out.print("时间格式错误!");
				}
			}else{
				field.set(attribute, (int)cellValue);
			}
		}else if (cell.getCellType() == 1) {
			String cellValue = cell.getStringCellValue();
			if ( inputAttr.get(cell.getCellNum()).getProperties().containsKey(cellValue)
					&&(! inputAttr.get(cell.getCellNum()).getProperties().containsValue(null))) {
				field.set(attribute, Integer.parseInt(inputAttr.get(cell.getCellNum()).getProperties().get(cellValue).toString()));
			}else {
				field.set(attribute,cellValue);
			}
		}else{
			throw new POIException("数据项不能为空");
			//System.out.print("数据项不能为空!");
		}
	}
	
	public <T> List<T> setAttributes(List<T> attributes,String filePath) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		getInAttribute();
		int count = getTotalCount(filePath);
		for (int i = 0; i < count; i++) {
			T object = (T)Class.forName(viewType).newInstance();
			attributes.add(object);
		}
		//System.out.print(b)
		Field[] fields = attributes.get(0).getClass().getDeclaredFields();
		for(int i=1;i<=getTotalCount(filePath);i++){
			 HSSFRow row=sheet.getRow(i);
			 for (int j = 0; j < fields.length; j++) {
				 HSSFCell cell=row.getCell(j);
				 System.out.print(cell.getCellType());
				fields[j].setAccessible(true);
				try {
					 transferFormation(fields[j], cell, attributes.get(i - 1));
						//fields[j].set(attributes.get(i-1),cell.getRichStringCellValue().toString());
						//转化属性的格式
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		 }
		 return attributes;
	}
	
	public <T> int inputExcel(List<T> attributes,String filePath,Dao dao) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		dao.batchAdd(MapperUtility.getMapperId(abstractId,mapperId),setAttributes(attributes,filePath));
		return attributes.size();
	}

}
