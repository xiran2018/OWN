package admin.ru.own.www.vo;

import java.util.ArrayList;
import java.util.List;

import admin.ru.own.www.entity.Category;
/**
 * 二级菜单导航条
 * @author dell
 *
 */
public class NavigationVO {
	private Category fatherCategory;
	private List<Category> chileCategories = new ArrayList<Category>();
	public Category getFatherCategory() {
		return fatherCategory;
	}
	public void setFatherCategory(Category fatherCategory) {
		this.fatherCategory = fatherCategory;
	}
	public List<Category> getChileCategories() {
		return chileCategories;
	}
	public void setChileCategories(List<Category> chileCategories) {
		this.chileCategories = chileCategories;
	}
}
