package ru.own.www.entity;

/**
 * Orderdetail entity. @author MyEclipse Persistence Tools
 */

public class Orderdetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer orderid;
	private Integer productid;
	private String  productname;//商品名称
	private Integer ordercount; //数量
	private Integer shipid; //货运id
	private Float shipfee; //货运费用
	private String shiptime;//货运时间
	private Float price; //价格，单价
	private String usermessage;
	private int productimageaddrid;

	// Constructors

	/** default constructor */
	public Orderdetail() {
	}

	/** minimal constructor */
	public Orderdetail(Integer orderid, Integer productid, Integer ordercount) {
		this.orderid = orderid;
		this.productid = productid;
		this.ordercount = ordercount;
	}

	/** full constructor */
	public Orderdetail(Integer orderid, Integer productid, Integer ordercount,
			Float price, String usermessage) {
		this.orderid = orderid;
		this.productid = productid;
		this.ordercount = ordercount;
		this.price = price;
		this.usermessage = usermessage;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getProductid() {
		return this.productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Integer getOrdercount() {
		return this.ordercount;
	}

	public void setOrdercount(Integer ordercount) {
		this.ordercount = ordercount;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getUsermessage() {
		return this.usermessage;
	}

	public void setUsermessage(String usermessage) {
		this.usermessage = usermessage;
	}

	public Integer getShipid() {
		return shipid;
	}

	public void setShipid(Integer shipid) {
		this.shipid = shipid;
	}

	public int getProductimageaddrid() {
		return productimageaddrid;
	}

	public void setProductimageaddrid(int productimageaddrid) {
		this.productimageaddrid = productimageaddrid;
	}

	public Float getShipfee() {
		return shipfee;
	}

	public void setShipfee(Float shipfee) {
		this.shipfee = shipfee;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getShiptime() {
		return shiptime;
	}

	public void setShiptime(String shiptime) {
		this.shiptime = shiptime;
	}



}