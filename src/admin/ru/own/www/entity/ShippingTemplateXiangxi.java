package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * ShippingTemplateXiangxi entity. @author MyEclipse Persistence Tools
 */

public class ShippingTemplateXiangxi implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer templateId;
	private Integer shippingId;
	private Integer shippingStyle; //设置运费的方式（免邮费,还是自定义）
	private String shippingCountryIds; //所选择国家的id(中间用"|"隔开)
	private Short selectMode;  //1：标准  2：自定义（按照数量，重量） 
	private Float standardFee;  //标准运费
	private Short selectQwpattern; //1：按照数量  2：按照重量 
	private Integer clMin;  //首重最低采购量
	private Integer clMax;  //首重最高采购量
	private Integer clPrice; //首重价格
	private Integer clAddNum; //每增加数量
	private Integer clAddPrice; //增加价格
	private Float weightEnd0;  //首重
	private Float weightPrice0;  //首重运费
	private Float weightEnd1;  //续重最高重量
	private Float weightInterval1; //每增加的重量
	private Float weightPrice1; //增加多少钱
	private Timestamp createtime;

	// Constructors

	/** default constructor */
	public ShippingTemplateXiangxi() {
	}

	/** minimal constructor */
	public ShippingTemplateXiangxi(Integer templateId, Integer shippingId,
			Timestamp createtime) {
		this.templateId = templateId;
		this.shippingId = shippingId;
		this.createtime = createtime;
	}

	/** full constructor */
	public ShippingTemplateXiangxi(Integer templateId, Integer shippingId,
			String shippingCountryIds, Short selectMode, Float standardFee,
			Short selectQwpattern, Integer clMin, Integer clMax,
			Integer clPrice, Integer clAddNum, Integer clAddPrice,
			Float weightEnd0, Float weightPrice0, Float weightEnd1,
			Float weightInterval1, Float weightPrice1, Timestamp createtime) {
		this.templateId = templateId;
		this.shippingId = shippingId;
		this.shippingCountryIds = shippingCountryIds;
		this.selectMode = selectMode;
		this.standardFee = standardFee;
		this.selectQwpattern = selectQwpattern;
		this.clMin = clMin;
		this.clMax = clMax;
		this.clPrice = clPrice;
		this.clAddNum = clAddNum;
		this.clAddPrice = clAddPrice;
		this.weightEnd0 = weightEnd0;
		this.weightPrice0 = weightPrice0;
		this.weightEnd1 = weightEnd1;
		this.weightInterval1 = weightInterval1;
		this.weightPrice1 = weightPrice1;
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

	public Short getSelectMode() {
		return this.selectMode;
	}

	public void setSelectMode(Short selectMode) {
		this.selectMode = selectMode;
	}

	public Float getStandardFee() {
		return this.standardFee;
	}

	public void setStandardFee(Float standardFee) {
		this.standardFee = standardFee;
	}

	public Short getSelectQwpattern() {
		return this.selectQwpattern;
	}

	public void setSelectQwpattern(Short selectQwpattern) {
		this.selectQwpattern = selectQwpattern;
	}

	public Integer getClMin() {
		return this.clMin;
	}

	public void setClMin(Integer clMin) {
		this.clMin = clMin;
	}

	public Integer getClMax() {
		return this.clMax;
	}

	public void setClMax(Integer clMax) {
		this.clMax = clMax;
	}

	public Integer getClPrice() {
		return this.clPrice;
	}

	public void setClPrice(Integer clPrice) {
		this.clPrice = clPrice;
	}

	public Integer getClAddNum() {
		return this.clAddNum;
	}

	public void setClAddNum(Integer clAddNum) {
		this.clAddNum = clAddNum;
	}

	public Integer getClAddPrice() {
		return this.clAddPrice;
	}

	public void setClAddPrice(Integer clAddPrice) {
		this.clAddPrice = clAddPrice;
	}

	public Float getWeightEnd0() {
		return this.weightEnd0;
	}

	public void setWeightEnd0(Float weightEnd0) {
		this.weightEnd0 = weightEnd0;
	}

	public Float getWeightPrice0() {
		return this.weightPrice0;
	}

	public void setWeightPrice0(Float weightPrice0) {
		this.weightPrice0 = weightPrice0;
	}

	public Float getWeightEnd1() {
		return this.weightEnd1;
	}

	public void setWeightEnd1(Float weightEnd1) {
		this.weightEnd1 = weightEnd1;
	}

	public Float getWeightInterval1() {
		return this.weightInterval1;
	}

	public void setWeightInterval1(Float weightInterval1) {
		this.weightInterval1 = weightInterval1;
	}

	public Float getWeightPrice1() {
		return this.weightPrice1;
	}

	public void setWeightPrice1(Float weightPrice1) {
		this.weightPrice1 = weightPrice1;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Integer getShippingStyle() {
		return shippingStyle;
	}

	public void setShippingStyle(Integer shippingStyle) {
		this.shippingStyle = shippingStyle;
	}



}