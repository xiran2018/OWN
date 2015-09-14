package admin.ru.own.www.mybatis.dao;

import java.util.List;

import ru.own.www.entity.Product_SKU_ShowVO;
import admin.ru.own.www.entity.ProductSku;
import admin.ru.own.www.vo.SkuVO;


public interface ProductSkuDAO extends MyBatisMapper {
	List<SkuVO> getOneProductSKUs(int product_id);

	void insert(ProductSku sku);

	void delete(ProductSku sku);
	void deleteByProduct_id(int product_id);
	List<Integer> getSku_idsByProduct_id(int product_id);
	void update(ProductSku sku);

	List<Product_SKU_ShowVO> getOneProductSkusVOByPid(int pid);
}
