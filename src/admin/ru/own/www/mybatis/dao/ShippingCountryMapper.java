package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingCountry;

public interface ShippingCountryMapper 
{

	Integer insertShippingCountry(ShippingCountry ship);

	List<ShippingCountry> getShippingCountryByPageNum(Pagination tempp);

	int getTotalNumberOfShippingCountry();

	ShippingCountry getShippingCountryById(Integer id);

	boolean modifyShippingCountry(ShippingCountry ship);

	boolean deleteShippingCountryById(Integer id);

	List<ShippingCountry> getAllShippingCountry();

	List<ShippingCountry> getAllShowShippingCountry();
	
}
