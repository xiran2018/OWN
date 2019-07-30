package admin.ru.own.www.mybatis.dao.productfilter;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.mybatis.dao.MyBatisMapper;
/**
 * 根据产品attribute,价格,查询产品 
 * @author Tian
 *
 */
public interface ProductFilterDAO extends MyBatisMapper {
	/**
	 * 首次进入查询界面显示的产品,无attribute
	 * @param args
	 * @return
	 */
	public List<Integer> getExhibitionProducts(Map<String, Object> args);
	/**
	 * 根据attribute查询产品
	 * @param args
	 * @return
	 */
	public List<Integer> getIndexProductsLimit(Map<String, Object> args);
	public List<Integer> getPushProductsLimit(Map<String, Object> args);
	public int getPushProductsTotalNumber(Map<String, Object> args);
	public abstract int getProductsCountByAttributeArgs(Map map);
}
