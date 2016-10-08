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
		
		int categoryidFlag=categoryid; //获取这个分类下的子分类进行展示
		
		int categoryIdLevel= findCategoryIdLevel(categoryid, allCategory); //标示该分类所属的级别，默认为2，表示二级
		
		int upToStep=2;//商品分类往上走的部署
		
		categoryidFlag = findCategoryFatherId(categoryid, allCategory,categoryIdLevel,upToStep);
		
		/**
		 * 先组装key，再组装value
		 */
		Map<Integer,NavigationVO> navigation = new HashMap<Integer,NavigationVO>();
		
		//查找所有的二级分类
		for (Iterator<Category> iterator = allCategory.iterator(); iterator.hasNext();) {
			Category category = iterator.next();
			if(category.getCategoryId() == SystemParameters.CategoryRootID){//商品分类的根所在数据库表category的category_id 
				iterator.remove();
				continue;
			}
			
			//if(category.getIsFather()==1 && category.getCategoryFatherId() != SystemParameters.CategoryRootID) {
			//上面的if语句是挑选所有的二级分类（二级分类下有子分类，并且二级分类的父亲ID不是根目录）
			if(category.getCategoryFatherId() == categoryidFlag) {
				//挑选categoryid含有的二级分类（二级分类下有子分类，并且二级分类的父亲ID不是根目录）
				NavigationVO secondNavigation = new NavigationVO();
				secondNavigation.setFatherCategory(category);
				navigation.put(category.getCategoryId(), secondNavigation); //key是二级分类的id，value是二级分类和子分类（暂时未null，下面的for填充子分类）
				iterator.remove();
			}
			

		}
		
		//填装二级分类的子分类
		for (Iterator<Category> iterator = allCategory.iterator(); iterator.hasNext();) {
			Category category = iterator.next();
			
			NavigationVO navigationVO = navigation.get(category.getCategoryFatherId()); //表明是2级目录
			if(navigationVO!=null) {
				navigationVO.getChileCategories().add(category);
				iterator.remove();
			}
		}
		
		return navigation;
	}

	/**
	 * 从后往前查找该category 的级别，默认返回1
	 * @param categoryid
	 * @param allCategory
	 * @return
	 */
	private int findCategoryIdLevel(int categoryid, List<Category> allCategory) {

		int level=1;
		for (Iterator<Category> iterator = allCategory.iterator(); iterator.hasNext();) {
			Category category = iterator.next();
			if(category.getCategoryId()==categoryid)
			{//找到了这个category
				if(category.getCategoryFatherId()!=SystemParameters.CategoryRootID)
				{
					level=level+findCategoryIdLevel(category.getCategoryFatherId(),allCategory);
				}
				else 
				{
					return 1;
				}
					
				break;
			}
		}
		return level;
}

	/**
	 * @param categoryid
	 * @param allCategory
	 * @param categoryidFlag
	 * @return
	 */
	public int findCategoryFatherId(int categoryid, List<Category> allCategory,int categoryIdLevel,int upToStep) 
	{
		int categoryidFlag=0;
		//该for循环查找categoryid所属的类别
		for (Iterator<Category> iterator = allCategory.iterator(); iterator.hasNext();) 
		{
			Category category = iterator.next();
			if(category.getCategoryId()==categoryid)
			{//找到了这个category
//				categoryFlag=category;
				if(category.getCategoryFatherId()==SystemParameters.CategoryRootID||upToStep==0)
				{
					categoryidFlag=categoryid; //说明是第一级分类
				}
				else if(categoryIdLevel==2||upToStep==0)
				{
					categoryidFlag=category.getCategoryFatherId();	
					//以下的代码查询此category是否为三级（包含）以下的分类，如果是三级以下的分类，则 categoryidFlag 需要往上再走一级
				}
				else
				{
					categoryidFlag=findCategoryFatherId(category.getCategoryFatherId(), allCategory,--categoryIdLevel,--upToStep);	
				}
					
				break;
			}
		}
		return categoryidFlag;
	}
}
