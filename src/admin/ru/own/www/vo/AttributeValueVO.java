package admin.ru.own.www.vo;

import admin.ru.own.www.entity.AttributeValue;

public class AttributeValueVO {
	private AttributeValue atrValue;
	private boolean have;//当前产品是否包含这个属性值.
	
	public AttributeValue getAtrValue() {
		return atrValue;
	}
	public void setAtrValue(AttributeValue atrValue) {
		this.atrValue = atrValue;
	}
	public boolean isHave() {
		return have;
	}
	public void setHave(boolean have) {
		this.have = have;
	}
	
}
