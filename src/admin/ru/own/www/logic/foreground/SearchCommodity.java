package admin.ru.own.www.logic.foreground;

import java.util.List;
import java.util.Map;

abstract public class SearchCommodity extends ProductFilterBaseService {
	abstract List<Integer> getSearchCommodityIDs(Map<String, Object> args);
	
	static SearchCommodity getImp(){
		return new SearchCommodityImp();
	}
}
