package admin.ru.own.www.mybatis.dao;

import admin.ru.own.www.entity.SKU_AtrValue;

public interface Sku_AtrValueDAO extends MyBatisMapper{

	void insert(SKU_AtrValue s_a);

	void delete(int sku_id);
	
}
