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
	public static String getRouteBar(int categoryID) {
		CategoryService categoryService = new CategoryService();
		List<Integer> categoryIDs = categoryService.getAllFutherCategoryID(categoryID);
		String route = "";
		for (Integer id : categoryIDs) {
			if(id == SystemParameters.CategoryRootID) {
				continue;
			}
			route += (categoryService.getCategory(id).getCategoryName()+">");
		}
		route = route.substring(0,route.length()-1);
		return route;
	}
}
