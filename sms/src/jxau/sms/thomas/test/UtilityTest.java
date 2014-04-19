package jxau.sms.thomas.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxau.sms.globaldao.Dao;
import jxau.sms.thomas.po.StuAdvInfo;
import jxau.sms.thomas.util.InputHandler;
import jxau.sms.thomas.util.MapperUtility;
import jxau.sms.thomas.vo.StuAdvVo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UtilityTest {
	

	public void testAdvanceSearch(){
		
	}
	public void testOutput(){
		Map< String, Object> params = new HashMap<String, Object>();
		//params.put("studentNo", "20111826");
		//System.out.print(dao.selectOne("jxau.sms.advanceinfo.dao.findAdvInfoById", params));
	}
	@Test
	public void testInput() throws ClassNotFoundException, InstantiationException, IllegalAccessException{
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		Dao dao = (Dao) applicationContext.getBean("dao");
		InputHandler inputHandler = new InputHandler("D://workbook.xls","0100");
		List<StuAdvVo> attributes = new ArrayList<StuAdvVo>();
		//StuAdvVo stuAdvVo = new StuAdvVo();
		/*try {
			for (int i = 0; i < 2; i++) {
				System.out.print(inputHandler.setAttributes(attributes).get(i).getStudentNo());
			}
			
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		System.out.print(inputHandler.inputExcel(attributes,"0100", dao));
	}
	public void testInitiateObject() throws ClassNotFoundException{
		InputHandler inputHandler = new InputHandler("D://workbook.xls","0100");
		List<StuAdvVo> attributes = new ArrayList<StuAdvVo>();
		System.out.print(inputHandler.getInAttribute().get(0).getViewType());
		try {
			System.out.print(inputHandler.initiateObject(attributes,2).get(0));
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void testMapperUtility(){
		System.out.print(MapperUtility.getMapperId("0101", "inputid"));
	}
}
