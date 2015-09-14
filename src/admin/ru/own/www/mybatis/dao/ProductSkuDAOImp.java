package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.entity.Product_SKU_ShowVO;
import admin.ru.own.www.entity.ProductSku;
import admin.ru.own.www.vo.SkuVO;

public class ProductSkuDAOImp implements ProductSkuDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ProductSkuDAO dao = sqlSession.getMapper(ProductSkuDAO.class);

	@Override
	public List<SkuVO> getOneProductSKUs(int product_id) {
		List<SkuVO> list = dao.getOneProductSKUs(product_id);
		return list;
	}
	public static void main(String[] args) {
		ProductSkuDAOImp skuDAOImp = new ProductSkuDAOImp();
//		List<SkuVO> oneProductSKUs = skuDAOImp.getOneProductSKUs(45);
		List<Integer> sku_idsByProduct_id = skuDAOImp.getSku_idsByProduct_id(45);
		System.out.println(sku_idsByProduct_id.size());
//		ProductSku sku = new ProductSku();
//		sku.setSku_id(18);
//		sku.setProduct_id(0);
//		skuDAOImp.insert(sku);
//		System.out.println(sku.getSku_id());
	}
	@Override
	public void insert(ProductSku sku) {
		dao.insert(sku);
		sqlSession.commit();
	}
	@Override
	public void delete(ProductSku sku) {
		dao.delete(sku);
		sqlSession.commit();
	}
	@Override
	public void update(ProductSku sku) {
		dao.update(sku);
		sqlSession.commit();
	}
	@Override
	public void deleteByProduct_id(int product_id) {
		dao.deleteByProduct_id(product_id);
		sqlSession.commit();
	}
	@Override
	public List<Integer> getSku_idsByProduct_id(int product_id) {
		List<Integer> list = dao.getSku_idsByProduct_id(product_id);
		return list;
	}
	@Override
	public void closeSession() {
		sqlSession.close();
	}
	@Override
	public List<Product_SKU_ShowVO> getOneProductSkusVOByPid(int pid) 
	{
		List<Product_SKU_ShowVO> list = dao.getOneProductSkusVOByPid(pid);
		return list;
	}
}
