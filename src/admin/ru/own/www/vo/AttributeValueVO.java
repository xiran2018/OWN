package admin.ru.own.www.vo;

import simple.test.testUser;
import admin.ru.own.www.entity.AttributeValue;

public class AttributeValueVO  implements Comparable<AttributeValueVO>{
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
	
    public int compareTo(AttributeValueVO arg0) {  
        //return this.getOrder().compareTo(arg0.getOrder());  
   	 return this.atrValue.getAttrValueName().compareTo(arg0.getAtrValue().getAttrValueName());
    }  
	
}
