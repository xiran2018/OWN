package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.ProductMultiLanguage;
import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.UpProduct;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.vo.ProductMultiLanguageVO;

public class ProductOperationDAOImp implements ProductOperationMapper {
	private SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ProductOperationMapper dao = session.getMapper(ProductOperationMapper.class);
	
	@Override
	public void insertPorductByBatch(UpProduct upp) {
	}

	@Override
	public void insertProductMultiLanguage(ProductMultiLanguage pml) {
		dao.insertProductMultiLanguage(pml);
		session.commit();
	}

	@Override
	public void insertProductImage(productImage temppm) {
	}

	@Override
	public List<ProductMultiLanguageVO> getAllLanguage(int product_id) {
		List<ProductMultiLanguageVO> allLanguage = dao.getAllLanguage(product_id);
		return allLanguage;
	}
	
	@Override
	public void closeSession() {
		if(session!=null) {
			session.close();
		}
	}
	
	public static void main(String[] args) {
		ProductOperationDAOImp daoImp =  new ProductOperationDAOImp();
		ProductMultiLanguage entity = new ProductMultiLanguage();
		entity.setId(140);
		entity.setProduct_detail_desc("ss");
		daoImp.updateProductDesc(entity);
		daoImp.closeSession();
	}

	@Override
	public void update(ProductMultiLanguage entity) {
		dao.update(entity);
		session.commit();
	}
	
	@Override
	public ProductMultiLanguage getProductMultiLanguage(int id) {
		return dao.getProductMultiLanguage(id);
	}

	@Override
	public void updateProductDesc(ProductMultiLanguage entity) {
		dao.updateProductDesc(entity);
		session.commit();
	}

	@Override
	public Products getProductByPIdWithLanId(int id, int lanid) {
		Products tempProduct=dao.getProductByPIdWithLanId(id,lanid);
		return tempProduct;
		
	}
	
}
