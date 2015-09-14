package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.ProductMultiLanguage;
import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.UpProduct;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.vo.ProductMultiLanguageVO;

public interface ProductOperationMapper extends MyBatisMapper 
{
	public void insertPorductByBatch(UpProduct upp);//上传商品(基本信息）
	
	public void insertProductMultiLanguage(ProductMultiLanguage pml); //上传商品多语言描述

	public void insertProductImage(productImage temppm); //上传商品图片
	
	List<ProductMultiLanguageVO> getAllLanguage(int product_id);

	public void update(ProductMultiLanguage entity);
	public void updateProductDesc(ProductMultiLanguage entity);
	public ProductMultiLanguage getProductMultiLanguage(int id);

	public Products getProductByPIdWithLanId(int id, int lanid);
}
