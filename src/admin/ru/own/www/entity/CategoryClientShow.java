package admin.ru.own.www.entity;

import java.util.List;

/**
 * 在用户界面显示商品分类 
 * @author jingquanliang
 */

public class CategoryClientShow implements java.io.Serializable {

	// Fields
	private Category firstLevelCategory;
	private List<SecondLevelCategoryList> secondLevelList;
	

	// Constructors

	/** default constructor */
	public CategoryClientShow() {
	}





	public Category getFirstLevelCategory() {
		return firstLevelCategory;
	}





	public void setFirstLevelCategory(Category firstLevelCategory) {
		this.firstLevelCategory = firstLevelCategory;
	}





	public List<SecondLevelCategoryList> getSecondLevelList() {
		return secondLevelList;
	}



	public void setSecondLevelList(List<SecondLevelCategoryList> secondLevelList) {
		this.secondLevelList = secondLevelList;
	}

}