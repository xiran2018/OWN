package admin.ru.own.www.vo;

import java.util.List;

import admin.ru.own.www.entity.Attribute;

public class AttributeVO {
	private Attribute atr;
	private List<AttributeValueVO> valueList;
	private String catecoryName;
	
	public Attribute getAtr() {
		return atr;
	}
	public void setAtr(Attribute atr) {
		this.atr = atr;
	}
	
	public List<AttributeValueVO> getValueList() {
		return valueList;
	}
	public void setValueList(List<AttributeValueVO> valueList) {
		this.valueList = valueList;
	}
	
	public String getCatecoryName() {
		return catecoryName;
	}
	public void setCatecoryName(String catecoryName) {
		this.catecoryName = catecoryName;
	}
	
}
