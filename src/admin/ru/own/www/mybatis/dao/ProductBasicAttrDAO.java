package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;
import ru.own.www.entity.Product_Basic_Attr13_ShowVO;
import ru.own.www.entity.Product_Basic_Attr_ShowVO;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.vo.Product_Basic_Attr_VO;

public interface ProductBasicAttrDAO extends MyBatisMapper {
	void deleteBasicAttr(Product_Basic_Attr pba);
	void deleteBasicAttrByP_id(int p_id);
	int insertBasicAttr(Product_Basic_Attr pba);
	List<Product_Basic_Attr_VO> getOneProductBasicAttrVO(int p_id);
	/**
	 * 根据pid和atr_name_id得到该产品的atr_value_id列表，计算sku用
	 * @param attr
	 * @return
	 */
	List<Integer> getAttrValueIDListByPIDAndAttrNameID(Product_Basic_Attr pba);
	/**
	 * 得到文本类型的属性的属性值id
	 * @param product_id
	 * @return
	 */
	List<Integer> getTextAttrValueIdsByProduct_id(int product_id);
	/**
	 * 根据语言的信息和商品的信息，获取产品的属性和属性值
	 * @param id
	 * @param lanid
	 * @return
	 */
	List<Product_Basic_Attr_ShowVO> getOneProductBasicAttrVOByPidAndLanId(int id, int lanid);
	List<Product_Basic_Attr13_ShowVO> getOneProductBasicAttr13VOByPidAndLanId(int id, int lanid);
	List<Product_Basic_Attr13_ShowVO> getOneProductBasicAttr4VOByPidAndLanId(int id, int lanid);
	void updateAttrValueId(Product_Basic_Attr pba);
	void deleteBasicAttr13(Product_Basic_Attr pba);
}
