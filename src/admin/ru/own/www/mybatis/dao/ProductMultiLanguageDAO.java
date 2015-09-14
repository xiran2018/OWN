package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

public interface ProductMultiLanguageDAO  extends MyBatisMapper{
	List<Integer> getSearchCommodity(Map<String, Object> args);
}
