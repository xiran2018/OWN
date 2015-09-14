package ru.own.www.entity;

import java.sql.Timestamp;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 下午2:07:44  
 */
public class CartProductImage 
{
	private int id;
	private int productid;
	private String productimageaddr;
	private String productattrs; //用|分隔的所属商品的属性,默认值为-1
	private int productimageindexcount;
	private Timestamp createdata;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductimageaddr() {
		return productimageaddr;
	}
	public void setProductimageaddr(String productimageaddr) {
		this.productimageaddr = productimageaddr;
	}
	public Timestamp getCreatedata() {
		return createdata;
	}
	public void setCreatedata(Timestamp createdata) {
		this.createdata = createdata;
	}
	public int getProductimageindexcount() {
		return productimageindexcount;
	}
	public void setProductimageindexcount(int productimageindexcount) {
		this.productimageindexcount = productimageindexcount;
	}
	public String getProductattrs() {
		return productattrs;
	}
	public void setProductattrs(String productattrs) {
		this.productattrs = productattrs;
	}
	
	

	
	
	
}
