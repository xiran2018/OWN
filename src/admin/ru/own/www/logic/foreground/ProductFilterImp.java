package admin.ru.own.www.logic.foreground;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.mybatis.dao.productfilter.ProductFilterDAO;
import admin.ru.own.www.vo.ProductsVO;

public class ProductFilterImp extends ProductFilter {

	@Override
	List<ProductsVO> getExhibitionProducts(Map<String, Object> argss) {
		ProductFilterDAO filterDAO = (ProductFilterDAO) DAOFactory.get(ProductFilterDAO.class.getName());
		List<Integer> productsIDs = filterDAO.getExhibitionProducts(argss);
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
}
