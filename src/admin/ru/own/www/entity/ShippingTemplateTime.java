package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * ShippingTemplateTime entity. @author MyEclipse Persistence Tools
 */

public class ShippingTemplateTime implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer templateId;
	private Integer shippingId;
	private Integer timeStyle;


	private String shippingCountryIds;
	private String shippingTime;
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public ShippingTemplateTime() {
	}

	/** minimal constructor */
	public ShippingTemplateTime(Integer templateId, Integer shippingId,
			String shippingCountryIds, String shippingTime) {
		this.templateId = templateId;
		this.shippingId = shippingId;
		this.shippingCountryIds = shippingCountryIds;
		this.shippingTime = shippingTime;
	}

	/** full constructor */
	public ShippingTemplateTime(Integer templateId, Integer shippingId,
			String shippingCountryIds, String shippingTime,
			Timestamp createtime) {
		this.templateId = templateId;
		this.shippingId = shippingId;
		this.shippingCountryIds = shippingCountryIds;
		this.shippingTime = shippingTime;
		this.createtime = createtime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTemplateId() {
		return this.templateId;
	}

	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}


	public Integer getTimeStyle() {
		return timeStyle;
	}

	public void setTimeStyle(Integer timeStyle) {
		this.timeStyle = timeStyle;
	}

	public Integer getShippingId() {
		return this.shippingId;
	}

	public void setShippingId(Integer shippingId) {
		this.shippingId = shippingId;
	}

	public String getShippingCountryIds() {
		return this.shippingCountryIds;
	}

	public void setShippingCountryIds(String shippingCountryIds) {
		this.shippingCountryIds = shippingCountryIds;
	}



	public String getShippingTime() {
		return shippingTime;
	}

	public void setShippingTime(String shippingTime) {
		this.shippingTime = shippingTime;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

}