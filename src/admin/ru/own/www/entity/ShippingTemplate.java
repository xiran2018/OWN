package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * ShippingTemplate entity. @author MyEclipse Persistence Tools
 */

public class ShippingTemplate implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Short status;
	private String beizhu;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public ShippingTemplate() {
	}

	/** minimal constructor */
	public ShippingTemplate(String name, Short status, Timestamp createtime) {
		this.name = name;
		this.status = status;
		this.createtime = createtime;
	}

	/** full constructor */
	public ShippingTemplate(String name, Short status, String beizhu,
			Timestamp createtime) {
		this.name = name;
		this.status = status;
		this.beizhu = beizhu;
		this.createtime = createtime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}