package admin.ru.own.www.entity;

import java.sql.Timestamp;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer categoryId;
	private String categoryName;
	private Integer categoryFatherId;
	private String categoryOtherName;
	private Short isFather;
	private Short isInFloorshow=0; //是否在楼层显示
	private Short isInBannershow;
	private Short isShow=0;
	private String icon;
	private String image;
	private short imagesize=1;
	private String title;
	private String keyword;
	private String description;
	private Timestamp createTime;

	// Constructors

	public Category()
	{
		isInFloorshow = Short.valueOf((short)0);
		isInBannershow = Short.valueOf((short)0);
		isShow = Short.valueOf((short)0);
		imagesize = 1;
	}

	public Category(String categoryName, Integer categoryFatherId, String categoryOtherName, Short isFather, Timestamp createTime)
	{
		isInFloorshow = Short.valueOf((short)0);
		isInBannershow = Short.valueOf((short)0);
		isShow = Short.valueOf((short)0);
		imagesize = 1;
		this.categoryName = categoryName;
		this.categoryFatherId = categoryFatherId;
		this.categoryOtherName = categoryOtherName;
		this.isFather = isFather;
		this.createTime = createTime;
	}

	public Category(String categoryName, Integer categoryFatherId, String categoryOtherName, Short isFather, String title, String keyword, String description,
					Timestamp createTime)
	{
		isInFloorshow = Short.valueOf((short)0);
		isInBannershow = Short.valueOf((short)0);
		isShow = Short.valueOf((short)0);
		imagesize = 1;
		this.categoryName = categoryName;
		this.categoryFatherId = categoryFatherId;
		this.categoryOtherName = categoryOtherName;
		this.isFather = isFather;
		this.title = title;
		this.keyword = keyword;
		this.description = description;
		this.createTime = createTime;
	}
	// Property accessors

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getCategoryFatherId() {
		return this.categoryFatherId;
	}

	public void setCategoryFatherId(Integer categoryFatherId) {
		this.categoryFatherId = categoryFatherId;
	}

	public String getCategoryOtherName() {
		return this.categoryOtherName;
	}

	public void setCategoryOtherName(String categoryOtherName) {
		this.categoryOtherName = categoryOtherName;
	}

	public Short getIsFather() {
		return this.isFather;
	}

	public void setIsFather(Short isFather) {
		this.isFather = isFather;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Short getIsShow() {
		return isShow;
	}

	public void setIsShow(Short isShow) {
		this.isShow = isShow;
	}

	public Short getIsInBannershow() {
		return isInBannershow;
	}

	public void setIsInBannershow(Short isInBannershow) {
		this.isInBannershow = isInBannershow;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public short getImagesize() {
		return imagesize;
	}

	public void setImagesize(short imagesize) {
		this.imagesize = imagesize;
	}



	public Short getIsInFloorshow() {
		return isInFloorshow;
	}

	public void setIsInFloorshow(Short isInFloorshow) {
		this.isInFloorshow = isInFloorshow;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoryFatherId == null) ? 0 : categoryFatherId.hashCode());
		result = prime * result + ((categoryId == null) ? 0 : categoryId.hashCode());
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
		Category other = (Category) obj;
		if (categoryFatherId == null) {
			if (other.categoryFatherId != null)
				return false;
		} else if (!categoryFatherId.equals(other.categoryFatherId))
			return false;
		if (categoryId == null) {
			if (other.categoryId != null)
				return false;
		} else if (!categoryId.equals(other.categoryId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryName=" + categoryName + ", categoryFatherId=" + categoryFatherId + ", categoryOtherName=" + categoryOtherName + ", isFather="
				+ isFather + ", isShow=" + isShow + ", icon=" + icon + ", image=" + image + ", imagesize=" + imagesize + ", title=" + title + ", keyword=" + keyword + ", description=" + description
				+ ", createTime=" + createTime + "]";
	}
	
	
}