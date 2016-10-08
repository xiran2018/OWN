package admin.ru.own.www.logic.category;

import java.util.List;

import admin.ru.own.www.entity.Category;
import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;

public class CategoryService {
	/**
	 * 得到子categoryid，包括自身
	 * @param categoryid
	 * @return
	 */
	public List<Integer> getAllSubCategoryID(int categoryid) {
		CategoryMapper categoryDAO = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		List<Integer> categoryIDs = categoryDAO.getAllSubCategoryID(categoryid);
		categoryDAO.closeSession();
		return categoryIDs;
	}
	/**
	 * 得到父categoryid，包括自身
	 * @param categoryid
	 * @return
	 */
	public List<Integer> getAllFutherCategoryID(int categoryid) {
		CategoryMapper categoryDAO = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		List<Integer> categoryIDs = categoryDAO.getAllFutherCategoryID(categoryid);
		categoryDAO.closeSession();
		return categoryIDs;
	}
	
	public Category getCategory(int categoryid,int lanid) {
		CategoryMapper categoryDAO = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		Category category = categoryDAO.getCategoryByIdAndLanId(categoryid,lanid);
		categoryDAO.closeSession();
		return category;
	}
}
