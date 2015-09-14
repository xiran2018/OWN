package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryClientShow;
import admin.ru.own.www.entity.CategoryMultiLanguage;
import admin.ru.own.www.entity.EditCategoryMultiLanguage;



public interface CategoryMapper extends MyBatisMapper
{
	public void insertForeignCategory(CategoryMultiLanguage cml);

	public void delForeignCateByCateId(Integer categoryId);

	public void updateCateBasicInfo(Category category);

	public List<EditCategoryMultiLanguage> fecthCateMultiByCateId(Integer categoryId);

	public void updateCateXiangXiInfo(Category category);
	
	List<Category> getAllCategory();
	
	String getCategoryName(int category_id);

	public void updateCateBasicImage(Category category);
	Category getCategory(int category_id);

	public void updateCateBasicIcon(Category category);
	/**
	 * 得到相对应语言的所有的category
	 * @param lanid
	 * @return
	 */
	List<Category> getAllCategoryWithMultilanguage(int lanid);
	/**
	 * 返回下级categoryid，只返回一级父子关系。需要得到孙子id需多次调用这个方法
	 * @param categoryid
	 * @return
	 */
	List<Integer> getSubCategoryID(int categoryid);

	/**
	 * 按照首页需要的格式，返回所有的分类
	 * @param lanid 
	 * @return
	 */
	public List<CategoryClientShow> getShowCategory(int lanid);
	List<Integer> getAllSubCategoryID(int categoryid);
	String getAllSubCategoryIDStr(int categoryid);
	String getAllFutherCategoryIDStr(int categoryid);
	List<Integer> getAllFutherCategoryID(int categoryid);
	
}
