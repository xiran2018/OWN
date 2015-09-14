package admin.ru.own.www.entity;

import java.util.Date;

public class ProductSku {
	private int sku_id;
	private int product_id;
	private int count;
	private double price;
	private int status;
	private String sku_name;
	private int image;
	private String image_addr;
	private Date create_time;
	
	public int getSku_id() {
		return sku_id;
	}
	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSku_name() {
		return sku_name;
	}
	public void setSku_name(String sku_name) {
		this.sku_name = sku_name;
	}
	public int getImage() {
		return image;
	}
	public void setImage(int image) {
		this.image = image;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	@Override
	public String toString() {
		return "ProductSku [sku_id=" + sku_id + ", product_id=" + product_id + ", sku_name=" + sku_name + "]";
	}
	public String getImage_addr() {
		return image_addr;
	}
	public void setImage_addr(String image_addr) {
		this.image_addr = image_addr;
	}
	
}
