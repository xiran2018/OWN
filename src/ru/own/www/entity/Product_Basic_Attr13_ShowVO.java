/**  
* This class is used for ...  
* @author jingquanliang
* @version  
*       1.0, 2015年1月17日 下午8:33:39  
*/   
package ru.own.www.entity;

import java.util.List;

import admin.ru.own.www.entity.AttributeValue;

public class Product_Basic_Attr13_ShowVO 
{
	private int p_basic_attr_id;//基本属性id
	private int attrId;//属性id
	private String attrName;//属性名称
	private int input_style; //该属性的输入方式
	private short is_sku;//是否sku属性
	private AttributeValue attrValues; //属性值
	public int getAttrId() {
		return attrId;
	}
	public void setAttrId(int attrId) {
		this.attrId = attrId;
	}
	public String getAttrName() {
		return attrName;
	}
	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	public int getInput_style() {
		return input_style;
	}
	public void setInput_style(int input_style) {
		this.input_style = input_style;
	}
	public void setAttrValues(AttributeValue attrValues) {
		this.attrValues = attrValues;
	}

	public AttributeValue getAttrValues() {
		return attrValues;
	}
	public short getIs_sku() {
		return is_sku;
	}
	public void setIs_sku(short is_sku) {
		this.is_sku = is_sku;
	}
	public int getP_basic_attr_id() {
		return p_basic_attr_id;
	}
	public void setP_basic_attr_id(int p_basic_attr_id) {
		this.p_basic_attr_id = p_basic_attr_id;
	}
	
}
