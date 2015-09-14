package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Currency;

public interface CurrencyDAO {

	List<Currency> getAll();

	void update(Currency c);

	void delete(int idcurrency);
	void insert(Currency c);

	List<Currency> getAllShowCurrency();


	Currency getDefaultCurrency();

	Currency getCurrencyById(int tempId);

}
