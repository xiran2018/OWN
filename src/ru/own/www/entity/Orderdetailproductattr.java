package ru.own.www.entity;

/**
 * Orderdetailproductattr entity. @author MyEclipse Persistence Tools
 */

public class Orderdetailproductattr implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer orderdetailid;
	private String attrname;
	private String attrvalue;
	private Integer attrvalueId;

	// Constructors

	/** default constructor */
	public Orderdetailproductattr() {
	}

	/** minimal constructor */
	public Orderdetailproductattr(Integer orderdetailid) {
		this.orderdetailid = orderdetailid;
	}

	/** full constructor */
	public Orderdetailproductattr(Integer orderdetailid, String attrname,
			String attrvalue) {
		this.orderdetailid = orderdetailid;
		this.attrname = attrname;
		this.attrvalue = attrvalue;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderdetailid() {
		return this.orderdetailid;
	}

	public void setOrderdetailid(Integer orderdetailid) {
		this.orderdetailid = orderdetailid;
	}

	public String getAttrname() {
		return this.attrname;
	}

	public void setAttrname(String attrname) {
		this.attrname = attrname;
	}

	public String getAttrvalue() {
		return this.attrvalue;
	}

	public void setAttrvalue(String attrvalue) {
		this.attrvalue = attrvalue;
	}

	public Integer getAttrvalueId() {
		return this.attrvalueId;
	}

	public void setAttrvalueId(final Integer attrvalueId) {
		this.attrvalueId = attrvalueId;
	}
}