package admin.ru.own.www.logic.foreground;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.PageUtil;

import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.mybatis.dao.productfilter.ProductFilterDAO;
import admin.ru.own.www.vo.ProductsVO;

public class ProductFilterImp extends ProductFilter {

	@Override
	List<ProductsVO> getExhibitionProducts(Map<String, Object> argss) {
		ProductFilterDAO filterDAO = (ProductFilterDAO) DAOFactory.get(ProductFilterDAO.class.getName());
		List<Integer> productsIDs = filterDAO.getExhibitionProducts(argss);   //取出符合条件的商品的id
		filterDAO.closeSession();
		List<ProductsVO> productsVOs = baseService.getProducts(productsIDs);
		return productsVOs;
	}

	@Override
	List<ProductsVO> getProductsByAttributeArgs(Map<String, Object> argss) {
		ProductFilterDAO filterDAO = (ProductFilterDAO) DAOFactory.get(ProductFilterDAO.class.getName());
		List<Integer> productsIDs = filterDAO.getIndexProductsLimit(argss);
		filterDAO.closeSession();
		List<ProductsVO> productsVOs = baseService.getProducts(productsIDs);
		return productsVOs;
	}

	@Override
	List<ProductsVO> getHotProducts(Map<String, Object> argss) {
		argss.put("p_hot", "p_hot");
		return baseService.getProducts(getPushProductsLimit(argss));
	}

	@Override
	List<ProductsVO> getRecommendProducts(Map<String, Object> argss) {
		argss.put("p_recommend", "p_recommend");
		return baseService.getProducts(getPushProductsLimit(argss));
	}

	@Override
	List<ProductsVO> getNewProducts(Map<String, Object> argss) {
		argss.put("p_new", "p_new");
		return baseService.getProducts(getPushProductsLimit(argss));
	}
	
	private List<Integer> getPushProductsLimit(Map<String, Object> argss) {
		ProductFilterDAO filterDAO = (ProductFilterDAO) DAOFactory.get(ProductFilterDAO.class.getName());
		List<Integer> productsIDs = filterDAO.getPushProductsLimit(argss);
		filterDAO.closeSession();
		return productsIDs;
	}

	@Override
	int getHotTotalNumber() {
		Map<String, Object> args = makeArgs();
		args.put("p_hot", "p_hot");
		return dohandler(args);
	}
	@Override
	int getNewTotalNumber() {
		Map<String, Object> args = makeArgs();
		args.put("p_new", "p_new");
		return dohandler(args);
	}

	@Override
	int getRecommendTotalNumber() {
		Map<String, Object> args = makeArgs();
		args.put("p_recommend", "p_recommend");
		return dohandler(args);
	}
	
	private int dohandler(Map<String, Object> args){
		ProductFilterDAO filterDAO = (ProductFilterDAO) DAOFactory.get(ProductFilterDAO.class.getName());
		int totalNumber = filterDAO.getPushProductsTotalNumber(args);
		filterDAO.closeSession();
		return totalNumber;
	}
	
	private Map<String, Object> makeArgs() {
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("startPrice", 0);
		args.put("endPrice",Integer.MAX_VALUE);
		return args;
	}
	
}
