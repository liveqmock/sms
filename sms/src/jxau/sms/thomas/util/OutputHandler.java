/**
 * @package_name   com.stuManSys.utility
 * @file_name POIHandler.java
 * @author Administrator
 * @date 2014-3-18
 */

package jxau.sms.thomas.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.swing.JOptionPane;

import jxau.sms.commom.vo.AdvanceSearchVo;
import jxau.sms.thomas.vo.StuAdvVo;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFooter;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.dom4j.Element;


/** 
 * @ClassName: POIHandler
 * @Description: TODO
 */
/**
 * @author Administrator
 * 
 */
public class OutputHandler {

	private HashMap<String,List<AdvanceSearchVo>> attributes;     //最后获取的属性字段
	private List<AdvanceSearchVo> advanceAttr; //符合条件的属性;
	private String abstractId;	//视图的抽象编号
	
	private static HSSFWorkbook demoWorkBook = new HSSFWorkbook();
	private static HSSFSheet demoSheet = demoWorkBook.createSheet("学生工作管理系统");

	public OutputHandler(String abstractId){
		this.abstractId = abstractId;
	}

	private List<AdvanceSearchVo> getAdvAttribute(){
		attributes = XmlHandler.iterateTree();
		advanceAttr = new ArrayList<AdvanceSearchVo>();
		for (Entry<String, List<AdvanceSearchVo>> itemAttr:attributes.entrySet())
		{
			if(itemAttr.getKey().length()>4||itemAttr.getKey().equals(abstractId)){
				for (int i = 0; i < itemAttr.getValue().size(); i++) {
					advanceAttr.add(itemAttr.getValue().get(i));
				}
			}
		}
		return advanceAttr;
	}

	private String generateTitle(){
		HSSFHeader header = demoSheet.getHeader();
		header.setCenter("111");
		HSSFRow headerRow = demoSheet.createRow((short) 0);
		int i = 0;
		for (int j = 0; j < advanceAttr.size(); j++) {
			getAdvAttribute();
			HSSFCell headerCell = headerRow.createCell((short) j);
			headerCell.setCellValue(advanceAttr.get(j).getColValue());
		}
		return "excel头文件成功";
	};

	private <T> String createTableRow(List<T> rows) {
		if (rows.equals(null) || rows.size() == 0) {
			return null;
		} else {
			int count = 0;
			Method[] methods = rows.get(0).getClass().getDeclaredMethods();
			
			for (int k = 0; k < methods.length; k++) {
				if (methods[k].getName().startsWith("get")) {
					methods[count] = methods[k];
					count++;
				}
			}
			for (int j = 1; j < rows.size()+1; j++) {
				HSSFRow row = demoSheet.createRow((short) j);
				System.out.print(advanceAttr.size());
				for (short i = 0; i < advanceAttr.size(); i++) {
					HSSFCell cell = row.createCell((short) i);
					try {
						cell.setCellValue("test");
						//methods[i].invoke(rows.get(j-1)).toString())
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			return "excel内容创建成功";
		}
	}
	private <T> void createExcelSheeet(List<T> rows){
		generateTitle();
		createTableRow(rows);
	}
/*	public void transferFormation(Field field){
		if (field.getType().getName().equals(java.lang.String.class.getName())) {
				
		}else if (field.getType().getName().equals(java.lang.Integer.class.getName())) {
				
		}else if (field.getType().getName().equals(java.lang.Double.class.getName())) {
				
		}else if (field.getType().getName().equals(java.util.Date.class.getName())) {
				
		}else {
				
		}
	}*/
	public void exportExcel(HSSFSheet sheet,OutputStream os) throws IOException   
	{   
	    sheet.setGridsPrinted(true);   
	    HSSFFooter footer = sheet.getFooter();   
	    footer.setRight("Page " + HSSFFooter.page() + " of " +   
	            HSSFFooter.numPages());   
	    demoWorkBook.write(os);   
	}   
	
	
	public static void main(String[] args) {   
	    String fileName = "D:\\workbook.xls"; 
	    FileOutputStream fos = null;   
	    try {   
	    	OutputHandler poiHandler = new OutputHandler("0100");
	    	ArrayList<StuAdvVo> stuAdvInfos = new ArrayList<StuAdvVo>();
	    	StuAdvVo stuAdvInfo = new StuAdvVo();
	    	stuAdvInfo.setStudentNo("20111826");
	    	stuAdvInfo.setCollege("软件学院");
	    	stuAdvInfo.setProfessionalDirection("软件+英语");
	    	stuAdvInfo.setStuClass("软件1111班");
	    	stuAdvInfo.setSex(1);
	    	stuAdvInfo.setAdvanceActivity("优秀三好学生");
	    	stuAdvInfo.setAdvLevel("校级");
	    	stuAdvInfo.setAdvTime("2013-02-02");
	    	
	    	stuAdvInfos.add(stuAdvInfo);
	    	
	    	
	        fos = new FileOutputStream(fileName); 
	        poiHandler.getAdvAttribute();
	        poiHandler.createExcelSheeet(stuAdvInfos); 
	        poiHandler.exportExcel(demoSheet,fos);   
	        JOptionPane.showMessageDialog(null, "文件名称 : "+fileName);   
	    } catch (Exception e) {   
	        JOptionPane.showMessageDialog(null, "导出错误:"+e);   
	        e.printStackTrace();   
	    } finally {   
	        try {   
	            fos.close();   
	        } catch (Exception e) {   
	            e.printStackTrace();   
	        }   
	    }   
	}   
}
