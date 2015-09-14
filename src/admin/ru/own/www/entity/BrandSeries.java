package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * BrandSeries entity. @author MyEclipse Persistence Tools
 */

public class BrandSeries implements java.io.Serializable {

	// Fields

	private Integer brandId;
	private Integer classId;
	private String brandName;
	private Integer parentBrandId;
	private Short isParent;
	private String brandLogo;
	private String brandTitle;
	private String brandKeywords;
	private String brandDescription;
	private Short brandStatus;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public BrandSeries() {
	}

	/** full constructor */
	public BrandSeries(Integer classId, String brandName,
			Integer parentBrandId, Short isParent, String brandLogo,
			String brandTitle, String brandKeywords,String brandDescription,Short brandStatus, Timestamp createTime) {
		this.classId = classId;
		this.brandName = brandName;
		this.parentBrandId = parentBrandId;
		this.isParent = isParent;
		this.brandLogo = brandLogo;
		this.brandTitle = brandTitle;
		this.brandKeywords = brandKeywords;
		this.brandDescription = brandDescription;
		this.brandStatus = brandStatus;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getBrandId() {
		return this.brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public Integer getClassId() {
		return this.classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getBrandName() {
		return this.brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public Integer getParentBrandId() {
		return this.parentBrandId;
	}

	public void setParentBrandId(Integer parentBrandId) {
		this.parentBrandId = parentBrandId;
	}

	public Short getIsParent() {
		return this.isParent;
	}

	public void setIsParent(Short isParent) {
		this.isParent = isParent;
	}

	public String getBrandLogo() {
		return this.brandLogo;
	}

	public void setBrandLogo(String brandLogo) {
		this.brandLogo = brandLogo;
	}

	public String getBrandDescription() {
		return this.brandDescription;
	}

	public void setBrandDescription(String brandDescription) {
		this.brandDescription = brandDescription;
	}

	public Short getBrandStatus() {
		return this.brandStatus;
	}

	public void setBrandStatus(Short brandStatus) {
		this.brandStatus = brandStatus;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getBrandTitle() {
		return brandTitle;
	}

	public void setBrandTitle(String brandTitle) {
		this.brandTitle = brandTitle;
	}

	public String getBrandKeywords() {
		return brandKeywords;
	}

	public void setBrandKeywords(String brandKeywords) {
		this.brandKeywords = brandKeywords;
	}

}