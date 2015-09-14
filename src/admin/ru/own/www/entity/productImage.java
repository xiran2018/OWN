package admin.ru.own.www.entity;

import java.util.Date;

public class productImage 
{
	private int id;
	private int productId;
	private String imageAddr;
	private int imageSort;
	private Date createtime;
	private int p_freight_templet;
	
	public productImage() 
	{
	}
	public productImage(int productId,String imageAddr,int imageSort) 
	{
		this.productId=productId;
		this.imageAddr=imageAddr;
		this.imageSort=imageSort;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getImageAddr() {
		return imageAddr;
	}
	public void setImageAddr(String imageAddr) {
		this.imageAddr = imageAddr;
	}
	public int getImageSort() {
		return imageSort;
	}
	public void setImageSort(int imageSort) {
		this.imageSort = imageSort;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getP_freight_templet() {
		return p_freight_templet;
	}
	public void setP_freight_templet(int p_freight_templet) {
		this.p_freight_templet = p_freight_templet;
	}
}
