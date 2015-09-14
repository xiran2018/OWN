package admin.ru.own.www.entity;

public class SKU_AtrValue {
	private int id;
	private int sku_id;
	private int attr_value_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSku_id() {
		return sku_id;
	}
	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}
	public int getAttr_value_id() {
		return attr_value_id;
	}
	public void setAttr_value_id(int attr_value_id) {
		this.attr_value_id = attr_value_id;
	}
	@Override
	public String toString() {
		return "SKU_AtrValue [id=" + id + ", sku_id=" + sku_id + ", attr_value_id=" + attr_value_id + "]";
	}
	
}
