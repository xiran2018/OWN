package admin.ru.own.www.logic.foreground;

import java.util.List;

import admin.ru.own.www.logic.category.CategoryService;
import admin.ru.own.www.parameter.SystemParameters;

public class RouteService {
	/**
	 * 得到当前位置导航条
	 * @param categoryID
	 * @return
	 */
	public static String getRouteBar(int categoryID,int lanid) {
		CategoryService categoryService = new CategoryService();
		List<Integer> categoryIDs = categoryService.getAllFutherCategoryID(categoryID);  //得到所有的父类id和自己的id
		String route = "";
		for (Integer id : categoryIDs) {
			if(id == SystemParameters.CategoryRootID) {
				continue;
			}
			route += (categoryService.getCategory(id,lanid).getCategoryName()+"#");
		}
		route = route.substring(0,route.length()-1);
		return route;
	}
}
