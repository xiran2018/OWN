package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.AttributeValueMultiLanguage;

public interface AtrValueMultiLangDAO extends MyBatisMapper  {
	void update(AttributeValueMultiLanguage entity);
	void delAttrValueByAtrID(int atrID);
	void insertAttrValue(AttributeValueMultiLanguage entity);
	AttributeValueMultiLanguage getAttrValueByID(int ID);
	List<AttributeValueMultiLanguage> getAttrValueByAtrID(int atrID);
}
