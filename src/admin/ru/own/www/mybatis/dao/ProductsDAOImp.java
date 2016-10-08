package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.Products;
import admin.ru.own.www.vo.ProductsVO;

public class ProductsDAOImp implements ProductsDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ProductsDAO productsDAO = sqlSession.getMapper(ProductsDAO.class);

	/**
	 * 具体的产品信息
	 */
	@Override
	public ProductsVO getInfo(int p_id) {
		ProductsVO pVo = productsDAO.getInfo(p_id);
		return pVo;
	}

	@Override
	public ProductsVO getImg(int p_id) {
		ProductsVO pVo = productsDAO.getImg(p_id);
		return pVo;
	}

	@Override
	public void update(Products products) {
		productsDAO.update(products);
		sqlSession.commit();
	}

	@Override
	public List<ProductsVO> getAllVOLimit(Map<String, Object> map) {
		List<ProductsVO> list = null;
		list = productsDAO.getAllVOLimit(map);
		for (ProductsVO productsVO : list) {
			productsVO.setShowImgURL();
		}
		return list;
	}

	@Override
	public int getCount() {
		int i = productsDAO.getCount();
		return i;
	}

	@Override
	public void deleteProductByProduct_id(int product_id) {
		productsDAO.deleteProductByProduct_id(product_id);
		sqlSession.commit();
	}

	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public int getProductsCountByCategory(List<Integer> categoryids) {
		return productsDAO.getProductsCountByCategory(categoryids);
	}


	@Override
	public List<ProductsVO> getProductsByLanguangeID(Map<String, Object> args) {
		List<ProductsVO> products = productsDAO.getProductsByLanguangeID(args);
		for (ProductsVO productsVO : products) {
			productsVO.setShowImgURL();
		}
		return products;
	}

	@Override
	public int getTotalNumberProductByParameters(Map<String, Object> map) {
		return productsDAO.getTotalNumberProductByParameters(map);
	}
	
}
