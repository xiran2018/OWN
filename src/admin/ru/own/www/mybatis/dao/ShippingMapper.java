package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;

public interface ShippingMapper 
{

	Integer insertShipping(Shipping ship);

	List<Shipping> getShippingByPageNum(Pagination tempp);

	int getTotalNumberOfShipping();

	Shipping getShippingById(Integer id);

	boolean modifyShipping(Shipping ship);

	boolean deleteShippingById(Integer id);

	List<Shipping> getAllShipping();
	
}
