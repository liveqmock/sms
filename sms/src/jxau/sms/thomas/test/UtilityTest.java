package jxau.sms.thomas.test;

import java.util.ArrayList;
import java.util.List;
import jxau.sms.thomas.po.StuAdvInfo;
import jxau.sms.thomas.util.InputHandler;
import jxau.sms.thomas.util.MapperUtility;
import jxau.sms.thomas.vo.StuAdvVo;

import org.junit.Test;

public class UtilityTest {
	

	public void testAdvanceSearch(){
		
	}
	public void testOutput(){
		
	}
	@Test
	public void testInput(){
		//InputHandler inputHandler = new InputHandler(filePath)
		InputHandler inputHandler = new InputHandler("D://workbook.xls","0100");
		/*for (int i = 0; i < inputHandler.getInAttribute().size(); i++) {
			System.out.print(inputHandler.getInAttribute().get(i).getProperties().get(""));
		}*/
		List<StuAdvVo> attributes = new ArrayList<StuAdvVo>();
		StuAdvVo stuAdvVo = new StuAdvVo();
		attributes.add(stuAdvVo);
		System.out.print(inputHandler.setAttributes(attributes).get(0).getAdvTime());
	}
	
	public void testMapperUtility(){
		System.out.print(MapperUtility.getMapperId("0101", "inputid"));
	}
}