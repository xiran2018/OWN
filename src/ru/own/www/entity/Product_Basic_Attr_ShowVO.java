package ru.own.www.entity;

import java.util.List;

import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.Product_Basic_Attr;

public class Product_Basic_Attr_ShowVO {
	private int attrId;//属性id
	private String attrName;//属性名称
	private int input_style; //该属性的输入方式
	private short is_sku;//是否sku属性
	private List<AttributeValue> attrValues; //属性值
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
	public List<AttributeValue> getAttrValues() {
		return attrValues;
	}
	public void setAttrValues(List<AttributeValue> attrValues) {
		this.attrValues = attrValues;
	}
	public short getIs_sku() {
		return is_sku;
	}
	public void setIs_sku(short is_sku) {
		this.is_sku = is_sku;
	}
	
	
	
}
