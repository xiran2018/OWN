package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.vo.AttributeVO;

public interface AttributeDAO extends MyBatisMapper {
	/**
	 * 得到一个category的属性名
	 * @param category_id
	 * @return
	 */
	List<AttributeVO> getOneCategoryAttribute(int category_id);
	List<AttributeVO> getOneMultiCategoryAttribute(Map<String, Object> args);//得到某一个分类的所有属性和属性值
	Attribute getOneAttribute(int attr_id);
	List<AttributeVO> getOneMultiCategorySearchAttribute(Map<String, Object> args);
}
