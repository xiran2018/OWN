package admin.ru.own.www.logic.foreground;

import java.util.HashSet;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;

public class ProductFilterManagementService extends ProductFilterBaseService {
	/**
	 * 解析传来的Arg字段,得到所有的属性值id
	 * 
	 * @param args
	 * @return
	 */
	public Set<Integer> parseAttributeArgs(String args) {
		Set<Integer> atrValues = new HashSet<Integer>();
		if (args != null && !args.equals("")) {
			JSONArray keys = new JSONArray(args);
			for (int i = 0; i < keys.length(); i++) {
				// {"value":{"value":["18","17","16","14","15"]},"key":"13"}
				JSONObject values = keys.getJSONObject(i);
				// {"value":["18","17"]}
				JSONArray arrays = values.getJSONObject("value").getJSONArray("value");
				for (int j = 0; j < arrays.length(); j++) {
					atrValues.add(Integer.parseInt(arrays.get(j).toString()));
				}
			}
		}
		return atrValues;
	}
}
