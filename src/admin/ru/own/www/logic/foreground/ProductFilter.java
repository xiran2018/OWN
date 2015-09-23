package admin.ru.own.www.logic.foreground;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.vo.ProductsVO;

public abstract class ProductFilter {
	abstract List<ProductsVO> getExhibitionProducts(Map<String, Object> argss);
	abstract List<ProductsVO> getProductsByAttributeArgs(Map<String, Object> argss);
	abstract List<ProductsVO> getHotProducts(Map<String, Object> argss);
	abstract List<ProductsVO> getRecommendProducts(Map<String, Object> argss);
	abstract List<ProductsVO> getNewProducts(Map<String, Object> argss);
	abstract int getHotTotalNumber();
	abstract int getNewTotalNumber();
	abstract int getRecommendTotalNumber();
	protected ProductFilterBaseService baseService = new ProductFilterBaseService();
	static ProductFilter getImp() {
		return new ProductFilterImp();
	}
	
}
