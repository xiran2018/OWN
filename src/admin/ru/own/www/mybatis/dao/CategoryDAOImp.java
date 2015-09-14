package admin.ru.own.www.mybatis.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryClientShow;
import admin.ru.own.www.entity.CategoryMultiLanguage;
import admin.ru.own.www.entity.EditCategoryMultiLanguage;

public class CategoryDAOImp implements CategoryMapper {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private CategoryMapper categoryDAO = sqlSession.getMapper(CategoryMapper.class);
	@Override
	public void insertForeignCategory(CategoryMultiLanguage cml) {
	}

	@Override
	public void delForeignCateByCateId(Integer categoryId) {
	}

	@Override
	public void updateCateBasicInfo(Category category) {
	}

	@Override
	public List<EditCategoryMultiLanguage> fecthCateMultiByCateId(
			Integer categoryId) {
		return null;
	}

	@Override
	public void updateCateXiangXiInfo(Category category) {
	}

	@Override
	public List<Category> getAllCategory() {
		List<Category> list = categoryDAO.getAllCategory();
		return list;
	}

	@Override
	public String getCategoryName(int category_id) {
		String name = categoryDAO.getCategoryName(category_id);
		return name;
	}

	@Override
	public void updateCateBasicImage(Category category) {
	}

	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public Category getCategory(int category_id) {
		return categoryDAO.getCategory(category_id);
	}

	@Override
	public void updateCateBasicIcon(Category category) {
	}

	@Override
	public List<Category> getAllCategoryWithMultilanguage(int lanid) {
		return categoryDAO.getAllCategoryWithMultilanguage(lanid);
	}

	@Override
	public List<Integer> getSubCategoryID(int categoryid) {
		return categoryDAO.getSubCategoryID(categoryid);
	}


	@Override
	public List<CategoryClientShow> getShowCategory(int lanid) {
		return categoryDAO.getShowCategory(lanid);
	}

	public List<Integer> getAllSubCategoryID(int categoryid) {
		String[] ids = getAllSubCategoryIDStr(categoryid).split(",");
		List<Integer> idList = new ArrayList<Integer>();
		for (String id : ids) {
			if(!id.equals("$")) {
				idList.add(Integer.parseInt(id));
			}
		}
		return idList;
	}
	
	public List<Integer> getAllFutherCategoryID(int categoryid) {
		String[] ids = getAllFutherCategoryIDStr(categoryid).split(",");
		List<Integer> idList = new ArrayList<Integer>();
		for (int i = ids.length-1; i >0 ; i--) {
			if(!ids[i].equals("$")) {
				idList.add(Integer.parseInt(ids[i]));
			}
		}
		return idList;
	}
	public String getAllSubCategoryIDStr(int categoryid) {
		return categoryDAO.getAllSubCategoryIDStr(categoryid);
	}
	public String getAllFutherCategoryIDStr(int categoryid) {
		return categoryDAO.getAllFutherCategoryIDStr(categoryid);
	}
}
