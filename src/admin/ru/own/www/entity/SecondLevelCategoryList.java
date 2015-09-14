package admin.ru.own.www.entity;

import java.util.List;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月8日 下午4:06:47  
 */
public class SecondLevelCategoryList 
{
	// Fields
	private Category secondLevelCategory;
	private List<Category> thirdLevelList;
	
	
	public Category getSecondLevelCategory() {
		return secondLevelCategory;
	}
	public void setSecondLevelCategory(Category secondLevelCategory) {
		this.secondLevelCategory = secondLevelCategory;
	}
	public List<Category> getThirdLevelList() {
		return thirdLevelList;
	}
	public void setThirdLevelList(List<Category> thirdLevelList) {
		this.thirdLevelList = thirdLevelList;
	}
	
}
