package ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

public class Cart implements java.io.Serializable {

	// Fields

	private Integer cartid;
	private Integer userid;
	private Integer productid;
	private Integer productimageaddrid;
	private Float productprice;  //商品的原始价格，美元
	private Integer productnumber;
	private String productname;
	private String productattrids="-1"; //用|分隔的所属商品的属性,默认值为-1
	private int skuid;
	private int shipid; //所选择的物流id
	private Timestamp createdata;
	private int status=1; //购物车状态

	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** minimal constructor */
	public Cart(Integer userid, Integer productid, Timestamp createdata) {
		this.userid = userid;
		this.productid = productid;
		this.createdata = createdata;
	}

	/** full constructor */
	public Cart(Integer userid, Integer productid, Float productprice,
			Integer productnumber, String productname, String productattrids,
			Timestamp createdata) {
		this.userid = userid;
		this.productid = productid;
		this.productprice = productprice;
		this.productnumber = productnumber;
		this.productname = productname;
		this.productattrids = productattrids;
		this.createdata = createdata;
	}

	// Property accessors

	public Integer getCartid() {
		return this.cartid;
	}

	public void setCartid(Integer cartid) {
		this.cartid = cartid;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Float getProductprice() {
		return this.productprice;
	}

	public void setProductprice(Float productprice) {
		this.productprice = productprice;
	}

	public Integer getProductnumber() {
		return this.productnumber;
	}

	public void setProductnumber(Integer productnumber) {
		this.productnumber = productnumber;
	}

	public String getProductname() {
		return this.productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductattrids() {
		return this.productattrids;
	}

	public void setProductattrids(String productattrids) {
		this.productattrids = productattrids;
	}

	public Timestamp getCreatedata() {
		return this.createdata;
	}

	public void setCreatedata(Timestamp createdata) {
		this.createdata = createdata;
	}

	public int getSkuid() {
		return skuid;
	}

	public void setSkuid(int skuid) {
		this.skuid = skuid;
	}

	public Integer getProductimageaddrid() {
		return productimageaddrid;
	}

	public void setProductimageaddrid(Integer productimageaddrid) {
		this.productimageaddrid = productimageaddrid;
	}

	public int getShipid() {
		return shipid;
	}

	public void setShipid(int shipid) {
		this.shipid = shipid;
	}





}