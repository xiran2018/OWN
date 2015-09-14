package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.entity.Products;
import admin.ru.own.www.vo.ProductsVO;

public interface ProductsDAO extends MyBatisMapper {
	public List<ProductsVO> getAllVOLimit(Map<String, Integer> map);
	public ProductsVO getInfo(int p_id);
	public ProductsVO getImg(int p_id);
	void update(Products products);
	void deleteProductByProduct_id(int product_id);
	public int getCount();
	public int getProductsCountByCategory(List<Integer> categoryids);
	List<ProductsVO> getProductsByLanguangeID(Map<String, Object> args);
}
