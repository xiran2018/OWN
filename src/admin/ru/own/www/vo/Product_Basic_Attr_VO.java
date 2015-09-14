package admin.ru.own.www.vo;

import admin.ru.own.www.entity.Product_Basic_Attr;

public class Product_Basic_Attr_VO {
	private Product_Basic_Attr pba;
	private String attr_name;
	private String attr_value_name;
	private int input_style;
	public int getInput_style() {
		return input_style;
	}
	public void setInput_style(int input_style) {
		this.input_style = input_style;
	}
	public Product_Basic_Attr getPba() {
		return pba;
	}
	public void setPba(Product_Basic_Attr pba) {
		this.pba = pba;
	}
	public String getAttr_name() {
		return attr_name;
	}
	public void setAttr_name(String attr_name) {
		this.attr_name = attr_name;
	}
	public String getAttr_value_name() {
		return attr_value_name;
	}
	public void setAttr_value_name(String attr_value_name) {
		this.attr_value_name = attr_value_name;
	}
}
