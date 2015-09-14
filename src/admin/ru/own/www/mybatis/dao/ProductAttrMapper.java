package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.BrandMultiLanguage;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.EditBrandMultiLanguage;
import admin.ru.own.www.entity.ProductAttrMultiLanguage;
import admin.ru.own.www.entity.ProductAttrMultiLanguageShow;


public interface ProductAttrMapper 
{

	void insertForeignProductAttr(ProductAttrMultiLanguage cml);

	List<ProductAttrMultiLanguageShow> getProductAttrMultiLangShowByAttrId(int id);


	boolean updateBasicInfo(Attribute attr);

	boolean updateAttrXiangXiInfo(ProductAttrMultiLanguage pam);

	boolean updateAttrInputStyle(Attribute attr);

	List<Attribute> fetchGlobalAttr();

	boolean attributeDeleteByAttrId(int  id);



}
