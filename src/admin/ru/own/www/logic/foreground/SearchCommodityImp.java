package admin.ru.own.www.logic.foreground;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.mybatis.dao.ProductMultiLanguageDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;

public class SearchCommodityImp extends SearchCommodity {

	@Override
	public List<Integer> getSearchCommodityIDs(Map<String, Object> args) {
		ProductMultiLanguageDAO productMultiLanguageDAO = (ProductMultiLanguageDAO) DAOFactory.get(ProductMultiLanguageDAO.class.getName());
		List<Integer> searchCommodity = productMultiLanguageDAO.getSearchCommodity(args);
		productMultiLanguageDAO.closeSession();
		return searchCommodity;
	}

}
