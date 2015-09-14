package admin.ru.own.www.entity;

import java.util.Date;

public class Product_Basic_Attr {
	private int p_basic_attr_id;
	private int p_id;
	private int attr_name_id;
	private int attr_value_id;
	private int is_sku;
	private int sku_id;
	private Date create_time;
	
	public Product_Basic_Attr() {
		
	}
	
	public int getP_basic_attr_id() {
		return p_basic_attr_id;
	}
	public void setP_basic_attr_id(int p_basic_attr_id) {
		this.p_basic_attr_id = p_basic_attr_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getAttr_name_id() {
		return attr_name_id;
	}
	public void setAttr_name_id(int attr_name_id) {
		this.attr_name_id = attr_name_id;
	}
	public int getAttr_value_id() {
		return attr_value_id;
	}
	public void setAttr_value_id(int attr_value_id) {
		this.attr_value_id = attr_value_id;
	}
	public int getIs_sku() {
		return is_sku;
	}
	public void setIs_sku(int is_sku) {
		this.is_sku = is_sku;
	}
	public int getSku_id() {
		return sku_id;
	}
	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	@Override
	public String toString() {
		return "Product_Basic_Attr [p_id=" + p_id + ", attr_name_id=" + attr_name_id + ", attr_value_id=" + attr_value_id + "]";
	}
	public Product_Basic_Attr(int p_id, int attr_name_id, int attr_value_id,int is_sku) {
		super();
		this.p_id = p_id;
		this.attr_name_id = attr_name_id;
		this.attr_value_id = attr_value_id;
		this.is_sku = is_sku;
	}
	
	
}
