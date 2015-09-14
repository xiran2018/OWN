package admin.ru.own.www.entity;

import java.sql.Timestamp;
import java.util.List;

/**
 * BrandSeries entity. @author MyEclipse Persistence Tools
 */

public class BrandSeriesShow implements java.io.Serializable {

	// Fields

	private Integer brandId;
	private Integer classId;
	private String brandName;
	private Integer parentBrandId;
	private Short isParent;
	private String brandLogo;
	private String brandDescription;
	private Short brandStatus;
	private Timestamp createTime;
	private List children;

	// Constructors

	/** default constructor */
	public BrandSeriesShow() {
	}

	/** full constructor */
	public BrandSeriesShow(Integer classId, String brandName,
			Integer parentBrandId, Short isParent, String brandLogo,
			String brandDescription, Short brandStatus, Timestamp createTime) {
		this.classId = classId;
		this.brandName = brandName;
		this.parentBrandId = parentBrandId;
		this.isParent = isParent;
		this.brandLogo = brandLogo;
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

}