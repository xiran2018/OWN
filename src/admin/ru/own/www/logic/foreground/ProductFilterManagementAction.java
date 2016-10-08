package admin.ru.own.www.logic.foreground;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import util.PageUtil;
import util.ParameterUtil;
import admin.ru.own.www.logic.category.CategoryService;
import admin.ru.own.www.vo.ProductsVO;

import com.opensymphony.xwork2.ActionSupport;

public class ProductFilterManagementAction extends ActionSupport {
	private static final long serialVersionUID = 8187034093036833236L;
	private CategoryService categoryService = new CategoryService();
	private List<ProductsVO> productsVOs;
	private int totalNumber;
	private final ParameterUtil parameterUtil = new ParameterUtil();
	private final ProductFilterManagementService service = new ProductFilterManagementService();
	private final ProductFilter filter = ProductFilter.getImp();
	/**
	 * 没有attribute值得时候（第一次进入页面）时的展示商品
	 * 
	 * @return
	 */
	public String getExhibitionProducts() {
		FilterAndSearchArgs args = initIndexArgs();
		productsVOs = filter.getExhibitionProducts(args.getArgs());
		return "getExhibitionProducts";
	}

	/**
	 * 每进行属性筛选的时候，需要重新计算totalNumber
	 * @return
	 */
	public String returnTotalNumber(){
		HttpServletRequest request = ServletActionContext.getRequest();
		boolean isChange = Boolean.parseBoolean(request.getParameter("isChange"));
		FilterAndSearchArgs args = initIndexArgsWithAttribute();
		int size = 0;
		if(isChange){
			size = ProductFilter.getImp().getProductsByAttributeArgs(args.getComputeCountArgs()).size();
		} else {
			size = ProductFilter.getImp().getExhibitionProducts(args.getComputeCountArgs()).size();
		}
		totalNumber = PageUtil.getTotalPageNumber(size);
		return "returnTotalNumber";
	}
	
	/**
	 * 根据attribute值选择展示商品
	 * 
	 * @return
	 */
	public String getProducts() {
		FilterAndSearchArgs args = initIndexArgsWithAttribute();
		productsVOs = filter.getProductsByAttributeArgs(args.getArgs());
		return "getProducts";
	}
	
	public String getHotProducts() {
		FilterAndSearchArgs args = initIndexArgs();
		productsVOs = filter.getHotProducts(args.getArgs());
		return "getHotProducts";
	}
	
	public String getRecommendProducts() {
		FilterAndSearchArgs args = initIndexArgs();
		productsVOs = filter.getRecommendProducts(args.getArgs());
		return "getRecommendProducts";
	}
	
	public String getNewProducts() {
		FilterAndSearchArgs args = initIndexArgs();
		productsVOs = filter.getNewProducts(args.getArgs());
		return "getNewProducts";
	}
	
	private FilterAndSearchArgs initIndexArgs() {
		int startPrice = parameterUtil.getStartPriceParameter();
		int endPrice = parameterUtil.getEndPriceParameter();
		int categoryid = parameterUtil.getCategoryIDParameter();
		List<Integer> categoryIDs = categoryService.getAllSubCategoryID(categoryid);  //所有的子分类
		FilterAndSearchArgs args = new FilterAndSearchArgs(categoryIDs,startPrice,endPrice);
		return args;
	}
	
	private FilterAndSearchArgs initIndexArgsWithAttribute() {
		FilterAndSearchArgs args = initIndexArgs();
		HttpServletRequest request = ServletActionContext.getRequest();
		String argsStr = request.getParameter("Args");
		args.setAttributes(service.parseAttributeArgs(argsStr));	
		return args;
	}

	public List<ProductsVO> getProductsVOs() {
		return productsVOs;
	}

	public void setProductsVOs(List<ProductsVO> productsVOs) {
		this.productsVOs = productsVOs;
	}

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
}
