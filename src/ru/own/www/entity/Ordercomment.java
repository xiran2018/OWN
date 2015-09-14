package ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Ordercomment entity. @author MyEclipse Persistence Tools
 */

public class Ordercomment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer orderid;
	private Integer productid;
	private Integer userid;
	private String content;
	private Timestamp creattime;

	// Constructors

	/** default constructor */
	public Ordercomment() {
	}

	/** minimal constructor */
	public Ordercomment(Integer orderid, Integer productid) {
		this.orderid = orderid;
		this.productid = productid;
	}

	/** full constructor */
	public Ordercomment(Integer orderid, Integer productid, Integer userid,
			String content, Timestamp creattime) {
		this.orderid = orderid;
		this.productid = productid;
		this.userid = userid;
		this.content = content;
		this.creattime = creattime;
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

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreattime() {
		return this.creattime;
	}

	public void setCreattime(Timestamp creattime) {
		this.creattime = creattime;
	}

}