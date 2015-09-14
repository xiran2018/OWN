package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.AttributeValueMultiLanguageShow;
import admin.ru.own.www.entity.BrandMultiLanguage;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.EditBrandMultiLanguage;
import admin.ru.own.www.entity.ProductAttrMultiLanguage;
import admin.ru.own.www.vo.AttributeValueVO;


public interface AttrValueMapper extends MyBatisMapper
{
	void insertForeignAttrValue(AttributeValueMultiLanguage cml);
	void delAttrValue(int id);
	/**
	 *得到一条atrvalue数据
	 * @param attr_value_id
	 * @return
	 */
	AttributeValueVO getAttributeValue(int attr_value_id);
	/**
	 * 得到一个属性值下所有的atrvalue数据
	 * @param attr_id
	 * @return
	 */
	List<AttributeValueVO> getAttributeValues(int attr_id);
	
	int insert(AttributeValue value);
	void delete(int attr_value_id);
	
	List<AttributeValueMultiLanguageShow> getAttrValuesMultiLangShowByAttrId(int id);

	AttributeValue getAttrValueByAttrId(int id);

	void attrValue_modify_basic(AttributeValue attributeValue);

	void attrValue_modify_xiangxi(AttributeValueMultiLanguage avml);
	
	void update(AttributeValue attributeValue);
	/**
	 * 根据产品id得到该产品文本框类型的属性值
	 * @param p_id
	 * @return
	 */
	List<Integer> getTextInputStyleAtrValueIDListByProductID(int p_id);
	/**
	 * 批量的到属性名的信息
	 * @param list
	 * @return
	 */
	List<AttributeValueVO> getAttributeValueBATCH(List<Integer> list);

}
