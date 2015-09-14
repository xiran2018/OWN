package admin.ru.own.www.logic.foreground;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import admin.ru.own.www.entity.Category;
import admin.ru.own.www.mybatis.dao.CategoryDAOImp;
import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.parameter.SystemParameters;
import admin.ru.own.www.vo.NavigationVO;

public class SecondForegroundPageService extends ProductFilterBaseService{
	
	/** 
	 * 无论是第一级id还是第二级id 都返回其第一级id
	 * @param categoryid
	 * @param categoryDAO
	 * @return
	 */
	public int getFirstLevelCategoryID(int categoryid, CategoryMapper categoryDAO) {
		Category categoryEntity = categoryDAO.getCategory(categoryid);
		if (categoryEntity.getCategoryFatherId() != SystemParameters.CategoryRootID) {
			return getFirstLevelCategoryID(categoryEntity.getCategoryFatherId(),categoryDAO);
		} else {
			return categoryid;
		}
	}
	
	/**
	 * 将category逐层分解，得到导航条
	 * @param categoryid
	 * @return
	 */
	public Map<Integer, NavigationVO> getSecondNavigations(int categoryid,int lanid) {
		CategoryMapper categoryDAO = new CategoryDAOImp();
		List<Category> allCategory = categoryDAO.getAllCategoryWithMultilanguage(lanid);
		
		/**
		 * 先组装key，再组装value
		 */
		Map<Integer,NavigationVO> navigation = new HashMap<Integer,NavigationVO>();
		for (Iterator<Category> iterator = allCategory.iterator(); iterator.hasNext();) {
			Category category = iterator.next();
			if(category.getCategoryId() == SystemParameters.CategoryRootID){
				iterator.remove();
				continue;
			}
			
			if(category.getIsFather()==1 && category.getCategoryFatherId() != SystemParameters.CategoryRootID) {
				NavigationVO secondNavigation = new NavigationVO();
				secondNavigation.setFatherCategory(category);
				navigation.put(category.getCategoryId(), secondNavigation);
				iterator.remove();
			}
		}
		
		for (Iterator<Category> iterator = allCategory.iterator(); iterator.hasNext();) {
			Category category = iterator.next();
			//表明是2级目录
			NavigationVO navigationVO = navigation.get(category.getCategoryFatherId());
			if(navigationVO!=null) {
				navigationVO.getChileCategories().add(category);
				iterator.remove();
			}
		}
		
		return navigation;
	}
}
