package admin.ru.own.www.logic.foreground;

import java.util.List;
import java.util.Map;

import util.PageUtil;
import util.ParameterUtil;

import admin.ru.own.www.util.DefaultLanguageUtil;
import admin.ru.own.www.vo.ProductsVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchCommodityAction extends ActionSupport {
	private static final long serialVersionUID = 1427691689919641927L;
	private List<ProductsVO> productsVOs;
	private String searchMsg;
	private final SearchCommodity service = SearchCommodity.getImp();
	private final ParameterUtil parameterUtil = new ParameterUtil();
	
	public String returnTotalNumber(){
		int totalPageNumber = computeTotalPageNumber();
		ActionContext.getContext().put("totalNumber", totalPageNumber);
		return "returnTotalNumber";
	}

	private int computeTotalPageNumber() {
		int lanID = DefaultLanguageUtil.getDefaultLanguageID();
		Map<String, Object> argsMap = initArgs(lanID, searchMsg).getSearchCountArgs();
		List<Integer> searchCommodityIDs = service.getSearchCommodityIDs(argsMap);
		int totalPageNumber = PageUtil.getTotalPageNumber(searchCommodityIDs.size(),PageUtil.getPageSize());
		return totalPageNumber;
	}
	
	public String getSearchCommodity() {
		int lanID = DefaultLanguageUtil.getDefaultLanguageID();
		Map<String, Object> argsMap = initArgs(lanID, searchMsg).getSearchArgs();
		List<Integer> searchCommodityIDs = service.getSearchCommodityIDs(argsMap);
		productsVOs = service.getProducts(searchCommodityIDs);
		return "getSearchCommodity";
	}

	
	public String showAll(){
		ExhibitionSize categoryExhibitionSize = CategoryExhibitionImage.find(3);
		ActionContext.getContext().put("imgsize", categoryExhibitionSize );
		int totalPageNumber = computeTotalPageNumber();
		ActionContext.getContext().put("totalNumber", totalPageNumber);
		ActionContext.getContext().put("searchMsg", searchMsg);
		return "showAll";
	}
	
	private FilterAndSearchArgs initArgs(int lanID, String searchMsg) {
		int startPrice = parameterUtil.getStartPriceParameter();
		int endPrice = parameterUtil.getEndPriceParameter();
		FilterAndSearchArgs args = new FilterAndSearchArgs(lanID,searchMsg,startPrice,endPrice);
		return args;
	}
	
	public List<ProductsVO> getProductsVOs() {
		return productsVOs;
	}

	public void setProductsVOs(List<ProductsVO> productsVOs) {
		this.productsVOs = productsVOs;
	}

	public String getSearchMsg() {
		return searchMsg;
	}

	public void setSearchMsg(String searchMsg) {
		this.searchMsg = searchMsg;
	}
}
