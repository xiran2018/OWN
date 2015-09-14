package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * AttributeValue entity. @author MyEclipse Persistence Tools
 */

public class AttributeValue implements java.io.Serializable {

	// Fields

	private Integer attrValueId;  //主键
	private String attrValueName;
	private Integer attrId;  //属性id
	private Short attrStatus;
	private Integer categoryId;
	private Integer sortNumber;
	private Timestamp createTime;

	// Constructors

	/** default constructor */
	public AttributeValue() {
	}

	/** full constructor */
	public AttributeValue(String attrValueName, Integer attrId,
			Short attrStatus, Integer categoryId, Integer sortNumber,
			Timestamp createTime) {
		this.attrValueName = attrValueName;
		this.attrId = attrId;
		this.attrStatus = attrStatus;
		this.categoryId = categoryId;
		this.sortNumber = sortNumber;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getAttrValueId() {
		return this.attrValueId;
	}

	public void setAttrValueId(Integer attrValueId) {
		this.attrValueId = attrValueId;
	}

	public String getAttrValueName() {
		return this.attrValueName;
	}

	public void setAttrValueName(String attrValueName) {
		this.attrValueName = attrValueName;
	}

	public Integer getAttrId() {
		return this.attrId;
	}

	public void setAttrId(Integer attrId) {
		this.attrId = attrId;
	}

	public Short getAttrStatus() {
		return this.attrStatus;
	}

	public void setAttrStatus(Short attrStatus) {
		this.attrStatus = attrStatus;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getSortNumber() {
		return this.sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attrId == null) ? 0 : attrId.hashCode());
		result = prime * result + ((attrStatus == null) ? 0 : attrStatus.hashCode());
		result = prime * result + ((attrValueId == null) ? 0 : attrValueId.hashCode());
		result = prime * result + ((attrValueName == null) ? 0 : attrValueName.hashCode());
		result = prime * result + ((categoryId == null) ? 0 : categoryId.hashCode());
		result = prime * result + ((createTime == null) ? 0 : createTime.hashCode());
		result = prime * result + ((sortNumber == null) ? 0 : sortNumber.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AttributeValue other = (AttributeValue) obj;
		if (attrId == null) {
			if (other.attrId != null)
				return false;
		} else if (!attrId.equals(other.attrId))
			return false;
		if (attrStatus == null) {
			if (other.attrStatus != null)
				return false;
		} else if (!attrStatus.equals(other.attrStatus))
			return false;
		if (attrValueId == null) {
			if (other.attrValueId != null)
				return false;
		} else if (!attrValueId.equals(other.attrValueId))
			return false;
		if (attrValueName == null) {
			if (other.attrValueName != null)
				return false;
		} else if (!attrValueName.equals(other.attrValueName))
			return false;
		if (categoryId == null) {
			if (other.categoryId != null)
				return false;
		} else if (!categoryId.equals(other.categoryId))
			return false;
		if (createTime == null) {
			if (other.createTime != null)
				return false;
		} else if (!createTime.equals(other.createTime))
			return false;
		if (sortNumber == null) {
			if (other.sortNumber != null)
				return false;
		} else if (!sortNumber.equals(other.sortNumber))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AttributeValue [attrValueId=" + attrValueId + ", attrValueName=" + attrValueName + ", attrId=" + attrId + "]";
	}

}