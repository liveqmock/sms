package jxau.sms.commom.vo;

import java.util.List;

public class PropVo {

	private List<Integer> numbers;		//比例分配的人数
	private List<Double> proportion;	//项目输入的比例
	private List<Integer> itemId;	//先进项目的编号
	private int level;		//比例分配的类型，包括0表示院级和1表示校级 
	
	public List<Integer> getNumbers() {
		return numbers;
	}
	public void setNumbers(List<Integer> numbers) {
		this.numbers = numbers;
	}
	public List<Double> getProportion() {
		return proportion;
	}
	public void setProportion(List<Double> proportion) {
		this.proportion = proportion;
	}
	public List<Integer> getItemId() {
		return itemId;
	}
	public void setItemId(List<Integer> itemId) {
		this.itemId = itemId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
}
