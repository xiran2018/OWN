package admin.ru.own.www.logic.foreground;

import java.util.List;


import util.PageUtil;
import util.ParameterUtil;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ThirdForegroundPageManagementAction extends ActionSupport {
	private static final long serialVersionUID = -3469603066118603384L;
	private ParameterUtil parameterUtil = new ParameterUtil();
	private ProductFilterBaseService service = new ProductFilterManagementService();
	public String showAll() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		ExhibitionSize categoryExhibitionSize = service.getCategoryExhibitionSize(categoryid);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		
		List<Integer> categoryIDs = service.getAllSubCategoryID(categoryid);
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		ActionContext.getContext().put("totalNumber",PageUtil.getTotalPageNumber(dao.getProductsCountByCategory(categoryIDs),PageUtil.getPageSize()));
		ActionContext.getContext().put("categoryid", categoryid);
		dao.closeSession();
		return "showAll";
	}

}
