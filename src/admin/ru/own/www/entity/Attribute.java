package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Attribute entity. @author MyEclipse Persistence Tools
 */

public class Attribute implements java.io.Serializable {

	// Fields

	private Integer attrId;
	private String attrName;
	private String attrOtherName;
	private Integer categoryId;
	private Short isColorAttr;
	private Short inputStyle;
	private Short isKeyAttr;
	private Short isSaleAttr;
	private Short isSearchAttr;
	private Short isMultiselect;
	private Short isNecessary;
	private Integer sortNumber;
	private Short attrStatus;
	private Timestamp createTime;
	private Byte globalattr;
	
	private String title;
	private String keywords;
	private String description;
	
	//private ProductAttrMultiLanguage pamu;

	// Constructors

	/** default constructor */
	public Attribute() {
	}

	/** full constructor */
	public Attribute(String attrName, String attrOtherName, Integer categoryId,
			Short isColorAttr, Short isEnumAttr, Short isInputAttr,
			Short isKeyAttr, Short isSaleAttr, Short isSearchAttr,
			Short isMultiselect, Short isNecessary, Integer sortNumber,
			Short attrStatus, Timestamp createTime) {
		this.attrName = attrName;
		this.attrOtherName = attrOtherName;
		this.categoryId = categoryId;
		this.isColorAttr = isColorAttr;
		this.inputStyle = isInputAttr;
		this.isKeyAttr = isKeyAttr;
		this.isSaleAttr = isSaleAttr;
		this.isSearchAttr = isSearchAttr;
		this.isMultiselect = isMultiselect;
		this.isNecessary = isNecessary;
		this.sortNumber = sortNumber;
		this.attrStatus = attrStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getAttrId() {
		return this.attrId;
	}

	public void setAttrId(Integer attrId) {
		this.attrId = attrId;
	}

	public String getAttrName() {
		return this.attrName;
	}

	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}

	public String getAttrOtherName() {
		return this.attrOtherName;
	}

	public void setAttrOtherName(String attrOtherName) {
		this.attrOtherName = attrOtherName;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Short getIsColorAttr() {
		return this.isColorAttr;
	}

	public void setIsColorAttr(Short isColorAttr) {
		this.isColorAttr = isColorAttr;
	}

	public Short getInputStyle() {
		return inputStyle;
	}

	public void setInputStyle(Short inputStyle) {
		this.inputStyle = inputStyle;
	}

	public Short getIsKeyAttr() {
		return isKeyAttr;
	}

	public void setIsKeyAttr(Short isKeyAttr) {
		this.isKeyAttr = isKeyAttr;
	}

	public Short getIsSaleAttr() {
		return isSaleAttr;
	}

	public void setIsSaleAttr(Short isSaleAttr) {
		this.isSaleAttr = isSaleAttr;
	}

	public Short getIsSearchAttr() {
		return this.isSearchAttr;
	}

	public void setIsSearchAttr(Short isSearchAttr) {
		this.isSearchAttr = isSearchAttr;
	}

	public Short getIsMultiselect() {
		return this.isMultiselect;
	}

	public void setIsMultiselect(Short isMultiselect) {
		this.isMultiselect = isMultiselect;
	}

	public Short getIsNecessary() {
		return this.isNecessary;
	}

	public void setIsNecessary(Short isNecessary) {
		this.isNecessary = isNecessary;
	}

	public Integer getSortNumber() {
		return this.sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Short getAttrStatus() {
		return this.attrStatus;
	}

	public void setAttrStatus(Short attrStatus) {
		this.attrStatus = attrStatus;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Byte getGlobalattr() {
		return globalattr;
	}

	public void setGlobalattr(Byte globalattr) {
		this.globalattr = globalattr;
	}

//	public ProductAttrMultiLanguage getPamu() {
//		return pamu;
//	}
//
//	public void setPamu(ProductAttrMultiLanguage pamu) {
//		this.pamu = pamu;
//	}



}