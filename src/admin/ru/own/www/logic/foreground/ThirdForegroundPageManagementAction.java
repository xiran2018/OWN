package admin.ru.own.www.logic.foreground;



import java.util.List;

import util.PageUtil;
import util.ParameterUtil;
import admin.ru.own.www.logic.category.CategoryService;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.DefaultLanguageUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ThirdForegroundPageManagementAction extends ActionSupport {
	private static final long serialVersionUID = -3469603066118603384L;
	private ParameterUtil parameterUtil = new ParameterUtil();
	private CategoryService categoryService = new CategoryService();
	private ProductFilterBaseService service = new ProductFilterManagementService();
	ProductFilter filter = ProductFilter.getImp();

	
	public String showAll() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		ExhibitionSize categoryExhibitionSize = service.getCategoryExhibitionSize(categoryid);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		
		ActionContext.getContext().put("totalNumber", computeShowAllTotalNumber());
		ActionContext.getContext().put("categoryid", categoryid);
		int lanID = DefaultLanguageUtil.getDefaultLanguageID(); //得到默认语言id
		ActionContext.getContext().put("route", RouteService.getRouteBar(categoryid,lanID));
		return "showAll";
	}
	
	private int computeShowAllTotalNumber() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		List<Integer> categoryIDs = categoryService.getAllSubCategoryID(categoryid);
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		int totalPageNumber = PageUtil.getTotalPageNumber(dao.getProductsCountByCategory(categoryIDs));
		dao.closeSession();
		return totalPageNumber;
	}
	
	public String findHotProducts() {
		ExhibitionSize categoryExhibitionSize = CategoryExhibitionImage.find(1);
		ActionContext.getContext().put("categoryid", -1);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		ActionContext.getContext().put("totalNumber",filter.getHotTotalNumber());
		return "findHotProducts";
	}
	
	
	public String findRecommendProducts() {
		ExhibitionSize categoryExhibitionSize = CategoryExhibitionImage.find(1);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		ActionContext.getContext().put("categoryid", -1);
		ActionContext.getContext().put("totalNumber",filter.getRecommendTotalNumber());
		return "findRecommendProducts";
	}
	public String findNewProducts() {
		ExhibitionSize categoryExhibitionSize = CategoryExhibitionImage.find(1);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		ActionContext.getContext().put("categoryid", -1);
		ActionContext.getContext().put("totalNumber",filter.getNewTotalNumber());
		return "findNewProducts";
	}
	
}
